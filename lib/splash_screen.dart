import 'dart:async';
import 'package:flutter/material.dart';
import 'Authenticationn/authentication.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 8), () async {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (c) => const AuthenticationScreen()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body:Container(
          decoration:const BoxDecoration(
              gradient:LinearGradient(
                  begin:Alignment.topRight,
                  end:Alignment.bottomLeft,
                  colors:[
                    Colors.amber,
                    Colors.cyan
                  ]
              )
          ),
          child:Column(
            children: [
              SizedBox(height:size.height*0.1),
              Image.asset("images/DiuLogo_2.png"),
              const Spacer(),
              const Text('Savor Success, Order DIU Food!',
              style:TextStyle(
                color:Colors.white,
                fontSize:15,
                fontFamily:'Lobster'
              )),
              const SizedBox(height:15)
            ],
          ),
      )
    );
  }
}
