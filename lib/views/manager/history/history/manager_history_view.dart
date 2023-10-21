import 'package:flutter/material.dart';
import 'package:fmanager/views/manager/history/history/manager_history_logic.dart';
import 'package:fmanager/views/manager/history/history/utils/constants.dart';
import 'package:fmanager/views/manager/history/history/widgets/card_history.dart';
import 'package:get/get.dart';

class ManagerHistoryView extends GetView<ManagerHistoryLogic> {
  const ManagerHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: CardHistory(
                      title: histories[index]['title'],
                      creator: histories[index]['creator'],
                      date: histories[index]['date'],
                      hour: histories[index]['hour'],
                      room: histories[index]['room'],
                      image: histories[index]['image'],
                      theme: theme,
                    ),
                  ),
                  itemCount: histories.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
