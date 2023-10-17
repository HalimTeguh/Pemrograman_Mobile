import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/first_screen.dart';
import 'package:flutter_firebase/login_page.dart';
import 'package:flutter_firebase/sign_in.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? get _errorEmail {
    final email = emailController.value.text;

    if(email.isEmpty){
      return "Can't be empty";
    }

    if(!email.contains("@")){
      return "Email format is invalid";
    }

    return null;
  }

  String? get _errorPassword {
    final password = passwordController.value.text;

    if(password.isEmpty){
      return "Can't be empty";
    }

    if(password.length < 4){
      return "Too Short";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(
                  size: 150,
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Email",
                        errorText: _errorEmail,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onChanged: (value) {
                      setState(() => value);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Password",
                        errorText: _errorPassword,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onChanged: (value) {
                      setState(() => value);
                    },
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      TextButton(
                          style: ButtonStyle(),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return LoginPage();
                            }));
                          },
                          child: Text("Sign In")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.blue, Colors.purple])),
                  child: TextButton(
                      onPressed: () {
                        print(emailController.value.text);
                        print(passwordController.value.text);
                        signUp(
                                email: emailController.text,
                                password: passwordController.text)
                            .then(
                          (result) {
                            if (result != null) {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }));
                            } else {
                              sweatAlert(
                                  context,
                                  AlertType.warning,
                                  "Register Gagal",
                                  "Silahkan coba register kembali coy");
                            }
                          },
                        );
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                ),

                // _signInButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sweatAlert(
      BuildContext context, AlertType status, String title, String desc) {
    Alert(context: context, type: status, title: title, desc: desc, buttons: [
      DialogButton(
          child: Text('Selanjutnya'), onPressed: () => Navigator.pop(context))
    ]);
  }

  Widget _signInButton() {
    return TextButton(
        onPressed: () {
          signInWithGoogle().then((result) {
            if (result != null) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return FirstScreen();
              }));
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/google.png'),
                height: 35.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              )
            ],
          ),
        ));
  }
}
