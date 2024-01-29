import 'dart:async';

import 'package:blood_donation/utility/const.dart';
import 'package:blood_donation/utility/imagepath.dart';
import 'package:blood_donation/views/bdonboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BdsplashScreen extends StatefulWidget {
  const BdsplashScreen({super.key});

  @override
  State<BdsplashScreen> createState() => _BdsplashScreenState();
}

class _BdsplashScreenState extends State<BdsplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bdprimaryclr,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                ImagePath.splash,
                color: whiteclr,
                width: 100,
                height: 150,
              ),
              Text(
                "Vital Flow",
                style: GoogleFonts.notoSansCaucasianAlbanian(
                    fontSize: 60, color: whiteclr),
              ),
              Text(
                "GIVE BLOOD GIVE LIFE",
                style: GoogleFonts.roboto(color: whiteclr, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
