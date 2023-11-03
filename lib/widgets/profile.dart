import 'package:fitness_app/widgets/userform/fitness/model/f_model.dart';
import 'package:fitness_app/widgets/userform/health/model/h_model.dart';
import 'package:fitness_app/widgets/userform/personal/model/p_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key, required this.foodM, required this.dietM, required this.disM, required this.fitM, required this.perM});

  final FoodRestrictionsM foodM;
  final DietM dietM;
  final DiseaseM disM;
  final FitnessModel fitM;
  final PersonalData perM;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.amber.shade600,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Personal Details',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontFamily: GoogleFonts.oswald().fontFamily,
                        height: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Name: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: perM.name,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Gender: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: perM.gender,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Date of Birth: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: perM.dob,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Height: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: perM.height,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Weight: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: perM.weight,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Fitness Details',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontFamily: GoogleFonts.oswald().fontFamily,
                        height: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Fitness Goals: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: fitM.fitnessGoal,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Activity Level: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: fitM.activityLevel,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Fitness Level: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: fitM.fitnesslevel,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Workout Type: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: fitM.workoutType,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Fitness Equipment: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: fitM.fitnessEquip,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Health Details',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontFamily: GoogleFonts.oswald().fontFamily,
                        height: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Food Restrictions: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: foodM.foodres.join(', '),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Diet Prefernces: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: dietM.dietres.join(', '),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Health Conditions: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: disM.disList.join(', '),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
