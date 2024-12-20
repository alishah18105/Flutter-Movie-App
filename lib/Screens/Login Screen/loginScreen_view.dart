
import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Login%20Screen/loginScreen_viewModel.dart';
import 'package:movie_app/Screens/Sign%20Up%20Screen/signUpScreen_view.dart';
import 'package:movie_app/utilis/app_colors.dart';
import 'package:stacked/stacked.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LoginScreenViewModel(), 
      builder: (context, viewModel, child){
        return Scaffold(
          backgroundColor: AppColors.darkThemeColor,
appBar: AppBar(
  backgroundColor: AppColors.darkThemeColor,
),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Welcome",style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w800),),
              const Text("Back",style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w800),),

              const Text("Hey! Good to see you again", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),),
              const SizedBox(height: 50),
          
              TextField(
                controller: viewModel.mail,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  ),
                prefixIcon: Icon(Icons.email_outlined,color: AppColors.black,),
                
                hintText: "Email",
                hintStyle: const TextStyle(color: Colors.black)
                ),
          
              ),
              const SizedBox(height: 10,),
              
              TextField(
                controller: viewModel.pass,
                obscureText: viewModel.obscureText,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  ),
                  
                prefixIcon:  Icon(Icons.key,color: AppColors.black),
                suffixIcon: IconButton(onPressed: (){
                viewModel.hidePasword();
                }, icon: Icon(viewModel.obscureText ? Icons.visibility_off: Icons.visibility,color: AppColors.black)),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.black)

                ),
                  
              ), 
              const SizedBox(height: 5,),

              const SizedBox(height: 5,),
               Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start
                ,
                children: [
                  Checkbox(value: viewModel.isChecked, onChanged: (bool? value){
                    viewModel.checkBoxValue(value);
                  }),
                  const Text("Remember Me", style: TextStyle(color: Colors.white),),
                  const SizedBox(width: 35,),
                  TextButton(onPressed: (){}, child: const Text("Forgot Password?", style: TextStyle(color: Colors.blue),),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Center(
                child: ElevatedButton(onPressed: (){
                  viewModel.loginUser(context);
                }, child: Text("Sign In",style: TextStyle(color: AppColors.white,fontSize: 15),), style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical:11),
                  backgroundColor: Colors.blue,
                ),),
              ),
              const SizedBox(height: 20,),
              const Center(child: Text("Or Sign Up With", style: TextStyle(color: Colors.blue),)),
              
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.apple, size:40, color: Colors.white,),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                    child: Icon(Icons.email, size: 30,color: Colors.white),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.facebook, size: 35, color: Colors.white,),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ 
                   Text("Don't have an account?", style: TextStyle(color: AppColors.white),),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SignUpScreenView()));
                }, child:  Text("Sign Up",style: TextStyle(color: AppColors.lightBlue),) )]
                )

            ],
            
          ),
        ),
      ),
        );
      });
  }
}