import 'package:bloc_practice/cubit/internet_cubit.dart';
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
              if(state == InternetState.Gained){
                return const Text("Connected");
              } else if(state == InternetState.Lost){
                return const Text("Internet Connection Lost");
              } else if(state == InternetState.Intial){
                return const Text("Check Your Internet Connection !");
              }
              return const Text("Somthing Went Wrong !");
            }
        )
      )
      );
  }
}