import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/provider/app_bloc/app_bloc.dart';
import 'package:task/provider/profile_bloc/profile_bloc.dart';
import 'package:task/view/pages/api_example.dart';
import 'package:task/view/pages/app_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(create: (context) => AppBloc()),
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const AppScaffold(),
            '/api': (context) => const ApiExample()
          }),
    );
  }
}
