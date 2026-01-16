
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasked/firebase_options.dart';
import 'package:tasked/home/home_screen.dart';
import 'package:tasked/my_theme_data.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();// use widget flutter // لم تستخدم ال main ويكون فيه async 
  //  await FirebaseFirestore.instance.disableNetwork();
     await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) =>  HomeScreen(),
      },
     
      theme: MyThemeData.lightTheme,
    );
  }
}







