import 'package:crud_user_simple/model/user_model.dart';
import 'package:crud_user_simple/routes/app_routes.dart';
import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  final User user;
  const UserListTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM,
                arguments: user,
              );
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
