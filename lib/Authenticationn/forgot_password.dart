import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController _newPasswordTextEditingController = TextEditingController();
  final TextEditingController _confirmPasswordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom !=0;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body:Padding(
            padding:const EdgeInsets.all(10.0),
            child:
                Form(
                  key:formState,
                  child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView(
                          primary:false,
                          shrinkWrap:true,
                          children: [
                            //const SizedBox(height: 30),
                            const Text(
                              'Create new password',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const Text('Create new password for your account.'),
                            const SizedBox(height:20),
                            TextFormField(
                                controller: _newPasswordTextEditingController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText:true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "New Password",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(color: Colors.amber)),
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
                            const SizedBox(height:20),
                            TextFormField(
                                controller: _confirmPasswordTextEditingController,
                                obscureText:true,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Confirm New Password",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(color: Colors.amber)),
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
                          ],
                        ),
                        const Spacer(),
                        Visibility(
                          visible:!isKeyboard,
                          child: SizedBox(
                              width:double.infinity,
                              height:50,
                              child: ElevatedButton(
                              onPressed: () {
                              if(formState.currentState!.validate()){
                              print("validate");
                              _newPasswordTextEditingController.clear();
                              _confirmPasswordTextEditingController.clear();
                              }
                              },
                              style: TextButton.styleFrom(
                              backgroundColor:Colors.amber,
                              shape:RoundedRectangleBorder(
                                  borderRadius:BorderRadius.circular(30.0)
                              )
                              ),
                              child: const Text('Continue',style:TextStyle(color:Colors.white)),
                                                )),
                        )
                      ],
                  )
                )));
  }
}
