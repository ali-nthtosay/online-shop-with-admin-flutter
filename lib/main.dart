import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_ecommerce_telescope_product/pages/dashboard_page.dart';
import 'package:go_router/go_router.dart';
void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class DefaultFirebaseOptions {
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    routes: [
          GoRoute(
              path: DashboardPage.routeName,
            name:  DashboardPage.routeName,
            builder: (context, state) => const DashboardPage()
          )
    ]
  ) ;
}
