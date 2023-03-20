import 'package:crud_user_simple/provider/users_provider.dart';
import 'package:crud_user_simple/routes/app_routes.dart';
import 'package:crud_user_simple/view/user_form.dart';
import 'package:crud_user_simple/view/user_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsersProvider(),
      child: MaterialApp(
        routes: {
          AppRoutes.HOME: (context) => const UserListView(),
          AppRoutes.USER_FORM: (context) => const UserForm(),
        },
      ),
    );
  }
}
