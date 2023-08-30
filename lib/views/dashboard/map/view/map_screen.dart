import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yabai/utils/colors.dart';
import 'package:yabai/utils/const.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yabai/views/dashboard/map/components/map_screen_components.dart';

import '../../../../components/textformfield.dart';
import '../../../../provider/custom_provider.dart';
import '../../../../utils/assets_routes.dart';
import '../../../../utils/text_style.dart';
import '../../home/components/home_screen_components.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<String> list = ['Relevant', 'Open', 'Price', 'Top Rated'];
  late GoogleMapController mapController;
  List<String> selectedFilters = [];
  List<String> selectedPrices = [];

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  final LatLng center = const LatLng(45.521563, -122.677433);
  CameraPosition? initialPosition;
  BitmapDescriptor? markerIcon;
  Marker? marker;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();

    getPosition();

    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(50, 50)), 'assets/images/m2.png')
        .then((d) {
      markerIcon = d;
    });
  }

  getPosition() async {
    await GoogleMapPostionController.instance
        .getCurrentPosition()
        .then((currentPosition) async {
      log('[currentPosition] `${currentPosition}`');

      if(currentPosition != null){
        setState(() {
          initialPosition = CameraPosition(
            target: LatLng(
              currentPosition.latitude,
              currentPosition.longitude,
            ),
            zoom: 14.4746,
          );
        });
      }

      if(currentPosition != null){
        marker =
            Marker(
                markerId: const MarkerId(
                    "id"), // a string for marker unique id
                icon:
                markerIcon!, // options for hues and custom imgs
                position: LatLng(
                  initialPosition!.target.latitude,
                  initialPosition!.target.longitude,
                )
            );
      }

      mapController.animateCamera(CameraUpdate.newCameraPosition(initialPosition!));
      setState(() {
      });
    });
    print('Current Position-------- ${initialPosition}');
  }

  @override
  Widget build(BuildContext context) {
    var customPro = Provider.of<CustomProvider>(context);

    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: WillPopScope(
        onWillPop: () async {
          setState(() {
          tabController!.animateTo(0);
          selectedItem = '';
          customPro.setIndex(0);
          });
          print(tabController!.index);
          return false;
        },
        child: initialPosition != null
            ? SizedBox(
          height: height(context),
          child: Column(
            children: [
              Expanded(
                child: Stack(children: [
                  GoogleMap(
                    onMapCreated: onMapCreated,
                    myLocationEnabled: false,
                    myLocationButtonEnabled: false,
                    initialCameraPosition: CameraPosition(
                        target: initialPosition!.target, zoom: 11.0),

                    markers: {
                      Marker(
                          markerId: const MarkerId(
                              "id"), // a string for marker unique id
                          icon:
                          markerIcon!, // options for hues and custom imgs
                          position: LatLng(
                            initialPosition!.target.latitude,
                            initialPosition!.target.longitude,
                          ),
                          // lat and long doubles

                          onTap: () {
                            MapScreenComponents().bottomSheet(context);
                            //this is what you're looking for!
                          }),
                    },
                  ),
                  Positioned(
                      bottom: 100,
                      right: 18,
                      child: GestureDetector(
                        onTap: () async {
                          getPosition();
                        },
                        child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: primaryColor, shape: BoxShape.circle),
                            child: Center(child: Icon(Icons.my_location, size: 20, color: kwhiteColor,))),
                      )),
                  Positioned(
                    top: 0,
                    child: Container(
                        width: width(context),
                        decoration: const BoxDecoration(
                            color: knavyBlueColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40.0),
                            child: Column(children: [
                              60.sh,
                              MyTextField(
                                  validator: (v) {},
                                  borderRadius: 30,
                                  hint: selectedItem.isEmpty
                                      ? 'Search'
                                      : selectedItem,
                                  hintColor: klightGreyColor,
                                  prefixIcon: const Icon(Icons.search,
                                      color: klightGreyColor)),
                              30.sh,
                              GestureDetector(
                                onTap: () {
                                  HomeScreenComponents()
                                      .showMyDialog(context);
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                        AssetsIconsRoutes.locationIcon,
                                        height: 30,
                                        width: 22),
                                    Text('My Location',
                                        style: robotoStyle(
                                            size: 12,
                                            weight: FontWeight.w500,
                                            color: primaryColor)),
                                  ],
                                ),
                              ),
                              30.sh,
                              Container(
                                  height: 35,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.all(0),
                                      physics:
                                      const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: list.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                            onTap: () {
                                              if (list[index] == 'Price') {
                                                showPricesSheet();
                                                // MapScreenComponents().priceBottomSheet(context);
                                              } else {
                                                setState(() {
                                                  selectedFilters.contains(
                                                      list[index])
                                                      ? selectedFilters
                                                      .remove(
                                                      list[index])
                                                      : selectedFilters
                                                      .add(list[index]);
                                                });
                                                // MapScreenComponents()
                                                //     .bottomSheet(context);
                                              }
                                            },
                                            child: Container(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 20),
                                                margin: EdgeInsets.only(
                                                    right:
                                                    (list.length - 1) ==
                                                        index
                                                        ? 0
                                                        : 10),
                                                decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(
                                                            8))),
                                                child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Text(
                                                        list[index],
                                                        style: robotoStyle(
                                                            size: 12,
                                                            weight:
                                                            FontWeight
                                                                .w400,
                                                            color:
                                                            kwhiteColor),
                                                      ),
                                                      5.sw,
                                                      list[index] == 'Price'
                                                          ? Icon(
                                                        Icons
                                                            .arrow_drop_down_sharp,
                                                        color:
                                                        kwhiteColor,
                                                        size: 20,
                                                      )
                                                          : selectedFilters
                                                          .contains(
                                                          list[
                                                          index])
                                                          ? Icon(
                                                        Icons
                                                            .done,
                                                        color:
                                                        kwhiteColor,
                                                        size: 18,
                                                      )
                                                          : Container()
                                                    ])),
                                          ))),
                              10.sh,
                            ]))),
                  )
                ]),
              ),
              60.sh,
            ],
          ),
        )
            : Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  showPricesSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
              color: kbackgroundColor,
              padding: const EdgeInsets.all(10),
              height: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.sh,
                  Text(
                    'Price',
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kwhiteColor)),
                  ),
                  10.sh,
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: priceList.length,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedPrices.contains(priceList[index]) ==
                                          true
                                      ? selectedPrices.remove(priceList[index])
                                      : selectedPrices.add(priceList[index]);
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      right:
                                          priceList[index].length - 1 == index
                                              ? 0
                                              : 10),
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: selectedPrices
                                                  .contains(priceList[index]) ==
                                              true
                                          ? kwhiteColor
                                          : primaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      '${'\$' * (index + 1)}',
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: selectedPrices.contains(
                                                          priceList[index]) ==
                                                      true
                                                  ? kblackColor
                                                  : kwhiteColor)),
                                    ),
                                  )),
                            )),
                  ),
                  20.sh,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          height: 45,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Clear',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: kblackColor)),
                          ),
                          color: kwhiteColor,
                        )),
                        20.sw,
                        Expanded(
                            child: MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          height: 45,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Apply',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: kwhiteColor)),
                          ),
                          color: primaryColor,
                        ))
                      ],
                    ),
                  )
                ],
              ),
            );
          });
        });
  }
}

const priceList = ['500', '1000', '1500', '2000'];

class GoogleMapPostionController {
  static GoogleMapPostionController? _instance;
  static GoogleMapPostionController get instance {
    _instance ??= GoogleMapPostionController._init();
    return _instance!;
  }

  GoogleMapPostionController._init();

  LatLng? _position;
  LatLng? get position => _position;

  void setPosition(LatLng position) {
    _position = position;
  }

  void clearPosition() {
    _position = null;
  }

  bool get hasPosition => _position != null;

  Future<bool> checkIfLocationIsEnabled() async {
    //  bool serviceEnabled;
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    final bool isLocationServiceEnabled =
        await Geolocator.isLocationServiceEnabled();

    log('[isLocationServiceEnabled] `$isLocationServiceEnabled`]');
    log('[Permission] `$permission`]');
    if (isLocationServiceEnabled == false) {
      log('Location services are disabled.');

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();

        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
    // return permission
  }

  Future<Position?> getCurrentPosition() async {
    try {
      return await checkIfLocationIsEnabled().then((allowed) async {
        if (allowed) {
          final Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );

          log('[Position] `$position`]');
          return position;
        } else {
          log(
            'Location permission is denied',
          );
          return null;
        }
      });
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
