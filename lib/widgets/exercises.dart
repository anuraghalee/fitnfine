import 'package:fitness_app/common/appbar.dart';
import 'package:fitness_app/model/exercise_model.dart';
import 'package:fitness_app/model/home_model.dart';
import 'package:fitness_app/model/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExerciseScreen extends StatefulWidget {
  final List eList;

  const ExerciseScreen({super.key, required this.eList});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> with TickerProviderStateMixin {
  List<ExerciseInfo> elist1 = [];
  List<ExerciseInfo> filterL = [];
  Map<String, List<ExerciseInfo>> eMap = {};
  var targetlist = [];
  late TabController tCont;

  var targetlist1 = [
    "abductors",
    "abs",
    "adductors",
    "biceps",
    "calves",
    "cardiovascular system",
    "delts",
    "forearms",
    "glutes",
    "hamstrings",
    "lats",
    "levator scapulae",
    "pectorals",
    "quads",
    "serratus anterior",
    "spine",
    "traps",
    "triceps",
    "upper back"
  ];

  @override
  void initState() {
    super.initState();

    tCont = TabController(length: 8, vsync: this);

    for (var a in widget.eList) {
      elist1.add(ExerciseInfo.fromJson(a));
    }

    for (ExerciseInfo a in elist1) {
      if (!targetlist.contains(a.target)) {
        targetlist.add(a.target);
      }
    }

    for (var element in elist1) {
      var target = element.target;

      if (!eMap.containsKey(target)) {
        eMap[target] = [];
      }

      eMap[target]!.add(element);
    }

    filterL = eMap[targetlist[0]]!;
  }

  @override
  Widget build(BuildContext context) {
    var exProv = Provider.of<EProvider>(context);
    var back = elist1;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          color: Colors.blue.shade400,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text(
                'FIND YOUR EXERCISE',
                style: TextStyle(
                  fontSize: 65,
                  color: Colors.white,
                  fontFamily: GoogleFonts.oswald().fontFamily,
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.antiAlias,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(
                      targetlist.length,
                      (index) {
                        return InkWell(
                          onTap: () {
                            filterL = eMap[targetlist[index]]!;
                            exProv.onTabChanged(index);
                            exProv.screenChange(index);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              color: exProv.tabIndex == index ? Colors.black : Colors.transparent,
                              border: Border.all(
                                width: exProv.tabIndex == index ? 0 : 2,
                                color: Colors.black,
                              ),
                            ),
                            child: Text(
                              targetlist[index].toUpperCase(),
                              style: TextStyle(
                                fontSize: 18,
                                color: exProv.tabIndex == index ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 400,
                child: TabContent(
                  elist1: filterL,
                  a: exProv.screenChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  final List<ExerciseInfo> elist1;
  final int a;

  const TabContent({super.key, required this.elist1, required this.a});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      childAspectRatio: 0.62,
      children: List.generate(
        elist1.length,
        (index) {
          return ExerciseCard(
            elist1: elist1,
            index: index,
          );
        },
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    super.key,
    required this.elist1,
    required this.index,
  });

  final List<ExerciseInfo> elist1;
  final int index;

  @override
  Widget build(BuildContext context) {
    var indexProv = Provider.of<Tprovider>(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ExerciseDetails(eInfo: elist1[index]),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 150,
              child: Image.network(
                elist1[index].gifUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              elist1[index].name.toUpperCase(),
              style: TextStyle(
                color: indexProv.index == 0 ? Colors.black : Colors.white,
                fontSize: 16,
                fontFamily: GoogleFonts.oswald().fontFamily,
                height: 1,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Target: ${elist1[index].target}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: indexProv.index == 0 ? Colors.black : Colors.white,
                fontSize: 18,
                fontFamily: GoogleFonts.oswald().fontFamily,
                height: 1,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseDetails extends StatelessWidget {
  const ExerciseDetails({super.key, required this.eInfo});

  final ExerciseInfo eInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Click to view video.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: GoogleFonts.oswald().fontFamily,
                  height: 1,
                ),
              ),
              SizedBox(
                child: Image.network(eInfo.gifUrl),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Name: ${eInfo.name}',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontFamily: GoogleFonts.oswald().fontFamily,
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Target Muscle: ${eInfo.target}',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontFamily: GoogleFonts.oswald().fontFamily,
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Secondary Muscles : ${eInfo.secondaryMuscles[0]}",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontFamily: GoogleFonts.oswald().fontFamily,
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Instructions:',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontFamily: GoogleFonts.oswald().fontFamily,
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: eInfo.instructions
                    .map(
                      (e) => Text(
                        e,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: GoogleFonts.oswald().fontFamily,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
