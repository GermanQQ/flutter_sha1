import 'package:flutter/material.dart';
import 'package:flutter_sha1/FirstScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';


GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

void main(){
  runApp(
    MaterialApp(
      title: 'DATAWIZ',
      home: SignInDemo(),
    )
  );
}

class SignInDemo extends StatefulWidget {
  @override
  _SignInDemoState createState() => _SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo> {

  GoogleSignInAccount _currentUser;

  Future <void> _handleSignIn() async {
    try{
      await _googleSignIn.signIn();
    }catch(error){
      print(error);
    }
  }


  Widget roundedButton(){
    return GestureDetector(
      onTap: (){
        _handleSignIn();
      },
      child: Material(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent
            ),
            child: Center(
              child: Text(
                'Sign In Whith Google',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null){
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => FirstScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: roundedButton(),
      ),
    );
  }
}
