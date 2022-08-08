import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/home/view/widgets/bottom_sheet.dart';
import 'package:crud/home/view/widgets/image_widget.dart';
import 'package:crud/home/view/widgets/textfields_home.dart';
import 'package:crud/home/view_model/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final pov = context.read<HomeScreenPov>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: StreamBuilder(
        stream: pov.dbObj.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!.docs.first;
            return ListView(
              children: [
                const SizedBox(height: 30),
                ImageWidgetHome(image: data['image']),
                const SizedBox(height: 40),
                TextFieldWidgetHome(
                  icon: Icons.person,
                  size: size,
                  contoller: pov.nameController,
                  hint: data['name'],
                  type: TextInputType.name,
                ),
                TextFieldWidgetHome(
                  icon: Icons.lock_open_outlined,
                  size: size,
                  contoller: pov.nameController,
                  hint: data['password'],
                  type: TextInputType.name,
                ),
                TextFieldWidgetHome(
                  icon: Icons.email_outlined,
                  size: size,
                  contoller: pov.nameController,
                  hint: data['email'],
                  type: TextInputType.name,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(40),
                                )),
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return BottomSheetSettings(
                                    image: data['image'],
                                    name: data['name'],
                                    email: data['email'],
                                    document: data.id,
                                    password: data['password'],
                                  );
                                });
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.purple,
                            ),
                            child: const Center(
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => pov.logoutButton(context),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.purple,
                            ),
                            child: const Center(
                              child: Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     Routes.push(
      //       screen: AddEditScrren(type: ScreenType.add),
      //     );
      //   },
      //   label: const Text('Add Data'),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
