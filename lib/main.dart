
import 'package:bloc_practice/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/internet_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> InternetCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen()
      ),
    );
  }
}
