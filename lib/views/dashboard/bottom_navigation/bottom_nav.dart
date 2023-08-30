import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yabai/provider/custom_provider.dart';
import 'package:yabai/utils/assets_routes.dart';

import 'package:yabai/views/dashboard/home/view/home_screen.dart';
import 'package:yabai/views/dashboard/live_status/view/live_status_friends_screen.dart';
import 'package:yabai/views/dashboard/map/view/map_screen.dart';
import 'package:yabai/views/dashboard/profile/view/profile_screen.dart';
import 'package:yabai/views/dashboard/events/view/events_screen.dart';

import '../../../utils/colors.dart';
import '../../../utils/const.dart';

class MyBottomNav extends StatefulWidget {
  const MyBottomNav({super.key});

  @override
  State<MyBottomNav> createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav>
    with SingleTickerProviderStateMixin {
  List screens = const [HomeScreen(), MapScreen(), EventsScreen()];
  // TabController? _tabController;
  // int currentIndex = 0;
  // int pageIndex = 0;

  void onTabTapped(int index) {

    tabController!.animateTo((tabController!.index + 1) % 3);
  }

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(vsync: this, length: screens.length, initialIndex: 0);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var customPro = Provider.of<CustomProvider>(context);
    return Scaffold(
      extendBody: true,
      // body: screens.elementAt(currentIndex),
      body: TabBarView(
        controller: tabController,
        children: screens.map<Widget>((e) => e).toList(),
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 30),
        color: knavyBlueColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  tabController!.animateTo(0);
                  selectedItem = '';
                  customPro.setIndex(0);
                });
              },
              child: Icon(Icons.home_outlined,
                  color: customPro.currentIndex == 0 ? primaryColor : kwhiteColor, size: 31,),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  tabController!.animateTo(1);
                  customPro.setIndex(1);
                });
              },
              child: Icon(Icons.search,
                  color: customPro.currentIndex == 1 ? primaryColor : kwhiteColor,size: 32,),
            ),
            GestureDetector(onTap: (){
              setState(() {
                tabController!.animateTo(2);
                selectedItem = '';
                customPro.setIndex(2);
              });
            },
              child: Image.asset(AssetsIconsRoutes.logoIcon,
                  height: 25,
                  color: customPro.currentIndex == 2 ? primaryColor : kwhiteColor),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     backgroundColor: knavyBlueColor,
      //     elevation: 0,
      //     selectedIconTheme: const IconThemeData(color: kblackColor),
      //     selectedFontSize: 10,
      //     unselectedFontSize: 10,
      //     iconSize: 30,
      //     type: BottomNavigationBarType.fixed,
      //     showUnselectedLabels: true,
      //     currentIndex: tabController!.index,
      //     onTap: onTabTapped,
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.home_outlined,
      //               color: tabController!.index == 0 ? primaryColor : kwhiteColor),
      //           label: ''),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.search,
      //               color: tabController!.index == 1 ? primaryColor : kwhiteColor),
      //           label: ''),
      //       BottomNavigationBarItem(
      //           icon: Image.asset(AssetsIconsRoutes.logoIcon,
      //               height: 25,
      //               color: tabController!.index == 2 ? primaryColor : kwhiteColor),
      //           label: '')
      //     ])
    );
  }
}
