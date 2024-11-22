import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khetiapp/const/app_color.dart';
import 'package:khetiapp/const/app_const.dart';
import 'package:khetiapp/const/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: height * 0.55,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColor.primaryColor, // Light yellow
                      AppColor.darkPrimaryColor.withOpacity(0.8)
                      // const Color.fromARGB(
                      //     255, 189, 161, 5), // Slightly darker yellow
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.05,
                left: 16,
                right: 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Delivery in',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("8 minute",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                              Row(
                                children: [
                                  Text("HOME - Sushrut G,Star Homes",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      )),
                                  Icon(Icons.arrow_drop_down, size: 25)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Icon(Icons.person_outline,
                              color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(height: height * 0.02),
//================================================= serch bar ====================================
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(
                              Icons.search,
                              color: AppColor.blackColor,
                              size: 35,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                  color: AppColor.blackColor, fontSize: 20),
                              decoration: InputDecoration(
                                hintText: 'Search "Chocolate"',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: AppColor.blackColor,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Icon(
                              Icons.mic,
                              color: AppColor.blackColor,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
//================================================= welcome text ====================================

                    Center(
                      child: Text(
                        'welcome',
                        style: GoogleFonts.pacifico(
                          fontSize: 50,
                          color: Colors.brown,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("order nor to avail exciting offers",
                          style: GoogleFonts.poppins(
                              fontSize: 19,
                              color: Colors.brown,
                              fontWeight: FontWeight.w600)),
                    ),
//================================================= offer banner ====================================
                    Container(
                      margin: EdgeInsets.only(
                          top: height * 0.015,
                          left: height * 0.02,
                          right: height * 0.02),
                      child: Image.asset(AppImage.offerBannerImage),
                    )
                  ],
                ),
              ),
            ],
          ),
          // SizedBox(height: height * 0.02),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("Categories",
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColor.blackColor,
                )),
          ),
          categoryListWidget(),
        ],
      ),
    );
  }

int selectedIndex = -1;
Widget categoryListWidget() {
  
  return Expanded(
    child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          bool isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              selectedIndex = index; // Update the selected index
              setState(() {
                
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColor.yellowColor : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.1), // Shadow color with opacity
                            blurRadius: 10, // Softens the shadow
                            spreadRadius: 2, // Extends the shadow
                            offset: const Offset(
                                0, 4), // Changes position of shadow (x, y)
                          ),
                        ],
                      ),
                      child: Image.asset(categoryList[index]['image'],
                          height: 70, width: 70),
                    ),
                    const SizedBox(height: 5),
                    Text(categoryList[index]['name'],
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isSelected ?  AppColor.yellowColor : Colors.grey,
                        )),
                  ]),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 0,
          );
        },
        itemCount: categoryList.length),
  );
}
}