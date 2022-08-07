import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../signin_signup/viewmodel/userimage_provider.dart';

class ImageWidgetHome extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> map;
  const ImageWidgetHome({Key? key, required this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserImagePov>(
      builder: (context, value, child) => Center(
        child: SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 60,
                backgroundImage: MemoryImage(
                  const Base64Decoder().convert(map['image']),
                ),
              ),
              Positioned(
                bottom: 0,
                right: -30,
                child: RawMaterialButton(
                  onPressed: () {
                    value.pickImage();
                  },
                  elevation: 4,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(8),
                  shape: const CircleBorder(),
                  child: const Icon(Icons.camera_alt_outlined),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
