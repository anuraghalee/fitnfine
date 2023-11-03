import 'package:fitness_app/common/appbar.dart';
import 'package:fitness_app/model/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StretchingScreen extends StatefulWidget {
  const StretchingScreen({super.key, required this.sList});

  final List<StretchingInfo> sList;

  @override
  State<StretchingScreen> createState() => _StretchingScreenState();
}

class _StretchingScreenState extends State<StretchingScreen> with TickerProviderStateMixin {
  late AnimationController cont;
  late Animation anim;

  @override
  void initState() {
    super.initState();

    cont = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
  }

  @override
  void dispose() {
    cont.dispose();
    super.dispose();
  }

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
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(left: 10, top: 25, bottom: 20),
              margin: const EdgeInsets.only(bottom: 10),
              color: Colors.black,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.sList[index].name,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Level: ${widget.sList[index].level}",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Transform.translate(
                    offset: Offset(cont.value, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return StretchingDetails(sInfo: widget.sList[index]);
                            },
                          ));
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: widget.sList.length,
        ),
      ),
    );
  }
}

class StretchingDetails extends StatelessWidget {
  const StretchingDetails({super.key, required this.sInfo});

  final StretchingInfo sInfo;

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
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Image.asset(
                          'assets/images/stretching/${sInfo.images[0]}',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Image.asset(
                          'assets/images/stretching/${sInfo.images[1]}',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        "Name: ${sInfo.name}",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Text(
                        "Level: ${sInfo.level}",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Text(
                        "Target Muscles: ${sInfo.primaryMuscles}",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Text(
                        'Instructions: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: sInfo.instructions.map(
                          (e) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 15, top: 5),
                              child: Text(
                                e,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 18,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
