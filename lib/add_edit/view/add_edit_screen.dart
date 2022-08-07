import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/add_edit/model/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEditScrren extends StatelessWidget {
  final ScreenType type;
  AddEditScrren({Key? key, required this.type}) : super(key: key);

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(type == ScreenType.add ? 'Add Data' : 'Edit Data'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                Colors.indigo,
              ],
              stops: [0.5, 1.0],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 6, color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 6, color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: (() {
                final user = UserData(
                  age: ageController.text,
                  id: DateTime.now().toString(),
                  name: nameController.text,
                );
                checkData(user);
              }),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.purple,
                      Colors.indigo,
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    'Submit Data',
                    style: GoogleFonts.cuprum(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  final String id = DateTime.now().toString();

  checkData(UserData user) async {
    final docUser = FirebaseFirestore.instance.collection('crud').doc('jhghj');
    final json = user.toJson();
    await docUser.set(json);
  }
}

enum ScreenType { add, edit }
