import 'package:fitness_app/widgets/userform/health/model/h_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

showfoodDialog(BuildContext context, FoodRestrictionsM hModel, Function() onSubmit) {
  List<String> values = ['Gluten', 'Dairy', 'Egg', 'Soy', 'Peanuts', 'Tree Nuts', 'Fish', 'Shellfish', 'Wheat', 'Other/Not Listed'];
  // bool isChecked = false;

  List<String> sValues = hModel.foodres;

  return AlertDialog(
    title: const Text(
      'Food Restrictions',
    ),
    content: SingleChildScrollView(
      child: ListBody(
        children: values.map(
          (e) {
            return Consumer<FoodRestrictionsM>(
              builder: (context, hModel, child) {
                return CheckboxListTile(
                  value: hModel.foodres.contains(e),
                  onChanged: (a) {
                    if (sValues.contains(e)) {
                      hModel.remItem(e);
                    } else {
                      hModel.addItem(e);
                    }
                  },
                  title: Text(e),
                );
              },
            );
          },
        ).toList(),
      ),
    ),
    actions: [
      InkWell(
        onTap: () {
          onSubmit();
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.black,
          child: Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 16,
            ),
          ),
        ),
      )
    ],
  );
}

showDietDialog(BuildContext context, DietM dModel, Function() onSubmit) {
  List<String> values = ['Vegan/Plant-based', 'Vegetarian', 'Gluten-Free'];
  // bool isChecked = false;

  List<String> sValues = dModel.dietres;

  return AlertDialog(
    title: const Text(
      'Food Restrictions',
    ),
    content: SingleChildScrollView(
      child: ListBody(
        children: values.map(
          (e) {
            return Consumer<DietM>(
              builder: (context, dModel, child) {
                return CheckboxListTile(
                  value: dModel.dietres.contains(e),
                  onChanged: (a) {
                    if (sValues.contains(e)) {
                      dModel.remItem(e);
                    } else {
                      dModel.addItem(e);
                    }
                  },
                  title: Text(e),
                );
              },
            );
          },
        ).toList(),
      ),
    ),
    actions: [
      InkWell(
        onTap: () {
          onSubmit();
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.black,
          child: Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 16,
            ),
          ),
        ),
      )
    ],
  );
}

showdiseasesDialog(BuildContext context, DiseaseM disModel, Function() onSubmit) {
  List<String> values = [
    'Heart Disease',
    'Hypertension(High Blood Pressure)',
    'Diabetes',
    'Asthma',
    'Arthritis',
    'Osteoporosis',
    'Cancer',
    'Obesity',
    'Pregnancy',
    'Epilepsy',
    'Celiac Disease',
    'Spinal Cord Injuries'
  ];

  List<String> sValues = disModel.disList;

  return AlertDialog(
    title: const Text(
      'Health Conditions',
    ),
    content: SingleChildScrollView(
      child: ListBody(
        children: values.map(
          (e) {
            return Consumer<DiseaseM>(
              builder: (context, disModel, child) {
                return CheckboxListTile(
                  value: disModel.disList.contains(e),
                  onChanged: (a) {
                    if (sValues.contains(e)) {
                      disModel.remItem(e);
                    } else {
                      disModel.addItem(e);
                    }
                  },
                  title: Text(e),
                );
              },
            );
          },
        ).toList(),
      ),
    ),
    actions: [
      InkWell(
        onTap: () {
          onSubmit();
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.black,
          child: Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 16,
            ),
          ),
        ),
      )
    ],
  );
}
