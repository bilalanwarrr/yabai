import 'package:flutter/material.dart';

//schedule

const String today = 'Today';
const String upcoming = 'Upcoming';
const String past = 'Past';
bool isLocation = false;
String selectedItem = '';
TabController? tabController;

appBarSize(BuildContext context) {
  return Size(width(context), 60);
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
