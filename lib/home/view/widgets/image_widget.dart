import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../signin_signup/viewmodel/userimage_provider.dart';

class ImageWidgetHome extends StatelessWidget {
  final String image;
  const ImageWidgetHome({Key? key, required this.image}) : super(key: key);

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
                  const Base64Decoder().convert(image),
                ),
              ),
              // Positioned(
              //   bottom: 0,
              //   right: -30,
              //   child: RawMaterialButton(
              //     onPressed: () {
              //       value.pickImage();
              //     },
              //     elevation: 4,
              //     fillColor: Colors.white,
              //     padding: const EdgeInsets.all(8),
              //     shape: const CircleBorder(),
              //     child: const Icon(Icons.camera_alt_outlined),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
