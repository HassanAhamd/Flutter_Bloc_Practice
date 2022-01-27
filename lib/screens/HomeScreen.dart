import 'package:bloc_practice/bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: BlocConsumer<InternetBloc, InternetState>(
            listener: (context, state) {
              if(state is InternetGainState){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                    content: Text("Internet Connected !"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if(state is InternetLostState){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Internet Connection Lost!"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if(state is InternetGainState){
                return const Text("Connected");
              } else if(state is InternetLostState){
                return const Text("Internet Connection Lost");
              }
              return const Text("Check Your Internet Connection !");
            }
        )
      )
      );
  }
}