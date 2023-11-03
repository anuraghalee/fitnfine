import 'package:fitness_app/model/model.dart';
import 'package:fitness_app/widgets/workouts/model/workout_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizedWorkout extends StatefulWidget {
  const CustomizedWorkout({super.key, required this.eList});

  final List eList;

  @override
  State<CustomizedWorkout> createState() => _CustomizedWorkoutState();
}

class _CustomizedWorkoutState extends State<CustomizedWorkout> with TickerProviderStateMixin {
  late AnimationController cont;
  late Animation anim;
  List<bool> pList = List.generate(8, (index) => false);

  List<String> wList = ['Chest', 'Back', 'Arm', 'Shoulders', 'LowerBody', 'FullBody', 'UpperBody', 'Abs'];
  List<ExerciseInfo> eList1 = [];
  List<Color> cList = const [
    Color.fromRGBO(0, 123, 60, 1),
    Color.fromRGBO(185, 127, 80, 1),
    Color.fromRGBO(201, 80, 87, 1),
    Color.fromRGBO(78, 102, 202, 1),
    Color.fromRGBO(115, 106, 197, 1),
    Color.fromRGBO(75, 151, 87, 1),
    Color.fromRGBO(71, 96, 136, 1),
    Color.fromRGBO(1, 98, 211, 1),
  ];

  @override
  void initState() {
    super.initState();

    eList1 = WorkoutModel().getModelExercises(widget.eList);

    cont = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));

    anim = Tween<double>(begin: 1, end: 0.97).animate(CurvedAnimation(parent: cont, curve: Curves.easeInExpo));

    // pList = List.generate(5, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                print(eList1);
              },
              child: SizedBox(
                child: Text(
                  'CUSTOMIZE YOUR DAILY WORKOUT',
                  style: TextStyle(
                    fontSize: 65,
                    color: Colors.white,
                    fontFamily: GoogleFonts.oswald().fontFamily,
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: SizedBox(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          pList[index] = true;
                        });

                        Future.delayed(const Duration(milliseconds: 350), () {
                          setState(() {
                            pList[index] = false;
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return GymWorkoutDetails(
                                muscle: wList[index],
                              );
                            }));
                          });
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.easeOutExpo,
                        child: Transform.scale(
                          scale: pList[index] == true ? 0.95 : 1,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            height: 120,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                  clipBehavior: Clip.antiAlias,
                                  width: double.maxFinite,
                                  child: Transform.translate(
                                    offset: const Offset(60, 0),
                                    child: Image.asset(
                                      'assets/images/gym/${wList[index]}.jpg',
                                      fit: BoxFit.cover,
                                      scale: 0.3,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [cList[index], Colors.transparent],
                                      stops: const [0.4, 0.9],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${wList[index]} Workout".toUpperCase(),
                                        style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w900, height: 1.2, fontFamily: GoogleFonts.outfit().fontFamily),
                                      ),
                                      Text(
                                        'Classic Gym Workout',
                                        style: TextStyle(fontSize: 14, color: Colors.white, fontFamily: GoogleFonts.outfit().fontFamily),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: wList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GymWorkoutDetails extends StatefulWidget {
  const GymWorkoutDetails({super.key, required this.muscle});

  final String muscle;

  @override
  State<GymWorkoutDetails> createState() => _GymWorkoutDetailsState();
}

class _GymWorkoutDetailsState extends State<GymWorkoutDetails> {
  Map<String, List<String>> desc = WorkoutModel().desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Transform.scale(
            scale: 1.6,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Image.asset(
                  'assets/images/gym/${widget.muscle}.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Stack(
                children: [
                  ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.muscle.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.outfit().fontFamily,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Icon(
                            Icons.circle,
                            size: 5,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            'Gym Workout'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.outfit().fontFamily,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            Text(
                              desc[widget.muscle]![0],
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 13,
                                fontFamily: GoogleFonts.outfit().fontFamily,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              desc[widget.muscle]![1],
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 13,
                                fontFamily: GoogleFonts.outfit().fontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Exercises ()',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.outfit().fontFamily,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Flexible(
                              child: Column(
                                children: List.generate(15, (index) {
                                  return Container(
                                    width: double.infinity,
                                    height: 50,
                                    margin: const EdgeInsets.only(bottom: 20),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 1,
                                          color: Colors.white.withOpacity(0.4),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'Exercise ${index + 1}',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: GoogleFonts.outfit().fontFamily,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      color: Colors.black.withOpacity(0.2),
                      height: 65,
                      child: InkWell(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Text(
                              'Start'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.outfit().fontFamily,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
