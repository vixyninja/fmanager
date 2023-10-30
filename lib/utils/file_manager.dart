import 'package:image_picker/image_picker.dart';

class FileManager {
  Future<XFile?> pickImage() async {
    try {
      final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxHeight: 1920,
        maxWidth: 1080,
        requestFullMetadata: true,
      );
      if (image != null) {
        return image;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Lỗi khi chọn ảnh');
    }
  }

  Future<List<XFile>> pickMultipleImage() async {
    try {
      final List<XFile> images = await ImagePicker().pickMultiImage(
        imageQuality: 100,
        maxHeight: 1920,
        maxWidth: 1080,
        requestFullMetadata: true,
      );
      if (images.isNotEmpty) {
        return images;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Lỗi khi chọn ảnh');
    }
  }

  Future<XFile?> pickImageFromCamera() async {
    try {
      final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
        maxHeight: 1920,
        maxWidth: 1080,
        requestFullMetadata: true,
      );
      if (image != null) {
        return image;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Lỗi khi chụp ảnh');
    }
  }
}
