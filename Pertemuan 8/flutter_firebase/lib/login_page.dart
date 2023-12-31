import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/first_screen.dart';
import 'package:flutter_firebase/register_page.dart';
import 'package:flutter_firebase/sign_in.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onChanged: (value) {},
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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onChanged: (value) {},
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("don't have an account yet?"),
                      TextButton(
                          style: ButtonStyle(),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return RegisterPage();
                            }));
                          },
                          child: Text("Register")),
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
                        signInWithEmailPassword(
                                email: emailController.value.text,
                                password: passwordController.value.text)
                            .then((result) {
                          if (result != null) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return FirstScreen();
                              },
                            ));
                          } else {
                            sweatAlert(context);
                          }
                        });
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 2,
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Text("or"),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 2,
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black38, width: 2)),
                  child: TextButton(
                      onPressed: () {
                        signInWithGoogle().then((result) {
                          if (result != null) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return FirstScreen();
                              },
                            ));
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Sign in With Google',
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
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

  void sweatAlert(BuildContext context) {
    Alert(
        context: context,
        type: AlertType.success,
        title: "Login Berhasil",
        desc: "Selamat anda berhasil login",
        buttons: [
          DialogButton(
              child: Text('Selanjutnya'),
              onPressed: () => Navigator.pop(context))
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
