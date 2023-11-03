import 'package:fitness_app/widgets/userform/fitness/model/f_model.dart';
import 'package:flutter/material.dart';

class GoalsMenu extends StatefulWidget {
  const GoalsMenu({super.key, required this.onChanged, required this.fMod});

  final ValueChanged onChanged;
  final FitnessModel fMod;

  @override
  State<GoalsMenu> createState() => _GoalsMenuState();
}

class _GoalsMenuState extends State<GoalsMenu> {
  String val = '';

  @override
  Widget build(BuildContext context) {
    var menu = ['Muscle Gain', 'Weight Loss', 'Endurance'];
    String val = widget.fMod.fitnessGoal!;

    return InputDecorator(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: val.isNotEmpty ? val : null,
          padding: const EdgeInsets.only(left: 10),
          items: menu.map(
            (e) {
              return DropdownMenuItem(value: e, child: Text(e));
            },
          ).toList(),
          onChanged: (value) {
            setState(() {
              val = value!;
              widget.onChanged(value);
            });
          },
          style: const TextStyle(color: Colors.white, fontSize: 14),
          dropdownColor: Colors.black,
        ),
      ),
    );
  }
}

class ActivityMenu extends StatefulWidget {
  const ActivityMenu({super.key, required this.onChanged, required this.fMod});

  final ValueChanged onChanged;
  final FitnessModel fMod;

  @override
  State<ActivityMenu> createState() => _ActivityMenuState();
}

class _ActivityMenuState extends State<ActivityMenu> {
  @override
  Widget build(BuildContext context) {
    var menu = ['Sedentary', 'Lightly Active', 'Moderately Active', 'Very Active'];
    String val = widget.fMod.activityLevel!;

    return InputDecorator(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: val.isNotEmpty ? val : null,
          padding: const EdgeInsets.only(left: 10),
          items: menu.map(
            (e) {
              return DropdownMenuItem(value: e, child: Text(e));
            },
          ).toList(),
          onChanged: (value) {
            setState(() {
              val = value!;
              widget.onChanged(value);
            });
          },
          style: const TextStyle(color: Colors.white),
          dropdownColor: Colors.black,
        ),
      ),
    );
  }
}

class FLevelMenu extends StatefulWidget {
  const FLevelMenu({super.key, required this.onChanged, required this.fMod});

  final ValueChanged onChanged;
  final FitnessModel fMod;

  @override
  State<FLevelMenu> createState() => _FLevelMenuState();
}

class _FLevelMenuState extends State<FLevelMenu> {
  String val = '';

  @override
  Widget build(BuildContext context) {
    var menu = ['Beginner', 'Intermediate', 'Advanced'];
    String val = widget.fMod.fitnesslevel!;

    return InputDecorator(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          padding: const EdgeInsets.only(left: 10),
          value: val.isNotEmpty ? val : null,
          items: menu.map(
            (e) {
              return DropdownMenuItem(value: e, child: Text(e));
            },
          ).toList(),
          onChanged: (value) {
            setState(() {
              val = value!;
              widget.onChanged(value);
            });
          },
          style: const TextStyle(color: Colors.white),
          dropdownColor: Colors.black,
        ),
      ),
    );
  }
}

class WorkoutMenu extends StatefulWidget {
  const WorkoutMenu({super.key, required this.onChanged, required this.fMod});

  final ValueChanged onChanged;
  final FitnessModel fMod;

  @override
  State<WorkoutMenu> createState() => _WorkoutMenuState();
}

class _WorkoutMenuState extends State<WorkoutMenu> {
  @override
  Widget build(BuildContext context) {
    var menu = ['Cardio', 'Strength Training', 'Yoga', 'CrossFit'];
    String val = widget.fMod.workoutType!;

    return InputDecorator(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: val.isNotEmpty ? val : null,
          padding: const EdgeInsets.only(left: 10),
          items: menu.map(
            (e) {
              return DropdownMenuItem(value: e, child: Text(e));
            },
          ).toList(),
          onChanged: (value) {
            setState(() {
              val = value!;
              widget.onChanged(value);
            });
          },
          style: const TextStyle(color: Colors.white),
          dropdownColor: Colors.black,
        ),
      ),
    );
  }
}

class EquipmentMenu extends StatefulWidget {
  const EquipmentMenu({super.key, required this.onChanged, required this.fMod});

  final ValueChanged onChanged;
  final FitnessModel fMod;

  @override
  State<EquipmentMenu> createState() => _EquipmentMenuState();
}

class _EquipmentMenuState extends State<EquipmentMenu> {
  @override
  Widget build(BuildContext context) {
    var menu = ['Available', 'Not Available'];
    String val = widget.fMod.fitnessEquip!;

    return InputDecorator(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: val.isNotEmpty ? val : null,
          padding: const EdgeInsets.only(left: 10),
          items: menu.map(
            (e) {
              return DropdownMenuItem(value: e, child: Text(e));
            },
          ).toList(),
          onChanged: (value) {
            setState(() {
              val = value!;
              widget.onChanged(value);
            });
          },
          style: const TextStyle(color: Colors.white),
          dropdownColor: Colors.black,
        ),
      ),
    );
  }
}
