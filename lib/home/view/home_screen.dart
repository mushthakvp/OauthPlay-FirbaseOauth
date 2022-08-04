import 'package:crud/add_edit/view/add_edit_screen.dart';
import 'package:flutter/material.dart';
import '../../routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Routes.nextPage(
            context: context,
            screen: AddEditScrren(type: ScreenType.add),
          );
        },
        label: const Text('Add Data'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
