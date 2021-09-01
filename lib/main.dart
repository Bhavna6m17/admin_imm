import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ia_admin/Forms/SellerForm.dart';
import 'package:ia_admin/Forms/UserDetails.dart';
import 'package:ia_admin/provider/auth_provider.dart';
import 'package:ia_admin/screen/Home.dart';
import 'package:ia_admin/screen/SplashScreen.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Hello());
}

class Hello extends StatefulWidget {

  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return  MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_)=>AuthProvider())

              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: SplashScreen(),
              ),
            );
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return CircularProgressIndicator();
        },
      );

  }
}