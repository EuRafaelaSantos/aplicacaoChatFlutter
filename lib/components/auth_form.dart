import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _submit() {
    _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                if (_formData.isSigup)
                  TextFormField(
                    key: const ValueKey('name'),
                    initialValue: _formData.name,
                    onChanged: (name) => _formData.name = name,
                    decoration: const InputDecoration(labelText: 'Usuário'),
                  ),
                TextFormField(
                  key: const ValueKey('email'),
                  initialValue: _formData.email,
                  onChanged: (email) => _formData.email = email,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  key: const ValueKey('password'),
                  initialValue: _formData.password,
                  onChanged: (password) => _formData.password = password,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Senha'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  onPressed: _submit,
                  child: Text(
                    _formData.isLogin ? 'Acessar' : 'Cadastrar',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _formData.toggleAuthMode();
                    });
                  },
                  child: Text(
                    _formData.isLogin ? 'Criar Usuário' : 'Já é usuário?',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
