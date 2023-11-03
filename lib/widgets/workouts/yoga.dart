import 'package:fitness_app/common/appbar.dart';
import 'package:fitness_app/model/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YogaList extends StatefulWidget {
  const YogaList({super.key, required this.yList});

  final List<YogaCategory> yList;

  @override
  State<YogaList> createState() => _YogaListState();
}

class _YogaListState extends State<YogaList> with TickerProviderStateMixin {
  late AnimationController cont;
  late Animation anim;

  @override
  void initState() {
    super.initState();

    cont = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    anim = Tween<double>(begin: -30, end: 0).animate(CurvedAnimation(parent: cont, curve: Curves.easeInCirc));

    cont.repeat(reverse: true);
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
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Yoga Categories',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                color: Colors.black,
                padding: const EdgeInsets.only(left: 10, top: 25, bottom: 25),
                margin: const EdgeInsets.only(bottom: 10),
                child: Stack(
                  children: [
                    SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.yList[index].category_name,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            widget.yList[index].category_description,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: AnimatedBuilder(
                        animation: anim,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(cont.value, 0),
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return DifferentYoga(poses: widget.yList[index].poses);
                                  },
                                ));
                              },
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: widget.yList.length,
          ),
        ),
      ),
    );
  }
}

class DifferentYoga extends StatelessWidget {
  const DifferentYoga({super.key, required this.poses});

  final List<Yoga> poses;

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
        title: Text(
          poses[0].category_name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return YogaScreen(yInfo: poses[index]);
                      },
                    ),
                  );
                },
                child: Container(
                  color: Colors.black,
                  padding: const EdgeInsets.only(left: 10, top: 25, bottom: 25),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: Text(
                      poses[index].english_name,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: poses.length,
          ),
        ),
      ),
    );
  }
}

class YogaScreen extends StatelessWidget {
  const YogaScreen({super.key, required this.yInfo});

  final Yoga yInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: Appbar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          yInfo.english_name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: SizedBox(
                    height: 300,
                    child: Image.network(yInfo.url_png),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: RichText(
                    text: TextSpan(
                      text: "Name : ",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: yInfo.english_name,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: Text(
                    yInfo.category_name,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  child: RichText(
                    text: TextSpan(
                      text: "Description : ",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: yInfo.pose_description,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: RichText(
                    text: TextSpan(
                      text: "Benefits : ",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: yInfo.pose_benefits,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
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
      ),
    );
  }
}
