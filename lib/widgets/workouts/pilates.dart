import 'package:fitness_app/common/appbar.dart';
import 'package:fitness_app/model/model.dart';
import 'package:fitness_app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:google_fonts/google_fonts.dart';

class PilatesScreen extends StatefulWidget {
  const PilatesScreen({super.key, required this.pList});
  final List<PilatesInfo> pList;

  @override
  State<PilatesScreen> createState() => _PilatesScreenState();
}

class _PilatesScreenState extends State<PilatesScreen> with TickerProviderStateMixin {
  late AnimationController cont;
  late Animation anim;
  var ylist = [];

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
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        height: MediaQuery.of(context).size.height - 24 - kToolbarHeight,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.only(left: 10, top: 25, bottom: 20, right: 8),
              color: Colors.black,
              child: Stack(
                children: [
                  SizedBox(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.pList[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Level: ${widget.pList[index].level}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedBuilder(
                    animation: anim,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(cont.value, 0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PilatesDetails(
                                    pInfo: widget.pList[index],
                                  ),
                                ));
                              },
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          },
          itemCount: widget.pList.length,
        ),
      ),
    );
  }
}

class PilatesDetails extends StatefulWidget {
  const PilatesDetails({super.key, required this.pInfo});

  final PilatesInfo pInfo;

  @override
  State<PilatesDetails> createState() => _PilatesDetailsState();
}

class _PilatesDetailsState extends State<PilatesDetails> {
  var ylist = [];

  @override
  void initState() {
    super.initState();

    if (ylist.isEmpty) {
      APIservice().getVideo().then(
        (value) {
          setState(() {
            ylist = value;
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
        title: Text(
          widget.pInfo.name,
          style: const TextStyle(fontSize: 18),
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
                InkWell(
                  onTap: () async {
                    await FlutterWebBrowser.openWebPage(
                      url: 'https://www.youtube.com/watch?v=${ylist[1]}',
                      safariVCOptions: const SafariViewControllerOptions(),
                    );
                  },
                  child: SizedBox(
                    height: 200,
                    child: Image.network('${ylist[0]}'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: SizedBox(
                    child: Text(
                      'Click above to view video ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Image.asset('assets/images/pilates/${widget.pInfo.images[0]}'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Image.asset('assets/images/pilates/${widget.pInfo.images[1]}'),
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
                        "Name: ${widget.pInfo.name}",
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
                        "Level: ${widget.pInfo.level}",
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
                        "Target Muscles: ${widget.pInfo.primaryMuscles}",
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
                        children: widget.pInfo.instructions.map(
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
