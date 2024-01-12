import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../HomePage/home_page.dart';
import 'forgot_password.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

 
  final GlobalKey<FormState>formState = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();

  login(String email, String password)async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email:email, password:password);
    User? user = userCredential.user;
    if(user != null){
      Navigator.push(context,MaterialPageRoute(builder:(c)=>const HomeScreen()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:const EdgeInsets.all(15.0),
        child:Form(
          key:formState,
          child:Column(
            children:[
              const SizedBox(height:50.0),
              TextFormField(
                  controller: _emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Email",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.cyan)),
                      errorBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:const BorderSide(color:Colors.red))),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'enter e-mail address';
                    } else {
                      return null;
                    }
                  }
              ),
              const SizedBox(height:15.0),
              TextFormField(
                  controller: _passwordTextEditingController,
                  obscureText:true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Password",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.cyan)),
                      errorBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:const BorderSide(color:Colors.red))),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'enter password';
                    } else {
                      return null;
                    }
                  }
              ),
              const SizedBox(height:25),
              SizedBox(
                width:double.infinity,
                height:50,
                child: ElevatedButton(
                    onPressed: () {
                      if(formState.currentState!.validate()){
                        login(_emailTextEditingController.text,_passwordTextEditingController.text);
                        _emailTextEditingController.clear();
                        _passwordTextEditingController.clear();

                      }
                    },
                    style: TextButton.styleFrom(
                        backgroundColor:Colors.amber,
                        shape:RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(10.0)
                        )
                    ),
                    child: const Text('Login',style:TextStyle(color:Colors.white)),
                ),
              ),
              const SizedBox(height:15),
              TextButton(onPressed:(){
                Navigator.push(context,MaterialPageRoute(builder:(c)=>const ForgotPasswordScreen()));
              }, child:const Text('Forgot your password?')),
            ]
          )
        )
      ),
    );
  }
}
