import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khetiapp/view/HomePages/view_product_screen.dart';

class AllProductScreen extends StatefulWidget {
  final dynamic allProductList;
  final dynamic productData;
  const AllProductScreen({super.key, this.allProductList, this.productData});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  late List<int>
      _currentIndexes; // Declare a list to store current indexes for each grid item

  @override
  void initState() {
    super.initState();
    // Initialize the list with zeros, one for each grid item
    _currentIndexes = List<int>.filled(widget.allProductList.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.productData,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: .8,
              ),
              itemCount: widget.allProductList.length,
              itemBuilder: (context, gridIndex) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          widget.allProductList[gridIndex]['name'],
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: Text(
                              widget.allProductList[gridIndex]['ltr'],
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.3),
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(7)),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.access_time_sharp,
                                  size: 12,
                                ),
                                Text(
                                  "8 mins",
                                  style: GoogleFonts.poppins(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 6),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 84,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 70,
                              child: PageView.builder(
                                itemCount:
                                    2, // Assuming 'img' contains a list of image URLs
                                onPageChanged: (index) {
                                  setState(() {
                                    _currentIndexes[gridIndex] =
                                        index; // Update the current index for this grid item
                                  });
                                },
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          isDismissible: true,
                                          enableDrag: true,
                                          barrierColor: Colors.black26,
                                          builder: (builder) {
                                            return Container(
                                                height: height * 0.8,
                                                color: Colors
                                                    .transparent, //could change this to Color(0xFF737373),
                                                //so you don't have to change MaterialApp canvasColor
                                                child: ViewProductScreen(
                                                  productData:
                                                      widget.productData,
                                                  allProductList:
                                                      widget.allProductList[
                                                          gridIndex],
                                                ));
                                          });
                                    },
                                    child: Image.asset(
                                      widget.allProductList[gridIndex]['img'],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              top: 75,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(2, (dotIndex) {
                                  return Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          _currentIndexes[gridIndex] == dotIndex
                                              ? Colors.black
                                              : Colors.grey,
                                    ),
                                  );
                                }),
                              ),
                            )
                          ],
                        ),
                      ),
                      // const SizedBox(height: 10),
                      Center(
                        child: Text(
                          "${widget.allProductList[gridIndex]['price']}",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Add",
                            style: GoogleFonts.poppins(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
