import 'dart:io';
import 'dart:math' as Math;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fmanager/utils/utils.dart';
import 'package:fmanager/views/common/common_alert.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class FirebaseMessagingSer extends GetxService {
  late final FirebaseMessaging messaging;
  late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late final AndroidNotificationChannel channel;

  @override
  void onInit() {
    super.onInit();
    messaging = FirebaseMessaging.instance;
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.max,
      description: 'This channel is used for important notifications.',
      enableLights: true,
      enableVibration: true,
      playSound: true,
      showBadge: true,
      sound: RawResourceAndroidNotificationSound('notification'),
    );

    getDeviceToken();
  }

  @override
  void onReady() async {
    super.onReady();
    // ! create 1 channel for Android
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await setupLocalPushNotification();
    await firebaseMessagingInit();
  }

  Future<void> firebaseMessagingInit() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage event) {
        RemoteNotification? notification = event.notification;
        AndroidNotification? android = event.notification?.android;

        if (notification != null && android != null) {
          pushNotification(
            id: Math.Random().nextInt(100),
            title: notification.title ?? '',
            body: notification.body ?? '',
            payload: event.data['route'],
            bigText: getImageUrl(notification) ?? 'FManger',
            showBigPicture: true,
          );
        }
      });
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      FirebaseMessaging.onMessage.listen((RemoteMessage event) {
        RemoteNotification? notification = event.notification;
        AndroidNotification? android = event.notification?.android;

        if (notification != null && android != null) {
          pushNotification(
            id: Math.Random().nextInt(100),
            title: notification.title ?? '',
            body: notification.body ?? '',
            payload: event.data['route'],
            showBigPicture: true,
            bigText: getImageUrl(notification) ?? 'FManger',
          );
        }
      });
    } else {
      return CommonAlert.showDefault('Permission denied', 'You can not receive notifications');
    }
  }

  Future<void> setupLocalPushNotification() async {
    // ! This set up is for Android
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('mipmap/ic_launcher');
    // ! This set up is for iOS :))
    const DarwinInitializationSettings darwinInitializationSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    // ! This set up for all platform
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: androidInitializationSettings,
        iOS: darwinInitializationSettings,
        linux: null,
        macOS: null,
      ),
    );
  }

  Future<void> pushNotification({
    required int id,
    required String title,
    required String body,
    required String bigText,
    bool showBigPicture = false,
    String? payload,
    List<AndroidNotificationAction>? actions,
  }) async {
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelShowBadge: true,
      channelDescription: channel.description,
      actions: actions,
      when: DateTime.now().millisecondsSinceEpoch,
      visibility: NotificationVisibility.public,
      importance: Importance.max,
      channelAction: AndroidNotificationChannelAction.createIfNotExists,
      playSound: true,
      sound: const RawResourceAndroidNotificationSound('notification'),
      enableLights: true,
      showWhen: true,
      showProgress: true,
      subText: 'This is a subText',
      styleInformation: await bigPictureStyleInformation(title, body, bigText, showBigPicture),
      priority: Priority.max,
      icon: 'mipmap/ic_launcher',
      largeIcon: const DrawableResourceAndroidBitmap('mipmap/ic_launcher'),
      fullScreenIntent: true,
    );

    // ! This set up is for iOS :))
    DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails();

    // ! This set up for all platform
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
      linux: null,
      macOS: null,
    );

    // ? Show notification
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  Future<String?> getDeviceToken() async {
    final String? token = await messaging.getToken();
    MyLogger().i('FirebaseMessagingSer: getDeviceToken: $token');
    return token;
  }

  Future<BigPictureStyleInformation?> bigPictureStyleInformation(
    String title,
    String body,
    String bigText,
    bool showBigPicture,
  ) async {
    if (RegExpConstants.isValidUrl(bigText) && showBigPicture) {
      final String bigPicturePath = await _downloadAndSaveFile(bigText, 'notification');
      final FilePathAndroidBitmap filePathAndroidBitmap = FilePathAndroidBitmap(bigPicturePath);
      return BigPictureStyleInformation(
        (showBigPicture ? filePathAndroidBitmap : null) as AndroidBitmap<Object>,
        contentTitle: title,
        htmlFormatContentTitle: true,
        summaryText: body,
        htmlFormatSummaryText: true,
        // largeIcon: icon for top
      );
    }
    return null;
  }

  String? getImageUrl(RemoteNotification notification) {
    if (Platform.isIOS && notification.apple != null) return notification.apple?.imageUrl;
    if (Platform.isAndroid && notification.android != null) return notification.android?.imageUrl;
    return null;
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
}
