import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_application/screens/auth/blocs/sign_in_blocs/sign_in_bloc.dart';
import 'package:pizza_application/screens/auth/views/welcome_screen.dart';
import 'package:pizza_application/screens/home/blocs/get_pizza_blocs/get_pizza_bloc.dart';
import 'package:pizza_application/screens/home/views/home_screen.dart';
//import 'package:pizza_application/screens/home/views/home_screen2.dart';
import 'package:pizza_repository/pizza_repository.dart';

import 'blocs/authentication_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.light(
              surface: Colors.grey.shade200,
              onSurface: Colors.black,
              primary: Colors.blue,
              onPrimary: Colors.white
          )
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: ((context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      SignInBloc(
                          context
                              .read<AuthenticationBloc>()
                              .userRepository
                      ),
                ),
                BlocProvider(
                  create: (context) => GetPizzaBloc(
                    FirebasePizzaRepo()
                  )..add(GetPizza()),
                ),
              ],
              child: const HomeScreen(),
            );
          } else {
            return const WelcomeScreen();
          }
        }),
      ),
    );
  }
}