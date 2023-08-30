import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yabai/components/textformfield.dart';
import 'package:yabai/provider/custom_provider.dart';
import 'package:yabai/utils/assets_routes.dart';
import 'package:yabai/utils/colors.dart';
import 'package:yabai/utils/const.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:yabai/utils/text_style.dart';
import 'package:yabai/views/dashboard/home/components/home_screen_components.dart';
import 'package:yabai/views/dashboard/profile/view/profile_screen.dart';

import '../../notifications/view/notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    var customPro = Provider.of<CustomProvider>(context);
    return Scaffold(
        backgroundColor: colorOne,
        body: SingleChildScrollView(
          child: SizedBox(
            height: height(context),
            child: Column(children: [
              // 40.sh,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                      width: 205,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NotificationsScreen()));
                          },
                          child: Icon(
                            Icons.notifications_outlined,
                            color: kwhiteColor,
                          )),
                      15.sw,
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()));
                        },
                        child: Icon(
                          Icons.person,
                          color: kwhiteColor,
                        ),
                      ),
                      40.sw
                    ],
                  )
                ],
              ),
              Container(
                  width: width(context),
                  child: Column(children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: MyTextField(
                          validator: (v) {},
                          borderRadius: 30,
                          hint: 'Search',
                          hintColor: klightGreyColor,
                          prefixIcon:
                              const Icon(Icons.search, color: klightGreyColor)),
                    ),
                    // const Spacer(),
                    20.sh,
                    InkWell(
                        onTap: () {
                          HomeScreenComponents().showMyDialog(context);
                        },
                        child: Column(
                          children: [
                            Image.asset(AssetsIconsRoutes.locationIcon,
                                height: 30, width: 22),
                            5.sh,
                            Text('My Location',
                                style: robotoStyle(
                                    size: 16,
                                    weight: FontWeight.w500,
                                    color: primaryColor)),
                          ],
                        )),
                    // const Spacer()
                  ])),
              Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var i = items[index];
                      var ii = i['items'] as List;

                      return Container(
                        margin:
                            EdgeInsets.only(bottom: 10, left: 20, right: 20),
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        // height: 120,
                        decoration: BoxDecoration(
                            color: colorTwo,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${i['title']}',
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: primaryColor)),
                            ),
                            15.sh,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: ii
                                    .map((e) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              tabController!.animateTo(1);
                                              selectedItem = e['title'];
                                              customPro.setIndex(1);
                                            });
                                            print(tabController!.index);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  '${e['img']}',
                                                  height: 60,
                                                  width: 60,
                                                ),
                                                5.sh,
                                                Text(
                                                  '${e['title']}',
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: primaryColor)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ]),
          ),
        ));
  }
}

class ClockTicks extends StatelessWidget {
  ClockTicks({Key? key}) : super(key: key);
  double unit = 12.0;
  List hours = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  List images = [
    AssetsIconsRoutes.coffeeIcon,
    AssetsIconsRoutes.fastFoodIcon,
    AssetsIconsRoutes.sushiIcon,
    AssetsIconsRoutes.nightLifeIcon,
    AssetsIconsRoutes.beerGlassIcon,
    AssetsIconsRoutes.cocktailIcon,
    AssetsIconsRoutes.cheesecakeIcon,
    AssetsIconsRoutes.ramenIcon,
    AssetsIconsRoutes.eggBaconIcon,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        for (var i = 0; i < hours.length; i++)
          Center(
              child: Transform.rotate(
            // convert degrees to radians
            angle: math.pi / 180 * 360 / 9 * i,
            child: Transform.translate(
              offset: Offset(0, i + 1 % 3 == 0 ? -9.7 * unit : -10.2 * unit),
              child: Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffD9D5FB), Color(0xffFB8AB9)]),
                    shape: BoxShape.circle,
                  ),
                  child: Transform.rotate(
                      // convert degrees to radians
                      angle: -(math.pi / 180 * 360 / 9 * i),
                      child: Image.asset(
                        images[i],
                        //  height: 40,
                      ))),
            ),
          ))
      ],
    );
  }
}

class CircleButton extends StatelessWidget {
  GestureTapCallback onTap;
  IconData iconData;
  String? icon;

  CircleButton(
      {Key? key, required this.onTap, required this.iconData, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 50.0;

    return InkResponse(
      onTap: onTap,
      child: Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            icon!,
            color: primaryColor,
          )
          // Icon(
          //   iconData,
          //   color: Colors.black,
          // ),
          ),
    );
  }
}

