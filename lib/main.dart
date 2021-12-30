import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutty_bloc/bloc/DataCubit.dart';
import 'package:flutty_bloc/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<DataCubit>(
          create: (context) => DataCubit()..getNewsArticle(),
          child: const Home(),
        ));
  }
}
