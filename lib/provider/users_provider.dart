import 'dart:math';

import 'package:crud_user_simple/data/fake_users_data.dart';
import 'package:crud_user_simple/model/user_model.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier {
  final Map<String, User> _items = {...FAKE_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }
    if (user.id != null &&
        user.id!.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(
        user.id!,
        (value) => User(
          id: user.id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    }

    notifyListeners();
  }

  void remove(User user) {
    if (user.id != null) {
      _items.remove(user.id);
    }
    notifyListeners();
  }
}
