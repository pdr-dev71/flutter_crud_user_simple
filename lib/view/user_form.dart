import 'dart:math';

import 'package:crud_user_simple/model/user_model.dart';
import 'package:crud_user_simple/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final User user = ModalRoute.of(context)?.settings.arguments as User;
    _loadFormData(user);
  }

  void _loadFormData(User user) {
    _formData['id'] = user.id ?? "";
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
          child: const Text('Salvar Usuário'),
          onPressed: () {
            final isValid = _formKey.currentState!.validate();
            if (isValid) {
              _formKey.currentState!.save();
              Provider.of<UsersProvider>(context, listen: false).put(
                User(
                  id: Random().nextDouble().toString(),
                  name: _formData['name'] ?? "",
                  email: _formData['email'] ?? "",
                  avatarUrl: _formData['avatarUrl'] ?? "",
                ),
              );
              Navigator.of(context).pop();
            }
          }),
      appBar: AppBar(
        title: const Text('Formulario de usuario '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome inválido';
                  }
                  if (value.trim().length < 3) {
                    return 'Nome muito pequeno';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'E-mail inválido';
                  }
                  if (!value.contains('@')) {
                    return 'E-mail inválido';
                  }
                  return null;
                },
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(labelText: 'URL do avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
