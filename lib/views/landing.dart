import 'package:blood_donation/utility/const.dart';
import 'package:blood_donation/utility/imagepath.dart';
import 'package:blood_donation/views/bdlogin.dart';
import 'package:blood_donation/views/bdregis.dart';
import 'package:blood_donation/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
          ImagePath.landingpageimg,
          ),
          const SizedBox(
            height: 50,
          ),
          custombutton(bttntxt: "Log in",function: () {
            Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BdLogin()));
            
          },),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BdRegi()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: bdprimaryclr),
                  color: whiteclr,
                  borderRadius: BorderRadius.circular(19)),
              child: Text(
                "Register",
                style: GoogleFonts.montserrat(
                    color: bdprimaryclr,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        const  SizedBox(height: 35,),
          const Row(
            
            children: [
              Expanded(child: Divider(thickness: 1.6,indent: 70,endIndent: 15,)),
              Text("Or",style: TextStyle(color: Colors.black45),),
              Expanded(child: Divider(endIndent: 70,indent: 15,thickness: 1.5,))
            ],
          ),
           const  SizedBox(height: 35,),
           Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: bdprimaryclr),
                  color: whiteclr,
                  borderRadius: BorderRadius.circular(19)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/google.png",height: 30,),
                  const SizedBox(width: 10,),
                  Text(
                    "Continue with Google",
                    style: GoogleFonts.montserrat(
                        color: bdprimaryclr,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}


