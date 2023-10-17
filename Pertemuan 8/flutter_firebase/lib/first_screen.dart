import 'package:flutter/material.dart';
import 'package:flutter_firebase/login_page.dart';
import 'package:flutter_firebase/sign_in.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blue, Colors.purple],
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl!),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              Text(
                email!,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }), ModalRoute.withName('/'));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Sign Out',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
