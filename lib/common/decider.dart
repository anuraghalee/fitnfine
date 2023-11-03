import 'package:fitness_app/common/onboarding_screen.dart';
import 'package:fitness_app/services/auth.dart';
import 'package:fitness_app/widgets/home.dart';
import 'package:flutter/material.dart';

class DeciderScreen extends StatelessWidget {
  const DeciderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().dUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return const HomeScreen1();
          } else if (snapshot.hasError) {
            return const Center(child: Text('ERROR'));
          } else {
            return const WelcomeScreen();
          }
        } else {
          return const Center(child: Text('ERROR'));
        }
      },
    );
  }
}
