import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:managment/Screens/login_screen.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:managment/widgets/bottomnavigationbar.dart';
import 'data/model/add_date.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:managment/pallete.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User user = snapshot.data as User; // Cast the data to User object
            return Bottom(user: user); // Pass the user object to Bottom widget
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
