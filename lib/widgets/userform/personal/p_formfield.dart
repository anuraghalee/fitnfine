import 'package:fitness_app/widgets/userform/personal/model/p_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameForm extends StatelessWidget {
  const NameForm({super.key, required this.onSubmit, required this.pMod});

  final ValueChanged onSubmit;
  final PersonalData pMod;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      initialValue: pMod.name,
      decoration: InputDecoration(
        labelText: 'Name',
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: 18,
        ),
      ),
      onFieldSubmitted: (a) {
        onSubmit(a);
      },
    );
  }
}

class EmailForm extends StatelessWidget {
  const EmailForm({super.key, required this.onSubmit, required this.pMod});
  final ValueChanged onSubmit;
  final PersonalData pMod;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: 'E-Mail',
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: 18,
        ),
      ),
      onFieldSubmitted: (a) {
        onSubmit(a);
      },
    );
  }
}

class GenderForm extends StatelessWidget {
  const GenderForm({super.key, required this.onSubmit, required this.pMod});
  final ValueChanged onSubmit;
  final PersonalData pMod;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      initialValue: pMod.gender,
      decoration: InputDecoration(
        labelText: 'Gender',
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: 18,
        ),
      ),
      onFieldSubmitted: (a) {
        onSubmit(a);
      },
    );
  }
}

class DOB extends StatelessWidget {
  const DOB({super.key, required this.onSubmit, required this.pMod});
  final ValueChanged onSubmit;
  final PersonalData pMod;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      initialValue: pMod.dob,
      decoration: InputDecoration(
        labelText: 'Date of birth',
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: 18,
        ),
      ),
      onFieldSubmitted: (a) {
        onSubmit(a);
      },
    );
  }
}

class Heightform extends StatelessWidget {
  const Heightform({super.key, required this.onSubmit, required this.pMod});
  final ValueChanged onSubmit;
  final PersonalData pMod;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      initialValue: pMod.height,
      decoration: InputDecoration(
        labelText: 'Height(cms)',
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: 18,
        ),
      ),
      onFieldSubmitted: (a) {
        onSubmit(a);
      },
    );
  }
}

class WeightForm extends StatelessWidget {
  const WeightForm({super.key, required this.onSubmit, required this.pMod});
  final ValueChanged onSubmit;
  final PersonalData pMod;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      initialValue: pMod.weight,
      decoration: InputDecoration(
        labelText: 'Weight(kg)',
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: 18,
        ),
      ),
      onFieldSubmitted: (a) {
        onSubmit(a);
      },
    );
  }
}
