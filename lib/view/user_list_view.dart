import 'package:crud_user_simple/provider/users_provider.dart';
import 'package:crud_user_simple/routes/app_routes.dart';
import 'package:crud_user_simple/widgets/user_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserListView extends StatelessWidget {
  const UserListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsersProvider users = Provider.of(context);
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
        child: const Text('Adicionar Usuário'),
        onPressed: () => Navigator.of(context).pushNamed(AppRoutes.USER_FORM),
      ),
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (context, index) => UserListTile(
          user: users.byIndex(index),
        ),
      ),
    );
  }
}
