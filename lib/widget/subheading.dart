  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget subHeading({required String headtxt}) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(headtxt,style: GoogleFonts.montserrat(fontSize: 22,fontWeight: FontWeight.bold),),
        );
  }