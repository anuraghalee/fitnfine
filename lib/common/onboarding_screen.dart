import 'package:fitness_app/asset_constants.dart';
import 'package:fitness_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pCont = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: PageView(
              controller: pCont,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: double.infinity,
                      child: Image.asset(
                        AssetConstants.img4,
                        fit: BoxFit.cover,
                        alignment: const Alignment(-0.05, 0),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0),
                            Colors.black.withOpacity(0.3),
                          ],
                          stops: const [0.2, 0.6],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 130,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: SizedBox(
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                  'Personalized Workouts',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.barlowCondensed().fontFamily,
                                    fontSize: 65,
                                    color: Colors.white,
                                    height: 1,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  'Workout plans designed to help you achieve your fitness goals - whether losing weight or building muscle.',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.barlowCondensed().fontFamily,
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: double.infinity,
                      child: Image.asset(
                        AssetConstants.img7,
                        fit: BoxFit.cover,
                        alignment: const Alignment(-0.05, 0),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0),
                            Colors.black.withOpacity(0.3),
                          ],
                          stops: const [0.2, 0.6],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 130,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: SizedBox(
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                  'Video Tutorials',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.barlowCondensed().fontFamily,
                                    fontSize: 65,
                                    color: Colors.white,
                                    height: 1,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  'Perfect your form, learn new exercises and follow expert guidance.',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.barlowCondensed().fontFamily,
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: double.infinity,
                      child: Image.asset(
                        AssetConstants.img3,
                        fit: BoxFit.cover,
                        alignment: const Alignment(-0.05, 0),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0),
                            Colors.black.withOpacity(0.3),
                          ],
                          stops: const [0.2, 0.6],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 130,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: SizedBox(
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                  'Workout Reminders',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.barlowCondensed().fontFamily,
                                    fontSize: 65,
                                    color: Colors.white,
                                    height: 1,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  'Regular Alerts for daily reminders : Never miss a workout again and stay commited to your goals.',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.barlowCondensed().fontFamily,
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: double.infinity,
                      child: Image.asset(
                        AssetConstants.img10,
                        fit: BoxFit.cover,
                        alignment: const Alignment(-0.05, 0),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0),
                            Colors.black.withOpacity(0.2),
                          ],
                          stops: const [0.2, 0.6],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 130,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: SizedBox(
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                  'Workout Library',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.barlowCondensed().fontFamily,
                                    fontSize: 65,
                                    color: Colors.white,
                                    height: 1,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  'Explore hundreds of workouts, from instense HIIT to soothing yoga, including workouts for every fitness level.',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.barlowCondensed().fontFamily,
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: double.infinity,
                      child: Image.asset(
                        AssetConstants.img9,
                        fit: BoxFit.cover,
                        alignment: const Alignment(-0.05, 0),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0),
                            Colors.black.withOpacity(0.5),
                          ],
                          stops: const [0.2, 0.6],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 130,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: SizedBox(
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                  'Yoga and Meditation',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.barlowCondensed().fontFamily,
                                    fontSize: 65,
                                    color: Colors.white,
                                    height: 1,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  'Get help finding inner peace, explore different yoga and meditation sessions, balance your body and mind.',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.barlowCondensed().fontFamily,
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.lightBlue.shade700,
                  child: Center(
                    child: SizedBox(
                      width: 250,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                AuthService().signInAnon();
                                Navigator.popUntil(context, ModalRoute.withName('/'));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: const Text(
                                'Continue as Guest',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Continue with Google',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: pCont,
                count: 6,
                effect: WormEffect(
                  dotColor: Colors.white.withOpacity(0.6),
                  activeDotColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 60, bottom: 10),
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              width: 250,
              child: Image.asset(AssetConstants.img12),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 180,
              child: Row(
                children: [
                  Expanded(
                    child: Transform.translate(
                      offset: const Offset(-20, 30),
                      child: Transform.scale(
                        scale: 3,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            AssetConstants.img8,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        AssetConstants.img5,
                        alignment: const Alignment(0, -0.3),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Transform.translate(
                      offset: const Offset(20, 30),
                      child: Transform.scale(
                        scale: 3,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            AssetConstants.img11,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 170,
              child: Row(
                children: [
                  Expanded(
                    child: Transform.translate(
                      offset: const Offset(-20, 30),
                      child: Transform.scale(
                        scale: 3,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            AssetConstants.img7,
                            alignment: const Alignment(1, 1),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        AssetConstants.img10,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Transform.translate(
                      offset: const Offset(20, 30),
                      child: Transform.scale(
                        scale: 3,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            AssetConstants.img1,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: SizedBox(
                width: 270,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        "Let's Move",
                        style: TextStyle(
                          fontFamily: GoogleFonts.barlowCondensed().fontFamily,
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Fitness and wellness for you anytime, anywhere.",
                        style: TextStyle(
                          fontFamily: GoogleFonts.barlowCondensed().fontFamily,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const OnboardingScreen(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontFamily: GoogleFonts.barlowCondensed().fontFamily,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