const items = [
  {
    'title': 'Foods',
    'items': [
      {'title': 'Restaurants', 'img': 'assets/icons/restaurants.png'},
      {'title': 'Fast Foods', 'img': 'assets/icons/fast_food.png'},
      {'title': 'Brunch', 'img': 'assets/icons/eggbacon.png'},
      {'title': 'Noodles', 'img': 'assets/icons/ramen.png'},
      {'title': 'Sushi', 'img': 'assets/icons/sushi.png'},
      {'title': 'Pizza', 'img': 'assets/icons/pizza.png'},
      {'title': 'Dessert', 'img': 'assets/icons/cheesecake.png'},
      {'title': 'Buffet', 'img': 'assets/icons/buffet.png'},
      {'title': 'Steak', 'img': 'assets/icons/steak.png'},
      {'title': 'Tacos', 'img': 'assets/icons/tacos.png'},
      {'title': 'Sandwich', 'img': 'assets/icons/sandwich.png'},
      {'title': 'Ice Cream', 'img': 'assets/icons/icecreams.png'},
      {'title': 'Poke', 'img': 'assets/icons/poke.png'},
      {'title': 'Chicken', 'img': 'assets/icons/chicken.png'},
      {'title': 'Salad', 'img': 'assets/icons/salad.png'},
      {'title': 'Donuts', 'img': 'assets/icons/doughnuts.png'},
      {'title': 'Vegetarian', 'img': 'assets/icons/vegetarian.png'},
      {'title': 'Seafood', 'img': 'assets/icons/seafood.png'},
    ]
  },
  {
    'title': 'Drinks',
    'items': [
      {'title': 'Coffee', 'img': 'assets/icons/coffee.png'},
      {'title': 'Pub', 'img': 'assets/icons/beer_glass.png'},
      {'title': 'Bar', 'img': 'assets/icons/cocktail.png'},
      {'title': 'Bubble Tea', 'img': 'assets/icons/tea.png'},
    ]
  },
  {
    'title': 'Things to do',
    'items': [
      {'title': 'Theme park', 'img': 'assets/icons/themepark.png'},
      {'title': 'Park', 'img': 'assets/icons/park.png'},
      {'title': 'Gym', 'img': 'assets/icons/gym.png'},
      {'title': 'Movie theater', 'img': 'assets/icons/movietheater.png'},
      {'title': 'Beach', 'img': 'assets/icons/beach.png'},
      {'title': 'Canoe', 'img': 'assets/icons/canoe.png'},
      {'title': 'Beach', 'img': 'assets/icons/beach.png'},
      {'title': 'Roller Stackes', 'img': 'assets/icons/rollerskates.png'},
      {'title': 'Stakeboard', 'img': 'assets/icons/skateboard.png'},
      {'title': 'Ice Skates', 'img': 'assets/icons/iceskating.png'},
      {'title': 'Pool', 'img': 'assets/icons/pool.png'},
      {'title': 'Bouldering', 'img': 'assets/icons/bowling.png'},
      {'title': 'Archery', 'img': 'assets/icons/archery.png'},
      {'title': 'Hockey', 'img': 'assets/icons/hockey.png'},
      {'title': 'Football', 'img': 'assets/icons/football.png'},
      {'title': 'Soccer', 'img': 'assets/icons/soccer.png'},
      {'title': 'Volleyball', 'img': 'assets/icons/volleyball.png'},
      {'title': 'Basketball', 'img': 'assets/icons/basketball.png'},
      {'title': 'Ski', 'img': 'assets/icons/ski.png'},
      {'title': 'Yoga', 'img': 'assets/icons/yoga.png'},
      {'title': 'Ping Pong', 'img': 'assets/icons/pingpong.png'},
      {'title': 'Chess', 'img': 'assets/icons/chess.png'},
      {'title': 'Karting', 'img': 'assets/icons/karting.png'},
    ]
  },
  {
    'title': 'Nightlife',
    'items': [
      {'title': 'Concert', 'img': 'assets/icons/concert.png'},
      {'title': 'Club', 'img': 'assets/icons/club.png'},
      {'title': 'Bowling', 'img': 'assets/icons/bowling.png'},
      {'title': 'Pub', 'img': 'assets/icons/beer_glass.png'},
      {'title': 'Bar', 'img': 'assets/icons/cocktail.png'},
    ]
  }
];
