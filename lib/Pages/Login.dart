import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Widget/EmailText.dart';
import '../Widget/PasswordText.dart';
import '../Widget/SnackBar.dart';
import 'HomePage.dart';
import '../const.dart';
import 'Signup.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController Emailcontroller = TextEditingController();

  TextEditingController Passwordcontroller = TextEditingController();

  bool isLoading = false;

  signIn() async {
    setState(() {
      isLoading = true;
    });

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: Emailcontroller.text, password: Passwordcontroller.text);
    } on FirebaseAuthException catch (e) {
      ShowSnackBar(context, "ERROR :  ${e.code} ");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style:
              TextStyle(fontFamily: 'myfont', color: blackColor, fontSize: 40),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            Text(
              'Instagram',
              style: TextStyle(fontFamily: 'myfont', fontSize: 100),
            ),
            SizedBox(
              height: 70,
            ),
            Center(
              child: Emailfield(
                controller: Emailcontroller,
                hintText: 'Phone number, username or email address',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Passwordfield(
                controller: Passwordcontroller,
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 100),
              child: TextButton(
                onPressed: () {},
                child: Text('Forgotten Your Password?'),
              ),
            ),
            Container(
              width: 220,
              child: ElevatedButton(
                onPressed: () async {
                  await signIn();
                  if (!mounted) return;
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                },
                child: Text('Log in'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 100),
              child: Row(
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: secondaryColor),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignUp();
                      }));
                    },
                    child: Text('Sign up'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
