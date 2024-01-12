import 'package:flutter/material.dart';
import 'HomePage/Restaurants/add_payment.dart';
import 'HomePage/cart.dart';
import 'HomePage/check_out.dart';
import 'HomePage/home_page.dart';
import 'splash_screen.dart';
//firebase packages
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// hive packages
import 'package:hive_flutter/hive_flutter.dart';

Future<void>main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // initialize hive
  await Hive.initFlutter();
  // Open a box
  await Hive.openBox('paymentMethod');
  await Hive.openBox('snackBar');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner:false,
        title: 'Diu Food-Hub Seller app',
        home:SplashScreen()
    );
  }
}

