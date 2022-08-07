import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/const.dart';

class UserImagePov extends ChangeNotifier{
   String imageToString = encodeImage;

  pickImage() async {
    final imageFromGallery = await ImagePicker().pickImage(source: ImageSource.gallery);
    final bytes = File(imageFromGallery!.path).readAsBytesSync();
    imageToString = base64Encode(bytes);
    notifyListeners();
  }
}