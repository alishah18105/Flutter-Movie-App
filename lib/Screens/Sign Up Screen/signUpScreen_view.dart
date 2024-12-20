
import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Login%20Screen/loginScreen_view.dart';
import 'package:movie_app/Screens/Sign%20Up%20Screen/signUpScreen_viewModel.dart';
import 'package:movie_app/utilis/app_colors.dart';
import 'package:stacked/stacked.dart';

class SignUpScreenView extends StatelessWidget {
  const SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignUpScreenViewModel(), 
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
               Text("Sign Up",style: TextStyle(color: AppColors.white , fontSize: 50, fontWeight: FontWeight.w800),),
                Text("Hello! Let's join with us", style: TextStyle(color: AppColors.lightBlue ,fontWeight: FontWeight.w600),),
              const SizedBox(height: 40),
          
              TextField(
                controller: viewModel.mail,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                prefixIcon:  Icon(Icons.email_outlined,color: AppColors.black),
                hintText: "Email",
                hintStyle: TextStyle(color: AppColors.black)
                ),
          
              ),
             const  SizedBox(height: 10,),

              TextField(
                  controller: viewModel.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                prefixIcon:  Icon(Icons.person_2_outlined,color: AppColors.black),
                hintText: "Full Name",
                hintStyle: TextStyle(color: AppColors.black)

                ),
          
              ), const  SizedBox(height: 10,),
        
              TextField(
                  controller: viewModel.pass,
                obscureText: viewModel.obscureText,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                prefixIcon: Icon(Icons.key,color: AppColors.black),
                suffixIcon: IconButton(onPressed: (){
                  viewModel.hidePasword();
                }, icon: Icon(viewModel.obscureText ? Icons.visibility_off : Icons.visibility,color: AppColors.black)),
                hintText: "Password",
                hintStyle: TextStyle(color: AppColors.black)

                ),
          
              ),
 const SizedBox(height: 10,),
        
              TextField(
                controller: viewModel.cpass,
                obscureText: viewModel.obscureText2,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                prefixIcon:  Icon(Icons.key,color:AppColors.black,),
                suffixIcon: IconButton(onPressed: (){
                  viewModel.hidePasword2();
                }, icon: Icon(viewModel.obscureText2 ? Icons.visibility_off : Icons.visibility,color: AppColors.black)),
                hintText: "Confirm Password",
                hintStyle: TextStyle(color: AppColors.black)

                ),
          
              ),


              const SizedBox(height: 10,),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start
                ,
                children: [
                  Checkbox(value: viewModel.isChecked, onChanged: (bool? value){
                   viewModel.checkBoxValue(value);
                  }),
                   Text("Agree with",style: TextStyle(color: AppColors.white),),
                  TextButton(onPressed: (){}, child: Text("Terms & Conditions",style: TextStyle(color: AppColors.lightBlue)),
                  ),
                ],
              ),
             const  SizedBox(height: 10,),
              Center(
                child: ElevatedButton(onPressed: (){
                  viewModel.signupUser(context);
                
                }, child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 15),), style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical:11),
                  backgroundColor: AppColors.lightBlue,
                ),),
              ),
             const  SizedBox(height: 20,),
               Center(child: Text("Or Sign Up With", style: TextStyle(color: AppColors.white),)),
   const  SizedBox(height: 20),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.apple, size:40, color: AppColors.white,),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.mail, size:30, color: AppColors.white), 
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.facebook, size: 35, color: AppColors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ 
                   Text("Already have an account?" ,style: TextStyle(color: AppColors.white),),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreenView()));
                }, child:  Text("Sign In", style: TextStyle(color: AppColors.lightBlue),) )]
                )

            ],
            
          ),
        ),
      ),
        );
      });
  }
}