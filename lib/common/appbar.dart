import 'package:flutter/material.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  const Appbar({super.key, this.leading, this.title});

  final Widget? leading;
  final Widget? title;

  @override
  State<Appbar> createState() => _AppbarState();

  @override
  Size get preferredSize => const Size(double.maxFinite, 50);
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: Colors.white,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: widget.leading,
            ),
            Center(
              child: widget.title,
            )
          ],
        ),
      ),
    );
  }
}
