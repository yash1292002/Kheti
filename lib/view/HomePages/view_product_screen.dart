import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khetiapp/const/app_color.dart';
import 'package:khetiapp/const/app_images.dart';
import 'package:khetiapp/view/HomePages/payment/payment_screen.dart';

class ViewProductScreen extends StatefulWidget {
  final dynamic productData;
  final dynamic allProductList;
  const ViewProductScreen(
      {super.key, required this.productData, required this.allProductList});

  @override
  State<ViewProductScreen> createState() => _ViewProductScreenState();
}

class _ViewProductScreenState extends State<ViewProductScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      // margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                // PageView with dynamic images
                SizedBox(
                  height: 330, // Adjust height as needed

                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    onPageChanged: (int index) {
                      setState(() {
                        _currentPage = index; // Update the current page index
                      });
                    },
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            widget.allProductList['img'],
                          ),
                          Container(
                            width: width * .15,
                            margin: const EdgeInsets.only(top: 30),
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.3),
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.access_time_sharp,
                                  size: 12,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "8 mins",
                                  style: GoogleFonts.poppins(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                // Dot indicator
                // const SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  ...List.generate(3, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: _currentPage == index
                          ? 12
                          : 8, // Active dot is slightly larger
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.black
                            : Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                  SizedBox(
                    width: width * .35,
                  ),
                  const Icon(
                    Icons.mobile_screen_share,
                    size: 30,
                    color: AppColor.blackColor,
                  ),
                  SizedBox(
                    width: width * .04,
                  ),
                ]),

                // Time indicator container
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(widget.allProductList['name'],
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                const Divider(),
                exploreProduct(context),
                const Divider(),
              ],
            ),
          ),
          addToCartWidget(widget.allProductList),
        ],
      ),
    );
  }
}

Widget addToCartWidget(dynamic allProductList) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 16.0, bottom: 26.0),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          // border: Border.all(color: Colors.grey.shade300),
        ),
        // width: 342,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '1 unit',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '${allProductList['price']}',
                      style: GoogleFonts.poppins(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'MRP ₹200',
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        '77 % OFF',
                        style: GoogleFonts.poppins(
                          fontSize: 12.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '(Include of all taxes)',
                  style: GoogleFonts.poppins(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Add to cart action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
              ),
              child: const Text(
                'Add to cart',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget exploreProduct(context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const PaymentSettingsScreen()));
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Logo
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  'boAt',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Text content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'boAt',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Explore all product',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
        // Arrow Icon
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
          size: 20,
        ),
      ],
    ),
  );
}
