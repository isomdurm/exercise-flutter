import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fresh_cut_app/helpers/gradient_text_helper.dart';
import 'package:glassmorphism/glassmorphism.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  bool _isFetchingData = true;
  late TextEditingController _searchController;

  @override
  initState() {
    super.initState();

    _searchController = TextEditingController();

    _getStartup();
  }

  // make api call to fetch data
  void _getStartup() {
    setState(() {
      _isFetchingData = false;
    });
  }

  @override
  void dispose() {
    super.dispose();

    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: _isFetchingData ? Container(
        color: const Color(0xffffebf9),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            SizedBox(
              height: 20.0,
              width: 20.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xffffb8ea)),
                strokeWidth: 2.0,
              ),
            ),
          ],
        ),
      ) : SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0, top: 100.0, left: 25.0),
                  alignment: Alignment.bottomLeft,
                  child: const GradientText(
                    'Trending Today',
                    style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.0
                    ),
                    gradient: LinearGradient(colors: [
                      Color(0xfff4bc3c),
                      Color(0xffda3433)
                    ]),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30.0, top: 110.0, left: 10.0),
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    '🔥',
                    style: TextStyle(
                        fontSize: 40.0
                    ),
                  ),
                )
              ],
            ),

            /// convert into list view for multiple elements in model data pretend api'

            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, i) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 40.0),
                    child: Center(
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0.0,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 40.0,
                              height: MediaQuery.of(context).size.width - 40.0,
                              child: Image.asset(
                                "assets/images/rumble.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 40.0,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 20.0),
                                  width: MediaQuery.of(context).size.width - 80.0,
                                  height: 4,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    child: LinearProgressIndicator(
                                      value: 0.7,
                                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xfff4bc3c)),
                                      backgroundColor: Colors.white.withAlpha(28),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          GlassmorphicContainer(
                            borderRadius: 20,
                            width: MediaQuery.of(context).size.width - 40.0,
                            height: MediaQuery.of(context).size.width + 100.0,
                            blur: 7,
                            padding: const EdgeInsets.all(20),
                            alignment: Alignment.bottomCenter,
                            border: 0,
                            linearGradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xFFffffff).withOpacity(0.1),
                                  const Color(0xFFFFFFFF).withOpacity(0.05),
                                ],
                                stops: const [
                                  0.1,
                                  1,
                                ]),
                            borderGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xFFffffff).withOpacity(0.5),
                                const Color((0xFFFFFFFF)).withOpacity(0.5),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 10.0),
                                      width: MediaQuery.of(context).size.width - 60.0,
                                      height: MediaQuery.of(context).size.width - 60.0,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20.0),
                                        ),
                                        child: Image.asset(
                                          "assets/images/rumble.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(left: 25.0, top: 25.0),
                                          child: const Text(
                                            'Title',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 32.0
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(left: 25.0, top: 0.0),
                                              child: const Text(
                                                '+10 New Videos',
                                                style: TextStyle(
                                                  color:  Color(0xfff4bc3c),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(right: 6.0),
                                                  child: Center(
                                                    child: Image.asset(
                                                      "assets/images/view.png",
                                                      width: 16.0,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.only(right: 25.0, top: 0.0),
                                                  child: const Text(
                                                    '15/30',
                                                    style: TextStyle(
                                                      color:  Colors.grey,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(top: 25.0),
                                          width: MediaQuery.of(context).size.width - 80.0,
                                          height: 4,
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                                            child: LinearProgressIndicator(
                                              value: 0.7,
                                              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xfff4bc3c)),
                                              backgroundColor: Colors.white.withAlpha(28),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Positioned(
                                  left: MediaQuery.of(context).size.width / 1.55,
                                  top: MediaQuery.of(context).size.width - 90.0,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 80.0,
                                        height: 80.0,
                                        margin: const EdgeInsets.only(left: 4),
                                        child: Center(
                                          child: Image.asset(
                                            "assets/images/play-button.png",
                                            width: 35.0,
                                          ),
                                        ),
                                      ),
                                      GlassmorphicContainer(
                                        width: 80.0,
                                        height: 80.0,
                                        borderRadius: 40.0,
                                        blur: 2.3,
                                        alignment: Alignment.bottomCenter,
                                        border: 0.5,
                                        linearGradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              const Color(0xFFffffff).withOpacity(0.10),
                                              const Color(0xFFFFFFFF).withOpacity(0.05),
                                            ],
                                            stops: const [
                                              0.1,
                                              1,
                                            ]),
                                        borderGradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            const Color(0xFFffffff).withOpacity(0.3),
                                            const Color((0xFFFFFFFF)).withOpacity(0.05),
                                          ],
                                        ),
                                        child: Container(
                                          margin: const EdgeInsets.only(left: 7.0),
                                          child: Center(
                                            child: Image.asset(
                                              "assets/images/play-button.png",
                                              width: 35.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 7.0, bottom: 50.0),
              child: Center(
                child: Image.asset(
                  "assets/images/security.png",
                  width: MediaQuery.of(context).size.width / 1.8,
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width - 40.0,
              padding: const EdgeInsets.only(bottom: 15.0),
              child: const Text(
                'Check back soon for new clips and creator content.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: const Text(
                'In the meantime join our discord.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 250.0),
              child: Stack(
                children: [
                  Positioned(
                    top: 5.0,
                    left: 10.0,
                    child: Container(
                      height: 20.0,
                      decoration: const BoxDecoration(
                        color: Color(0xfff4bc3c),
                        borderRadius: BorderRadius.all(Radius.circular(100.0))
                      ),
                      width: MediaQuery.of(context).size.width - 60.0,
                    ),
                  ),
                  GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width - 40.0,
                    height: 70,
                    borderRadius: 35,
                    blur: 9,
                    alignment: Alignment.center,
                    border: 0.8,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.1),
                          const Color(0xFFFFFFFF).withOpacity(0.05),
                        ],
                        stops: const [
                          0.1,
                          1,
                        ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xfff4bc3c).withOpacity(0.6),
                        const Color(0xfff4bc3c).withOpacity(0.2),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10.0),
                          child: Center(
                            child: Image.asset(
                              "assets/images/discord-icon.png",
                              width: 30.0,
                            ),
                          ),
                        ),
                        const Text(
                          'Join Metaview Discord',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      )
    );
  }
}

