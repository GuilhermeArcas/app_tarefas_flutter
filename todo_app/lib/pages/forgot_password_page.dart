import 'package:flutter/material.dart';

//TELA DE RECUPERAÇÃO DE SENHA-----------------------------------------------------------
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recuperar Senha')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Digite seu e-mail para recuperar a senha:'),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: "E-mail",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("E-mail de recuperação enviado!"),
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text('Enviar E-mail'),
            ),
          ],
        ),
      ),
    );
  }
}
