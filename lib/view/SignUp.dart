import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:forecast/view/Login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController cpasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          TextField(controller: emailController,),
          TextField(controller: passwordController),
          TextField(controller: cpasswordController),
          ElevatedButton(onPressed: () {
            String email =emailController.text.trim();
            String password =passwordController.text.trim();
            String cpassword =cpasswordController.text.trim();
            if(email==''||password==''||cpassword==''){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Invalid details'),
              ));
            }else{
              if(password==cpassword){
               Future<UserCredential> user= FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
               if(user !=null){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
               }
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('password doesnt match'),
                ));
              }
            }


          }, child: Text('Signup'))
        ],
      ),



    );
  }
}
