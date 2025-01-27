import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/blocs/sign_in_blocs/sign_in_bloc.dart';
import '../blocs/get_pizza_blocs/get_pizza_bloc.dart';
import 'details.screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _dark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: _dark ? Colors.grey[900] : Colors.amber,
        foregroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/pic9.png',
              scale: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'PIZZA',
              style: TextStyle(
                color: _dark ? Colors.white : Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _dark = !_dark;
              });
            },
            icon: Icon(_dark ? Icons.light_mode : Icons.dark_mode,
            color: _dark ? Colors.white : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              // Action for the cart icon
            },
            icon: Icon(CupertinoIcons.cart,
              color: _dark ? Colors.white : Colors.black),
          ),
          IconButton(
            onPressed: () {
              context.read<SignInBloc>().add(SignOutRequired());
            },
            icon: Icon(CupertinoIcons.arrow_right_to_line,
              color: _dark ? Colors.white : Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<GetPizzaBloc, GetPizzaState>(
          builder: (context, state) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 9 / 16,
              ),
              itemCount: 8,
              itemBuilder: (context, int i) {
                return Material(
                  elevation: 3,
                  color: _dark ? Colors.grey[900] : Colors.green.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                          const DetailsScreen(),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/pic6.png',
                          scale: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 8),
                                  child: Text(
                                    'NON-VEG',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 8),
                                  child: Text(
                                    '🌶️ BALANCE',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                         Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Cheesy Marvel",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: _dark ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Crafting joy: your pizza, rules, best taste!",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "12.00\$",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color:
                                      Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "15.00\$",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  // Action for add button
                                },
                                icon: Icon(
                                    CupertinoIcons.add_circled_solid,
                                    color: _dark ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      //drawer: _buildDrawer(),
    );
  }
}
