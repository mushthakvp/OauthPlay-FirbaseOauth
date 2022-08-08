import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePovHome extends ChangeNotifier {
  String imageToString = '';

  pickImage() async {
    final imageFromGallery = await ImagePicker().pickImage(source: ImageSource.gallery);
    final bytes = File(imageFromGallery!.path).readAsBytesSync();
    imageToString = base64Encode(bytes);
    notifyListeners();
  }
}
