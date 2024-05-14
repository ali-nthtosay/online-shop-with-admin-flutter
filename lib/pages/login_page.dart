import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_firebase_ecommerce_telescope_product/auth/auth_service.dart';
import 'package:flutter_firebase_ecommerce_telescope_product/pages/dashboard_page.dart';
import 'package:go_router/go_router.dart';

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
        key: _formKey,
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
    if(_formKey.currentState!.validate()){
      EasyLoading.show(
        status: 'Please Wait'
      );
      final email = _emailController.text ;
      final pass = _passwordController.text ;
      try{
            final status = await AuthService.loginAdmin(email, pass) ;
            EasyLoading.dismiss() ;
            if(status){
              context.goNamed(DashboardPage.routeName) ;
            } else {
              await AuthService.logout() ;
              setState(() {
                _errMsg = 'This is not an Admin' ;
              });
            }
      } on FirebaseAuthException catch(error) {
          EasyLoading.dismiss();
          setState(() {
            _errMsg = error.message ?? "An error occurred"; // Handle null message
          });
      }
    }
  }
}



