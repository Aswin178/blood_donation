import 'package:blood_donation/utility/const.dart';
import 'package:blood_donation/views/reqblood.dart';
import 'package:blood_donation/widget/button.dart';
import 'package:blood_donation/widget/categorybutton.dart';
import 'package:blood_donation/widget/donationtile.dart';
import 'package:blood_donation/widget/subheading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BdHome extends StatelessWidget {
  const BdHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5, top: 10),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/icons/noti.png",
                height: 27,
                color: bdprimaryclr,
              ),
            ),
          )
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 7, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: GoogleFonts.inter(fontSize: 16),
              ),
              Text(
                "Zinedine Zidane",
                style: GoogleFonts.montserrat(
                    fontSize: 20, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/images/banner1.jpg"),
              ),
            ),
            subHeading(headtxt: "What Would You Do? "),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryButton(
                      textname: "Donate Blood",
                      imagepath: "assets/icons/donor.png"),
                  const Spacer(),
                  CategoryButton(
                    funct: () {
                      Get.to(() => RqstBldScreen(),transition:Transition.rightToLeftWithFade,duration: Duration(milliseconds: 500) );
                            
                    },
                    textname: "Request Blood",
                    imagepath: "assets/icons/blood-drop.png",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                subHeading(headtxt: "Help Us"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "View More",
                    style: TextStyle(
                        color: blueclr,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            DonationTile(),
            SizedBox(
              height: 15,
            ),
            DonationTile()
          ],
        ),
      ),
    );
  }
}
