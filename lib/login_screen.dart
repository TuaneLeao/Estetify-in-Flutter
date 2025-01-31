import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isErrorVisible = false;

  void _clearError() {
    setState(() {
      _isErrorVisible = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_clearError);
    _passwordController.addListener(_clearError);
  }

  void _login() { 
    
    TextEditingValue username = _usernameController.value; 
    TextEditingValue password = _passwordController.value;

    if(password.text == '1234' && username.text == 'admin'){
      Navigator.pushReplacementNamed(context, '/home');
    }else{
     setState(() {
     _isErrorVisible = true;
    });}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_isErrorVisible)
              const Text(
                'Nome de usuário ou senha incorretos',
                style: TextStyle(color: Colors.red),
              ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'nome'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'senha'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}