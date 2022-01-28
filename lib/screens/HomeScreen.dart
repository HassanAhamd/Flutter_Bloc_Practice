import 'package:bloc_practice/cubit/internet_cubit.dart';
import 'package:bloc_practice/screens/signInBloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'email_screen.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
              listener: (context, state) {
                if(state == InternetState.Gained){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                      content: Text("Internet Connected !"),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if(state == InternetState.Lost){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Internet Connection Lost!"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                  return Center(
                    child: Column(children: [
                      ElevatedButton(onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder:
                            (context) => BlocProvider(
                              create: (context) => SignInBloc(),
                                child: email_screen())));
                      }, child: Text("Sign In with Email")),
                      ElevatedButton(onPressed: (){}, child: Text("Sign In with Gmail")),
                    ],),
                  );
              }
          ),
      )
      );
  }
}