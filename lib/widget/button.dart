import 'package:blood_donation/utility/const.dart';
import 'package:blood_donation/views/bdlogin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class custombutton extends StatelessWidget {
  final String bttntxt;
  final void Function()? function;
  

  custombutton({
    super.key,
    required this.bttntxt,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: bdprimaryclr, borderRadius: BorderRadius.circular(19)),
        child: Text(
          bttntxt,
          style: GoogleFonts.montserrat(
              color: whiteclr, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
