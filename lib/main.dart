import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/common/routes.dart';
import 'package:fitness_app/firebase_options.dart';
import 'package:fitness_app/model/exercise_model.dart';
import 'package:fitness_app/model/home_model.dart';
import 'package:fitness_app/model/meal_model.dart';
import 'package:fitness_app/widgets/userform/fitness/model/f_model.dart';
import 'package:fitness_app/widgets/userform/health/model/h_model.dart';
import 'package:fitness_app/widgets/userform/personal/model/p_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var dataProvider = DataProvider();
    dataProvider.fetchAPIdata();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Tprovider()),
        ChangeNotifierProvider(create: (context) => MealProvider()),
        ChangeNotifierProvider(create: (context) => EProvider()),
        ChangeNotifierProvider(create: (context) => dataProvider),
        ChangeNotifierProvider(create: (context) => FoodRestrictionsM()),
        ChangeNotifierProvider(create: (context) => DietM()),
        ChangeNotifierProvider(create: (context) => DiseaseM()),
        ChangeNotifierProvider(create: (context) => FitnessModel()),
        ChangeNotifierProvider(create: (context) => PersonalData()),
      ],
      child: MaterialApp(
        routes: appRoutes,
      ),
    );
  }
}
