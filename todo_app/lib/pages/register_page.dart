import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/todo_page.dart';

//TELA DE CADASTRO-------------------------------------------------------------------------------
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _register() async {
    try {
      //Criação do usuário no Firebase com email e senha
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      //Depois de registrar, redireciona para TodoPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TodoPage()),
      );
    } on FirebaseAuthException catch (e) {
      //Se der erro no cadastro, o e-mail já existe
      String message = '';
      if (e.code == 'email-already-in-use') {
        message = 'E-mail já cadastrado';
      } else if (e.code == 'week-password') {
        message = 'Senha muito fraca (no mínimo 6 caracteres)';
      } else {
        message = e.message ?? 'Erro ao cadastrar';
      }

      // Mostra alerta
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Campo de e-mail
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "E-mail"),
            ),
            const SizedBox(height: 10),

            //Campo de senha
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Senha"),
              obscureText: true, //deixa a senha oculta
            ),
            const SizedBox(height: 20),

            //Botão de cadastrar
            ElevatedButton(
              onPressed: _register,
              child: const Text('Cadastrar'),
            ),

            const SizedBox(height: 20),

            //Link para voltar ao Login
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Já tem conta? Faça o login'),
            ),
          ],
        ),
      ),
    );
  }
}
