import 'package:fitness_app/common/appbar.dart';
import 'package:fitness_app/model/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CrossfitScreen extends StatefulWidget {
  const CrossfitScreen({super.key, required this.cList});

  final List<CrossfitInfo> cList;

  @override
  State<CrossfitScreen> createState() => _CrossfitScreenState();
}

class _CrossfitScreenState extends State<CrossfitScreen> with TickerProviderStateMixin {
  late AnimationController cont;
  late Animation anim;

  @override
  void initState() {
    super.initState();

    cont = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    anim = Tween<double>(begin: -10, end: 0).animate(CurvedAnimation(parent: cont, curve: Curves.easeInCirc));

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
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              color: Colors.black,
              padding: const EdgeInsets.only(left: 10, top: 25, bottom: 25),
              margin: const EdgeInsets.only(bottom: 10),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cList[index].name,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        widget.cList[index].level,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  AnimatedBuilder(
                    animation: anim,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(cont.value, 0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return CrossfitDetails(cInfo: widget.cList[index]);
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
                      );
                    },
                  ),
                ],
              ),
            );
          },
          itemCount: widget.cList.length,
        ),
      ),
    );
  }
}

class CrossfitDetails extends StatelessWidget {
  const CrossfitDetails({super.key, required this.cInfo});

  final CrossfitInfo cInfo;

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        child: Image.asset(
                          'assets/images/crossfit/${cInfo.images[0]}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Image.asset(
                          'assets/images/crossfit/${cInfo.images[1]}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Text(
                  cInfo.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 18,
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
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: cInfo.instructions.map(
                    (e) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 15, top: 5),
                        child: Text(
                          e,
                          style: TextStyle(
                            color: Colors.black,
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
        ),
      ),
    );
  }
}
