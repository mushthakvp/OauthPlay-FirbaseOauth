import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/add_edit/view/add_edit_screen.dart';
import 'package:crud/home/view/widgets/image_widget.dart';
import 'package:crud/home/view_model/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Oauth'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<HomeScreenPov>().logoutButton(context);
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: context.read<HomeScreenPov>().dbObj.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!.docs.first;
            return ListView(
              children: [
                ImageWidgetHome(map: data),
                Text(data['name']),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Routes.push(
            screen: AddEditScrren(type: ScreenType.add),
          );
        },
        label: const Text('Add Data'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
