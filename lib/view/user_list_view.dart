import 'package:crud_user_simple/data/fake_users_data.dart';
import 'package:crud_user_simple/widgets/user_list_tile.dart';
import 'package:flutter/material.dart';

class UserListView extends StatelessWidget {
  const UserListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = {...FAKE_USERS};
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => UserListTile(
          user: users.values.elementAt(index),
        ),
      ),
    );
  }
}
