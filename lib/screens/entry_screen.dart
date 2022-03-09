import 'dart:ui';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fresh_cut_app/helpers/storage_helper.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'home/home_screen.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {

  int _currentTabIndex = 0;
  bool _isFetchingData = false;

  final _page1 = GlobalKey<NavigatorState>();
  final _page2 = GlobalKey<NavigatorState>();
  final _page3 = GlobalKey<NavigatorState>();
  final _page4 = GlobalKey<NavigatorState>();
  final _page5 = GlobalKey<NavigatorState>();

  @override
  initState() {
    super.initState();

    _getStartup();
  }

  // make api call to fetch data
  void _getStartup() async {
    var _savedTab = await StorageHelper.readData('selectedTab') ?? 0;

    setState(() {
      _currentTabIndex = _savedTab;
      _isFetchingData = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTabTapped(int index) {
    StorageHelper.saveData('selectedTab', index);

    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _currentTabIndex == 0 ? Image.asset(
                  'assets/images/fire-icon-selected.png',
                  width: 60.0,
                ) : Container(
                  width: 75.0,
                ),
                _currentTabIndex == 1 ? Image.asset(
                  'assets/images/fire-icon-selected.png',
                  width: 60.0,
                ) : Container(
                  width: 75.0,
                ),
                _currentTabIndex == 2 ? Image.asset(
                  'assets/images/fire-icon-selected.png',
                  width: 60.0,
                ) : Container(
                  width: 75.0,
                ),
                _currentTabIndex == 3 ? Image.asset(
                  'assets/images/fire-icon-selected.png',
                  width: 60.0,
                ) : Container(
                  width: 75.0,
                ),
                _currentTabIndex == 4 ? Image.asset(
                  'assets/images/fire-icon-selected.png',
                  width: 60.0,
                ) : Container(
                  width: 75.0,
                ),
              ],
            ),
          ),
          GlassmorphicContainer(
            width: MediaQuery.of(context).size.width,
            height: 105.0,
            borderRadius: 30,
            blur: 20,
            alignment: Alignment.bottomCenter,
            border: 0,
            linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.55),
                  Colors.black.withOpacity(0.05),
                ],
                stops: const [
                  0.1,
                  1,
                ]),
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green.withOpacity(0.5),
                const Color((0xFFFFFFFF)).withOpacity(0.5),
              ],
            ),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                child: Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: BottomNavigationBar(
                  selectedFontSize: 12.0,
                  unselectedFontSize: 0.0,
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  type: BottomNavigationBarType.fixed,
                  onTap: onTabTapped, // new
                  currentIndex: _currentTabIndex, // new
                  items: [
                    BottomNavigationBarItem(
                      title: const Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Text(
                          'Hot',
                          style: TextStyle(
                            color: Color(0xfff4bc3c)
                          ),
                        ),
                      ),
                      icon: Badge(
                        showBadge: false,
                        badgeContent: const Text(''),
                        child: _currentTabIndex == 0 ? Image.asset(
                          'assets/images/fire-icon-selected.png',
                          width: 35.0,
                        ) : Image.asset(
                          'assets/images/fire-icon.png',
                          width: 35.0,
                        )
                      ),
                    ),
                    BottomNavigationBarItem(
                      title: Container(
                        margin: const EdgeInsets.only(top: 6.0),
                        child: const Text(
                          'Web',
                          style: TextStyle(
                              color: Color(0xfff4bc3c)
                          ),
                        ),
                      ),
                      icon: Badge(
                        showBadge: false,
                        badgeContent: const Text(''),
                          child: _currentTabIndex == 1 ? Image.asset(
                            'assets/images/safari-icon-selected.png',
                            width: 30.0,
                          ) : Image.asset(
                            'assets/images/safari-icon.png',
                            width: 30.0,
                          )
                      ),
                    ),
                    BottomNavigationBarItem(
                      title: Container(
                        margin: const EdgeInsets.only(top: 6.0),
                        child: const Text(
                          'Home',
                          style: TextStyle(
                              color: Color(0xfff4bc3c)
                          ),
                        ),
                      ),
                      icon: Badge(
                        showBadge: false,
                        badgeContent: const Text(''),
                        child: _currentTabIndex == 2 ? Image.asset(
                          'assets/images/home-icon-selected.png',
                          width: 30.0,
                        ) : Image.asset(
                          'assets/images/home-icon.png',
                          width: 30.0,
                        )
                      ),
                    ),
                    BottomNavigationBarItem(
                      title: Container(
                        margin: const EdgeInsets.only(top: 4.0),
                        child: const Text(
                          'Chat',
                          style: TextStyle(
                              color: Color(0xfff4bc3c)
                          ),
                        ),
                      ),
                      icon: Badge(
                        showBadge: false,
                        badgeContent: const Text(''),
                        child: _currentTabIndex == 3 ? Image.asset(
                          'assets/images/chat-icon-selected.png',
                          width: 30.0,
                        ) : Image.asset(
                          'assets/images/chat-icon.png',
                          width: 30.0,
                        )
                      ),
                    ),
                    BottomNavigationBarItem(
                      title: const Padding(
                        padding: EdgeInsets.only(top: 6.0),
                        child: Text(
                          'Profile',
                          style: TextStyle(
                              color: Color(0xfff4bc3c)
                          ),
                        ),
                      ),
                      icon: Badge(
                        showBadge: false,
                        badgeColor: const Color(0xff00cc66),
                        position: BadgePosition.topStart(),
                        badgeContent: const Text(''),
                        child: SizedBox(
                          height: 30.0,
                          width: 30.0,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.lightBlue,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: _currentTabIndex == 4 ? const Color(0xfff4bc3c) : Colors.grey[800],
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              width: 30.0,
                              height: 30.0,
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                                size: 25.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  selectedItemColor: Colors.black,
                ),
                ),
              ),
            ),
          ),
        ],
      ),
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
      ) : IndexedStack(
        index: _currentTabIndex,
        children: <Widget>[
          Navigator(
            key: _page1,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const HomeScreen(),
            ),
          ),
          Navigator(
            key: _page2,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const HomeScreen(),
            ),
          ),
          Navigator(
            key: _page3,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const HomeScreen(),
            ),
          ),
          Navigator(
            key: _page4,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const HomeScreen(),
            ),
          ),
          Navigator(
            key: _page5,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const HomeScreen(),
            ),
          ),
        ],
      ),
    );
  }
}

