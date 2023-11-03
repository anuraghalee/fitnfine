import 'package:fitness_app/asset_constants.dart';
import 'package:fitness_app/common/appbar.dart';
import 'package:fitness_app/common/bottomnavbar.dart';
import 'package:fitness_app/model/home_model.dart';
import 'package:fitness_app/model/model.dart';
import 'package:fitness_app/services/api.dart';
import 'package:fitness_app/services/auth.dart';
import 'package:fitness_app/widgets/workouts/c_workout.dart';
import 'package:fitness_app/widgets/meal.dart';
import 'package:fitness_app/widgets/profile.dart';
import 'package:fitness_app/widgets/exercises.dart';
import 'package:fitness_app/widgets/userform/fitness/model/f_model.dart';
import 'package:fitness_app/widgets/userform/form.dart';
import 'package:fitness_app/widgets/userform/health/model/h_model.dart';
import 'package:fitness_app/widgets/userform/personal/model/p_model.dart';
import 'package:fitness_app/widgets/workouts/crossfit.dart';
import 'package:fitness_app/widgets/workouts/pilates.dart';
import 'package:fitness_app/widgets/workouts/stretching.dart';
import 'package:fitness_app/widgets/workouts/yoga.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  // final

  @override
  State<HomeScreen1> createState() => _HomeScreenState1();
}

class _HomeScreenState1 extends State<HomeScreen1> with TickerProviderStateMixin {
  late TabController tCont;
  final DateTime date = DateTime.now();

  static List<dynamic> eList = [];

  @override
  void initState() {
    super.initState();

    tCont = TabController(length: 3, vsync: this);

    if (eList.isEmpty) {
      APIservice().getExercise().then(
        (value) {
          setState(() {
            eList = value;
          });
        },
      );
    }
  }

  @override
  void dispose() {
    tCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tabProv = Provider.of<Tprovider>(context);
    var indexProv = Provider.of<Tprovider>(context);

    var hModel = Provider.of<FoodRestrictionsM>(context);
    var dModel = Provider.of<DietM>(context);
    var disModel = Provider.of<DiseaseM>(context);

    var fitnessModel = Provider.of<FitnessModel>(context);
    var personalModel = Provider.of<PersonalData>(context);

    var screens = [
      HomeScreen(
        date: date,
        tCont: tCont,
        tabProv: tabProv,
        eList: eList,
      ),
      ExerciseScreen(
        eList: eList,
      ),
      CustomizedWorkout(
        eList: eList,
      ),
      const MealScreen(),
      UserScreen(
        foodM: hModel,
        dietM: dModel,
        disM: disModel,
        fitM: fitnessModel,
        perM: personalModel,
      ),
    ];

    return Scaffold(
      appBar: Appbar(
        leading: IconButton(
          onPressed: () async {
            // await AuthService().signOut();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return UserForm(
                    foodM: hModel,
                    dietM: dModel,
                    disM: disModel,
                    fitM: fitnessModel,
                    perM: personalModel,
                  );
                },
              ),
            );
          },
          icon: const Icon(Icons.logout),
        ),
      ),
      body: screens[indexProv.index],
      bottomNavigationBar: const BottomNav(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.date,
    required this.tCont,
    required this.tabProv,
    required this.eList,
  });

  final DateTime date;
  final TabController tCont;
  final List<dynamic> eList;
  final Tprovider tabProv;

  @override
  Widget build(BuildContext context) {
    List<ExerciseInfo> elist1 = [];
    List<ExerciseInfo> elist2 = [];

    final dataProv = Provider.of<DataProvider>(context);

    for (var i in eList) {
      elist1.add(ExerciseInfo.fromJson(i));
    }

    for (var a in elist1) {
      if (a.target == 'pectorals') {
        elist2.add(a);
      }
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommended Plan',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.oswald().fontFamily,
                    fontSize: 35,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: 170,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(AssetConstants.img12),
                            Text(
                              'ALL',
                              style: TextStyle(
                                fontFamily: GoogleFonts.barlowCondensed().fontFamily,
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's Exercises",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.oswald().fontFamily,
                    fontSize: 35,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(elist2.length, (index) {
                      return Container(
                        width: 200,
                        margin: const EdgeInsets.only(right: 5),
                        child: ExerciseCard(elist1: elist2, index: index),
                      );
                    }),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       'Calorie Count',
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontFamily: GoogleFonts.oswald().fontFamily,
            //         fontSize: 40,
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 10,
            //     ),
            //     Container(
            //       height: 150,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(30),
            //         color: Colors.pink.shade300,
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 30,
            // ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       'Custom Workouts',
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontFamily: GoogleFonts.oswald().fontFamily,
            //         fontSize: 40,
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 10,
            //     ),
            //     Container(
            //       height: 150,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(30),
            //         color: Colors.red.shade400,
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 40,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      'Find a \nWorkout Type'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: GoogleFonts.oswald().fontFamily,
                        fontSize: 50,
                        height: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1.3,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PilatesScreen(
                                    pList: dataProv.pList,
                                  ),
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: double.maxFinite,
                                  height: double.maxFinite,
                                  child: Image.asset(
                                    AssetConstants.img13,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black.withOpacity(0.35),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 20,
                                  child: SizedBox(
                                    height: 50,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Pilates'.toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontFamily: GoogleFonts.oswald().fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => YogaList(
                                    yList: dataProv.yList,
                                  ),
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: double.maxFinite,
                                  height: double.maxFinite,
                                  child: Image.asset(
                                    AssetConstants.img15,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.35),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 20,
                                  child: SizedBox(
                                    height: 50,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Yoga'.toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontFamily: GoogleFonts.oswald().fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CrossfitScreen(
                                      cList: dataProv.cList,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: double.maxFinite,
                                  height: double.maxFinite,
                                  child: Image.asset(
                                    AssetConstants.img16,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.35),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 20,
                                  child: SizedBox(
                                    height: 50,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Crossfit'.toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontFamily: GoogleFonts.oswald().fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return StretchingScreen(
                                      sList: dataProv.sList,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: double.maxFinite,
                                  height: double.maxFinite,
                                  child: Image.asset(
                                    AssetConstants.img17,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.35),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 20,
                                  child: SizedBox(
                                    height: 50,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Stretching'.toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontFamily: GoogleFonts.oswald().fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
