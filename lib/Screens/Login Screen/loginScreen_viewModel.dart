import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Home%20Screen/homeScreen_view.dart';
import 'package:stacked/stacked.dart';

class LoginScreenViewModel extends BaseViewModel{
  bool isChecked = false;
  bool obscureText = true;
  String text = "";
  TextEditingController mail = TextEditingController();
  TextEditingController pass = TextEditingController();

//Fire Base Login Authentication Function
  loginUser (BuildContext context) async {
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: mail.text,
    password: pass.text
  );
  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreenView()));
  text = "";
  print(text);
  notifyListeners();
}
 on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
    text = "No User Found";
    notifyListeners();
  } 
  else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
    text = "Password doesn't match";
    notifyListeners();
  }
  else{
    text = e.toString();
  }
}
if(text.isNotEmpty){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Text(
          text,
          style: TextStyle(color: Colors.white,fontSize: 15),
        ),
        duration: Duration(seconds: 2),
      ),
    );
}

rebuildUi();

  }

//To Hide Password
  hidePasword(){  
    obscureText = !obscureText;
    notifyListeners();
  }

  

  checkBoxValue (bool? value){
    
    isChecked = value ?? false;
    notifyListeners();

  }
}