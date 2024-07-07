import 'package:awesome_portfolio/provider/current_state.dart';
import 'package:awesome_portfolio/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CurrentState(),
        )
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
