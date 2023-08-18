import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:forecast/view/ForecastUI.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
        ),
      body: Column(
        children: [
          TextField(controller: emailController),
          TextField(controller: passwordController),
ElevatedButton(onPressed: () {
  String email=emailController.text.trim();
  String password=passwordController.text.trim();
  if(email==''||password==''){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Invalid details'),
    ));
  }else{
    try{
     FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
     Navigator.push(context, MaterialPageRoute(builder: (context)=>ForecastUI()));
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));

    }

  }
}, child: Text('Login'))
        ],
      ),
    );

  }

}
