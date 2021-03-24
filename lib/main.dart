import 'package:flutter/material.dart';
import 'package:flutter_sha1/FirstScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';


//Що стосується коду авторизації, коментарі не додав, бо сам толком не розумів що пишу
//Авторизація писалась під android
//Тестити тільки на андроїді

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);


void main(){ //Головна фунція запуска застосунку
  runApp(
    MaterialApp(
      title: 'DATAWIZ',
      home: SignInDemo(), //Головний віджет
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


  Widget roundedButton(){ //Створив віджет кнопки "Вхід"
    return GestureDetector(
      onTap: (){    //
        _handleSignIn(); //Додав функцію при натиску кнопки
      },
      child: Material(
        child: Padding( //Дав віступи для кнопки
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            width: MediaQuery.of(context).size.width, //розтянув кнопку по вільній площі
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), //Заокруглив края кнопки
              color: Colors.blueAccent
            ),
            child: Center( //Відформатувував текст по центру кнопки
              child: Text(
                'Sign In With Google',
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
