import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_telescope_product/auth/auth_service.dart';
import 'package:go_router/go_router.dart';

import 'login_page.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = "/" ;
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),
      actions: [
        IconButton(
            onPressed: (){
              AuthService.logout().then((value) => context.goNamed(LoginPage.routeName)) ;
            }
            , icon: Icon(Icons.logout))
      ],
      ),
      body: Center(
        child: Text('Dashboard Page'),
      ),
    );
  }
}
