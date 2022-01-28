import 'package:bloc_practice/screens/signInBloc/sign_in_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class email_screen extends StatelessWidget{
final emailEditingController = TextEditingController();
final passEditingController = TextEditingController();
  email_screen({
    Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login with Email"),
        centerTitle: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()
        ),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('What is your Email Address ?',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    TextField(
                      onChanged:(pass){
                        BlocProvider.of<SignInBloc>(context).add(SignInTextChangeEvent(email: emailEditingController.text.trim(), password: passEditingController.text.trim()));
                      },
                      controller: emailEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your email',
                        contentPadding: const EdgeInsets.only(bottom: 5, top: 12),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 100,),
                    Text('What is your Password ?',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    TextField(
                      controller: passEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your password',
                        contentPadding: const EdgeInsets.only(bottom: 5, top: 12),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onChanged:(pass){
                        BlocProvider.of<SignInBloc>(context).add(SignInTextChangeEvent(email: emailEditingController.text.trim(), password: passEditingController.text.trim()));
                      },
                    ),
                  ],),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context,state){
                    if(state is SignInErrorState){
                      return Text(state.errorMessage,style: TextStyle(fontSize: 12,color: Colors.red),);
                  }
                    return Container();
                  }, ),
                Column(
                  children: [
                    BlocBuilder<SignInBloc, SignInState>(
                      builder: (context,state){
                        if(state is SignInLoadingState){
                          return Center(child: CircularProgressIndicator(),);
                        }
                   return CupertinoButton(onPressed: (){
                     if(state is SignInValidState){
                       BlocProvider.of<SignInBloc>(context).add(SignInSubmittedEvent(email: emailEditingController.text.trim(), password: passEditingController.text.trim()));
                     }
                   }, child: Text("Sign In"),color:(state is SignInValidState) ? Colors.blue
                   : Colors.grey);
                }),
                ],),

              ],),
          ),
        ],
      ),
    );
    }
}