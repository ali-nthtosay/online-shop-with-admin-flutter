import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login" ;

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>() ;
  final _emailController = TextEditingController() ;
  final _passwordController = TextEditingController() ;
  String _errMsg = "" ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page'),
      ),
      body: Center( child: Form(
        child: ListView(
          padding: EdgeInsets.all(20),
          shrinkWrap: true,
          children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email Address'
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Pls write valid email address' ;
                    }
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Password (at least 6 characters)'
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Pls write valid password' ;
                  }
                },
              ),
            ),
            ElevatedButton(onPressed: _authenticate, child: Text('Login as Admin')
            ),
            Padding(padding: EdgeInsets.all(5),
            child: Text(_errMsg, style: TextStyle(fontSize: 18, color: Colors.red),),
            )
          ],
        ),
      ),),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _authenticate() async {
  }
}



