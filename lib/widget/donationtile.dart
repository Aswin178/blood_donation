import 'package:blood_donation/utility/const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationTile extends StatelessWidget {
  const DonationTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
   padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        border: Border.all(color: greyclr),
        borderRadius: BorderRadius.circular(15),
       //color: bdprimaryclr,
      ),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius:28,
                backgroundImage: AssetImage("assets/images/profile1.jpg"),
              ),Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8,),
                  Text("Emilia Parkir",style: GoogleFonts.montserrat(
                 fontSize: 17, fontWeight: FontWeight.w600)), const SizedBox(height: 10,),
                Row(
                
                  children: [
                     const FaIcon(FontAwesomeIcons.locationDot,color: greyclr,size: 20,),
                     const SizedBox(width: 10,),
                    Text("Sarana Hospital",
            style: GoogleFonts.inter(color: greyclr, fontSize: 16),)
                  ],
                ),
                const SizedBox(height: 5,), Row(
                  children: [
                   const FaIcon(FontAwesomeIcons.solidClock,color: greyclr,size: 18,),
                   const SizedBox(width: 8,),
                    Text("10 minute ago",
            style: GoogleFonts.inter(color: greyclr, fontSize: 16),)
                  ],
                ),
          
                ],
              ),
          
              CircleAvatar(
                radius: 20,
                backgroundColor: bdprimaryclr,
                child: Text("A+",style: TextStyle(color:whiteclr),),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15,left: 8,right: 8),
            
            alignment: Alignment.center,
            height: 30,
            width: double.infinity,
            decoration: BoxDecoration(
              color: bdprimaryclr,
              borderRadius: BorderRadius.circular(5),
              
            ),
            child: Text("Donate Now",style: GoogleFonts.montserrat(color: whiteclr,fontSize: 17),),
          )
        ],
      ),
    );
  }
}
