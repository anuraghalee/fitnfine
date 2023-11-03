import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fitness_app/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  final items = const [
    Icon(Icons.home, size: 25),
    Icon(FontAwesomeIcons.dumbbell, size: 25),
    Icon(Icons.add, size: 25),
    Icon(Icons.local_dining_sharp, size: 25),
    Icon(FontAwesomeIcons.user, size: 25)
  ];

  @override
  Widget build(BuildContext context) {
    var indexProv = Provider.of<Tprovider>(context);

    return CurvedNavigationBar(
      items: items,
      backgroundColor: Colors.blue.shade700,
      buttonBackgroundColor: Colors.blue.shade300,
      animationDuration: const Duration(milliseconds: 400),
      height: 60,
      onTap: (value) {
        indexProv.updateTab(value);
        // index = value;
        print(indexProv.index);
      },
    );
  }
}
