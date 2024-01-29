import 'package:blood_donation/utility/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryButton extends StatelessWidget {
  final String imagepath;
  final String textname;
  final void Function()? funct;


 CategoryButton({
    super.key, required this.imagepath, required this.textname,this.funct
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:funct ,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: bdprimaryclr, width: 1.8)),
        child: Column(
          children: [
            Image.asset(
             imagepath ,
              height: 60,
            ),
            const SizedBox(height: 15,),
            Text(
              textname,
              style: GoogleFonts.montserratAlternates(color: bdprimaryclr,fontSize: 14,fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
