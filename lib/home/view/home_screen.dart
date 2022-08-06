import 'package:crud/add_edit/view/add_edit_screen.dart';
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
        title: const Text('Oauth'),
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
        actions: [
          IconButton(
            onPressed: () {
              context.read<HomeScreenPov>().logoutButton(context);
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
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
