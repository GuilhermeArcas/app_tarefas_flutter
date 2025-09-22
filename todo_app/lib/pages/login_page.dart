import 'package:flutter/material.dart';
import 'todo_page.dart';
import 'register_page.dart';
import 'forgot_password_page.dart';

//TELA DE LOGIN----------------------------------------------------------
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (_formKey.currentState!.validate()) {
      String email = emailController.text;
      String password = passwordController.text;

      if (email == "teste@gmail.com" && password == "123456") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const TodoPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('E-mail ou senha incorretos!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "E-mail",
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) => v != null && v.contains("@")
                      ? null
                      : "Digite um e-mail válido",
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: "Senha",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (v) =>
                      v != null && v.length >= 6 ? null : 'Senha inválida',
                ),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: login, child: const Text("Entrar")),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: const Text("Não tem conta? Cadastre-se"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordPage(),
                      ),
                    );
                  },
                  child: const Text("Esqueci minha senha"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
