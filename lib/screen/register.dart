import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../homepage.dart';
import 'login.dart';
import 'profile.dart';
import 'firstpage.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Scaffold(
                appBar: AppBar(
                  title: Text("Error"),
                  backgroundColor: Colors.black,
                  ),
                body: Center(child: Text("${snapshot.error}"),
                ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Regiter"),
                backgroundColor: Colors.black,
              ),
              body: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Email Required"),
                              EmailValidator(errorText: "Invalid Form")
                            ]),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (String? email) {
                              profile.email = email!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Password", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: RequiredValidator(errorText: "Password Required"),
                              obscureText: true,
                              onSaved: (String? password) {
                              profile.password = password!;
                            },
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              child: Text("Register",style: TextStyle(fontSize: 20)),
                              onPressed: () async{
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState?.save();
                                  try{
                                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                      email: profile.email, 
                                      password: profile.password
                                    ).then((value){
                                      formKey.currentState?.reset();
                                      Fluttertoast.showToast(
                                        msg: "Account Created",
                                        gravity: ToastGravity.TOP
                                      );
                                      Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context){
                                          return HomePage();
                                      }));
                                    });
                                  }on FirebaseAuthException catch(e){
                                      print(e.code);
                                      String message;
                                      if(e.code == 'email-already-in-use'){
                                          message = "Email Already In Used";
                                      }else if(e.code == 'weak-password'){
                                          message = "Password Require More Than 6 Characters";
                                      }else{
                                          message = e.message!;
                                      }
                                      Fluttertoast.showToast(
                                        msg: message,
                                        gravity: ToastGravity.CENTER
                                      );
                                  }
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Colors.black),
                              ),
                              icon: Icon(Icons.login),
                              label: Text("Login", style: TextStyle(fontSize: 20)),
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginScreen();
                                }));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
