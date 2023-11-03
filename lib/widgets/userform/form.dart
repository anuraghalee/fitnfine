import 'package:fitness_app/widgets/userform/fitness/f_formfield.dart';
import 'package:fitness_app/widgets/userform/fitness/model/f_model.dart';
import 'package:fitness_app/widgets/userform/health/h_formfield.dart';
import 'package:fitness_app/widgets/userform/health/model/h_model.dart';
import 'package:fitness_app/widgets/userform/personal/model/p_model.dart';
import 'package:fitness_app/widgets/userform/personal/p_formfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key, required this.foodM, required this.dietM, required this.disM, required this.fitM, required this.perM});

  final FoodRestrictionsM foodM;
  final DietM dietM;
  final DiseaseM disM;
  final FitnessModel fitM;
  final PersonalData perM;

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  late PageController cont;

  late FocusNode node1;
  late FocusNode node2;
  late FocusNode node3;
  late FocusNode node4;
  late FocusNode node5;

  @override
  void initState() {
    super.initState();

    cont = PageController();
    node1 = FocusNode();
    node2 = FocusNode();
    node3 = FocusNode();
    node4 = FocusNode();
    node5 = FocusNode();
  }

  @override
  void dispose() {
    cont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var hModel = Provider.of<FoodRestrictionsM>(context);
    var dModel = Provider.of<DietM>(context);
    var disModel = Provider.of<DiseaseM>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Flexible(
                  child: SizedBox(
                    child: PageView(
                      controller: cont,
                      children: [
                        SizedBox(
                          height: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                'Personal Details',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 28,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Form(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: NameForm(
                                        onSubmit: (value) {
                                          widget.perM.updatename(value);
                                        },
                                        pMod: widget.perM,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: EmailForm(
                                        onSubmit: (value) {},
                                        pMod: widget.perM,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: GenderForm(
                                        onSubmit: (value) {
                                          widget.perM.updategender(value);
                                        },
                                        pMod: widget.perM,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: DOB(
                                        onSubmit: (value) {
                                          widget.perM.updatedob(value);
                                        },
                                        pMod: widget.perM,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Heightform(
                                        onSubmit: (value) {
                                          widget.perM.updateheight(value);
                                        },
                                        pMod: widget.perM,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: WeightForm(
                                        onSubmit: (value) {
                                          widget.perM.updateweight(value);
                                          print(widget.perM.weight);
                                        },
                                        pMod: widget.perM,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Fitness Details',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 28,
                                ),
                              ),
                              Form(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              'Fitness Goals',
                                              style: TextStyle(
                                                color: Colors.white.withOpacity(0.7),
                                                fontFamily: GoogleFonts.poppins().fontFamily,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: GoalsMenu(
                                              onChanged: (value) {
                                                widget.fitM.updateFitnessGoal(value);
                                                print(widget.fitM.fitnessGoal);
                                              },
                                              fMod: widget.fitM,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              'Activity Level',
                                              style: TextStyle(
                                                color: Colors.white.withOpacity(0.7),
                                                fontFamily: GoogleFonts.poppins().fontFamily,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: ActivityMenu(
                                              onChanged: (value) {
                                                widget.fitM.updateactivityLevel(value);
                                              },
                                              fMod: widget.fitM,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              'Fitness Level',
                                              style: TextStyle(
                                                color: Colors.white.withOpacity(0.7),
                                                fontFamily: GoogleFonts.poppins().fontFamily,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: FLevelMenu(
                                              onChanged: (value) {
                                                widget.fitM.updateFitnessLevel(value);
                                              },
                                              fMod: widget.fitM,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              'Preferred Workout Types',
                                              style: TextStyle(
                                                color: Colors.white.withOpacity(0.7),
                                                fontFamily: GoogleFonts.poppins().fontFamily,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: WorkoutMenu(
                                              onChanged: (value) {
                                                widget.fitM.updateWorkoutType(value);
                                              },
                                              fMod: widget.fitM,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              'Fitness Equipment',
                                              style: TextStyle(
                                                color: Colors.white.withOpacity(0.7),
                                                fontFamily: GoogleFonts.poppins().fontFamily,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: EquipmentMenu(
                                              onChanged: (value) {
                                                widget.fitM.updateFitnessEquipGoal(value);
                                              },
                                              fMod: widget.fitM,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: double.maxFinite,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Health Details',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: GoogleFonts.poppins().fontFamily,
                                          fontSize: 28,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return showfoodDialog(context, hModel, () {});
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white, width: 1),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Food Restrictions',
                                                style: TextStyle(
                                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                                  color: Colors.white.withOpacity(0.7),
                                                  fontSize: 18,
                                                ),
                                              ),
                                              hModel.foodres.isNotEmpty
                                                  ? Text(
                                                      '${widget.foodM.foodres}',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                    )
                                                  : const Text('')
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return showDietDialog(context, dModel, () {});
                                            },
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white, width: 1),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Diet Prefernces',
                                                style: TextStyle(
                                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                                  color: Colors.white.withOpacity(0.7),
                                                  fontSize: 18,
                                                ),
                                              ),
                                              dModel.dietres.isNotEmpty
                                                  ? Text(
                                                      '${widget.dietM.dietres}',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                    )
                                                  : const Text(''),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return showdiseasesDialog(context, disModel, () {});
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Health Conditions',
                                                style: TextStyle(
                                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                                  color: Colors.white.withOpacity(0.7),
                                                  fontSize: 18,
                                                ),
                                              ),
                                              disModel.disList.isNotEmpty
                                                  ? Text(
                                                      '${widget.disM.disList}',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                    )
                                                  : const Text(''),
                                            ],
                                          ),
                                        ),
                                      )
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
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FutureBuilder(
                    future: Future.value(true),
                    builder: (context, snap) {
                      return Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                cont.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOutCirc);
                              },
                              child: Container(
                                height: 40,
                                color: Colors.pink,
                                child: Center(
                                  child: Text(
                                    'Previous',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (cont.page?.toInt() == 1) {
                                  Navigator.pop(context);
                                } else {
                                  cont.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOutCirc);
                                }
                              },
                              child: Container(
                                height: 40,
                                color: Colors.pink,
                                child: Center(
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
