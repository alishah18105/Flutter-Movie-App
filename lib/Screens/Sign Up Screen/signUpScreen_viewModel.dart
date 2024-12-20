import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SignUpScreenViewModel extends BaseViewModel{
  bool isChecked = false;
  bool obscureText = true;
  bool obscureText2 = true;

 TextEditingController mail = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
   TextEditingController cpass = TextEditingController();
  String text = "" ;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

signupUser(BuildContext context) async{
    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: mail.text,
    password: pass.text,
  );
  text = "";
  notifyListeners();
  
  await firestore.collection('users').doc(credential.user!.uid).set({
        'email': mail.text.trim(),
        'username': name.text.trim(),
      });
      print("User Sign Up & Data Store Successfully");
} 


on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
    text = 'The password provided is too weak.';
    notifyListeners();

  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
      text = 'The account already exists for that email.';
      notifyListeners();


  }
} catch (e) {
  print(e);
  text = e.toString();
  notifyListeners();

}

if(text.isEmpty){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Text(
          'Sign Up Successfully',
          style: TextStyle(color: Colors.white,fontSize: 15),
        ),
        duration: Duration(seconds: 2),
      ),
    );
}

else{
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Text(text ,
          style: TextStyle(color: Colors.white,fontSize: 15),
        ),
        duration: Duration(seconds: 2),
      ),
    );
}
rebuildUi();
  }

checkBoxValue (bool? value){
    
    isChecked = value ?? false;
    notifyListeners();
  }

hidePasword(){
    obscureText = !obscureText;
    notifyListeners();
  }
hidePasword2(){
    obscureText2 = !obscureText2;
    notifyListeners();
  }


}