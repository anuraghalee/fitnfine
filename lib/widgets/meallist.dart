import 'package:fitness_app/common/appbar.dart';
import 'package:fitness_app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MealListScreen extends StatefulWidget {
  final String fCat;
  final ValueChanged<List<dynamic>> onChanged;

  const MealListScreen({
    super.key,
    required this.fCat,
    required this.onChanged,
  });

  @override
  State<MealListScreen> createState() => _MealListScreenState();
}

class _MealListScreenState extends State<MealListScreen> {
  List<dynamic> rList = [];

  @override
  void initState() {
    super.initState();
    if (rList.isEmpty) {
      APIservice().getCategoryRecipes(widget.fCat).then(
        (value) {
          setState(() {
            rList = value;
            widget.onChanged(value);
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        leading: IconButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: rList.isEmpty
            ? const SizedBox()
            : GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.73,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                children: List.generate(
                  rList.length > 20 ? 20 : rList.length,
                  (index) {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      color: Colors.green,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Image.network(
                              rList[index]['strMealThumb'],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            rList[index]['strMeal'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: GoogleFonts.oswald().fontFamily,
                              height: 1,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
