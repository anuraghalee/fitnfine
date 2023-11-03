import 'package:fitness_app/services/api.dart';
import 'package:fitness_app/widgets/meallist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({super.key});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> with TickerProviderStateMixin {
  late TabController tCont;

  static List<dynamic> cList = [];

  Map<String, dynamic> finalList = {};

  @override
  void initState() {
    super.initState();

    tCont = TabController(length: 2, vsync: this);

    if (cList.isEmpty) {
      APIservice().getIngredientCategories().then(
        (value) {
          setState(() {
            cList = value;
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's Meal Plan",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontFamily: GoogleFonts.oswald().fontFamily,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      print(finalList['Dessert']);
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.yellow.shade600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Flexible(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        child: Text(
                          'Explore Recipes',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: GoogleFonts.oswald().fontFamily,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 300,
                        child: SizedBox(
                          child: GridView.count(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2,
                            children: List.generate(
                              8,
                              (index) => InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        var cat = cList[index + 6]['strCategory'];
                                        return MealListScreen(
                                          fCat: cat,
                                          onChanged: (value) {
                                            finalList[cat] = value;
                                          },
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(47, 61, 236, 1),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Text(
                                      cList[index + 6]['strCategory'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontFamily: GoogleFonts.oswald().fontFamily,
                                        height: 1,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
