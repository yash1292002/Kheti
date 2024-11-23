import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khetiapp/const/app_images.dart';

class PaymentSettingsScreen extends StatelessWidget {
  const PaymentSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(
          'Payment Setting',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(title: 'Cards'),
                  PaymentOptionRow(
                    icon: Icons.credit_card,
                    title: 'Add credit or debit',
                    actionText: 'ADD',
                  ),
                  PaymentOptionRow(
                    icon: Icons.card_membership,
                    title: 'Add Card',
                    actionText: 'ADD',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(title: 'Pay by any UPI app'),
                  PaymentOptionRow(
                    image: AppImage.gpay,
                    title: 'Google Pay UPI',
                  ),
                  Divider(),
                  PaymentOptionRow(
                    image: AppImage.phonepe,
                    title: 'PhonePe UPI',
                  ),
                  Divider(),
                  PaymentOptionRow(
                    image: AppImage.paytm,
                    title: 'Paytm UPI',
                  ),
                  Divider(),
                  PaymentOptionRow(
                    image: AppImage.upi,
                    title: 'Add new UPI ID',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SectionHeader(title: 'Wallets'),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]),
              child: const PaymentOptionRow(
                image: AppImage.amazon_pay,
                title: 'Amazon Pay Balance',
                actionText: 'LINK',
                isNew: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}

class PaymentOptionRow extends StatelessWidget {
  final IconData? icon;
  final String? image;
  final String title;
  final String? actionText;
  final bool isNew;

  const PaymentOptionRow({
    Key? key,
    this.icon,
    this.image,
    required this.title,
    this.actionText,
    this.isNew = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (icon != null)
                Icon(icon, size: 30, color: Colors.black)
              else if (image != null)
                Container(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: title == "Amazon Pay Balance"
                          ? Colors.black
                          : Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.asset(image!, width: 40, height: 40)),
              const SizedBox(width: 12),
              Text(
                title,
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
              ),
              if (isNew)
                Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'NEW',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          if (actionText != null)
            Text(
              actionText!,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}
