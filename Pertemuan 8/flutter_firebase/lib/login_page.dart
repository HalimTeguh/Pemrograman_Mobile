import 'package:flutter/material.dart';
import 'package:flutter_firebase/first_screen.dart';
import 'package:flutter_firebase/sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                FlutterLogo(size: 150,),
                SizedBox(height: 50,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black38, width: 2)
                  ),
                  child: TextButton(
                    onPressed: (){
                      signInWithGoogle().then((result) {
                        if(result != null){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder:(context) {
                              return FirstScreen();
                            },)
                          );
                        }
                      });
                    }, 
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Sign in With Google', style: TextStyle(color: Colors.black54, fontSize: 15),),
                    )
                  ),
                ),
                
                // _signInButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _signInButton() {
    return TextButton(
      onPressed: () {
        signInWithGoogle().then((result) {
          if(result != null){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return FirstScreen();
              })
            );
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage('assets/google.png'), height: 35.0,),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('Sign in with Google',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey
              ),),
            )
          ],
        ),
      ));
  }
}
