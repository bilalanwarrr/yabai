import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yabai/utils/colors.dart';
import 'package:yabai/utils/sized_box.dart';

class InviteUsers extends StatefulWidget {
  const InviteUsers({Key? key}) : super(key: key);

  @override
  State<InviteUsers> createState() => _InviteUsersState();
}

class _InviteUsersState extends State<InviteUsers> {
  String searchTxt = '';
  List<dynamic> selectedUsers = [];
  bool isCopy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: knavyBlueColor,
      appBar: AppBar(
        backgroundColor: knavyBlueColor,
        iconTheme: IconThemeData(color: kwhiteColor),
        elevation: 0.0,
        title: Text('Add People', style: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 18,
                fontWeight:
                FontWeight.w600,
                color: kwhiteColor))),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      onChanged: (val) {
                        setState(() {
                          searchTxt = val;
                        });
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: kwhiteColor, //kgreyColor.withOpacity(0.1),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kwhiteColor),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: primaryColor),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          hintText: 'Type here...',
                          hintStyle: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: kblackColor))),
                    ),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showSocial();
                        // Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.only(left: 5),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: kwhiteColor),
                        child: Center(
                          child: Text('Share', style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: kblackColor)),),
                        ),
                      ),
                    ),
                  ],
                ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.pop(context);
                //     setState(() {
                //       isCopy = true;
                //     });
                //   },
                //   child: Container(
                //     height: 50,
                //     margin: EdgeInsets.only(left: 5),
                //     padding: EdgeInsets.symmetric(horizontal: 12),
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(12),
                //         color: kwhiteColor),
                //     child: Center(
                //       child: isCopy == false ? Icon(Icons.copy, color: kblackColor,) : Text('Copied', style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: kblackColor)),),
                //     ),
                //   ),
                // )
              ],
            ),
            30.sh,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Selected Peoples',  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight.w600,
                        color: kwhiteColor)),),
                10.sh,
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: selectedUsers.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var u = selectedUsers[index];
                        return Padding(
                          padding: EdgeInsets.only(right: index == (selectedUsers.length - 1) ? 0 : 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    margin: EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade300),
                                    child: Center(
                                      child: Icon(
                                        Icons.person,
                                        size: 30,
                                        color: kblackColor,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${u['name']}',
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight:
                                            FontWeight.w500,
                                            color: kwhiteColor)),
                                  )
                                ],
                              ),
                        );
                      }),
                ),
              ],
            ),
            20.sh,
            searchTxt.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Peoples',  style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight:
                              FontWeight.w600,
                              color: kwhiteColor)),),
                      10.sh,
                      ListView.builder(
                          itemCount: users.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            var u = users[index];
                            return searchTxt.isNotEmpty && u['username']
                                    .toString()
                                    .toLowerCase()
                                    .contains(searchTxt.toLowerCase())
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedUsers.add(u);

                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey.shade100,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 12),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.grey.shade300),
                                            child: Center(
                                              child: Icon(
                                                Icons.person,
                                                size: 30,
                                                color: kblackColor,
                                              ),
                                            ),
                                          ),
                                          20.sw,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${u['name']}',
                                                style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: kblackColor)),
                                              ),
                                              3.sh,
                                              Text(
                                                '${u['username']}',
                                                style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: kblackColor)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : Container();
                          }),
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  showSocial(){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return StatefulBuilder(builder: (context, setState){
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text('   Share',  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight:
                          FontWeight.w500,
                          color: kblackColor))),
                  10.sh,
                  GridView.builder(
                      itemCount: socialIcons.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                            // Navigator.pop(context);
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 35,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('${socialIcons[index]['icon']}')
                                  )
                                ),
                              ),
                              5.sh,
                              Text('${socialIcons[index]['title']}', style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight:
                                      FontWeight.w400,
                                      color: kblackColor))),
                          ],
                          ),
                        );
                      },
                  ),
                  10.sh,
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: kwhiteColor, //
                                enabled: false,// kgreyColor.withOpacity(0.1),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kwhiteColor),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                hintText: 'https://www.yabai.com',
                                hintStyle: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: kblackColor))),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pop(context);
                          setState(() {
                            isCopy = true;
                          });
                        },
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.only(left: 5),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: kwhiteColor),
                          child: Center(
                            child: isCopy == false ? Icon(Icons.copy, color: kblackColor,) : Text('Copied', style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: kredColor)),),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          });
        }
    );
  }
}

const users = [
  {'name': 'Test User', 'username': '@test'},
  {'name': 'Apple Mob', 'username': '@apple'},
  {'name': 'Monkle App', 'username': '@monkle'}
];

const socialIcons = [
  {'icon': 'assets/social/facebook.png', 'title': 'Facebook'},
  {'icon': 'assets/social/gmail.png', 'title': 'Gmail'},
  {'icon': 'assets/social/instagram.png', 'title': 'Instagram'},
  {'icon': 'assets/social/whatsapp.png', 'title': 'Whatsapp'},
  {'icon': 'assets/social/twitter.png', 'title': 'Twitter'},
  {'icon': 'assets/social/discord.png', 'title': 'Discord'},
  {'icon': 'assets/social/telegram.png', 'title': 'Telegram'},
  {'icon': 'assets/social/snapchat.png', 'title': 'Snapchat'},
];
