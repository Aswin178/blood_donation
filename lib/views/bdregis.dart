import 'package:blood_donation/utility/const.dart';
import 'package:blood_donation/utility/imagepath.dart';
import 'package:blood_donation/views/bdlogin.dart';
import 'package:blood_donation/widget/button.dart';
import 'package:blood_donation/widget/txtfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BdRegi extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final name_cntrl = TextEditingController();
  final email_cntrl = TextEditingController();
  final pass_cntrl = TextEditingController();
  BdRegi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
        key: formkey,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SvgPicture.asset(
              ImagePath.regimg,
              width: 200,
              height: 280,
            ),
            txtfield(
              icondata: Icons.person,
              cntrl: name_cntrl,
              hinttext: "Name",
              validator: (value) {
                if (value!.isEmpty) {
                  return "User name can't be empty";
                }
              },
            ),
            txtfield(
                icondata: Icons.mail,
                cntrl: email_cntrl,
                hinttext: "Email",
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return "Enter a valid email";
                  } else {
                    return null;
                  }
                }),
            txtfield(
                icondata: Icons.lock,
                cntrl: pass_cntrl,
                hinttext: "Password",
                obscure: true,
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return "Password must be longer than 6 characters.";
                  } else {
                    return null;
                  }
                }),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  RichText(
                      text: TextSpan(
                          text: "By creating an account you agree to the\n ",
                          style: GoogleFonts.montserrat(color: blkclr),
                          children: [
                        TextSpan(
                            text: "Terms of Use ",
                            style: GoogleFonts.montserrat(
                                color: bdprimaryclr,
                                fontWeight: FontWeight.bold)),
                        TextSpan(text: "and our "),
                        TextSpan(
                            text: "Privacy policy",
                            style: GoogleFonts.montserrat(
                                color: bdprimaryclr,
                                fontWeight: FontWeight.bold)),
                      ]))
                ],
              ),
            ),
            custombutton(
                bttntxt: "Register",
                function: () {
                  var valid = formkey.currentState!.validate();
                  if(valid){

                  }
                }),
            const SizedBox(
              height: 14,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BdLogin()));
              },
              child: RichText(
                  text: TextSpan(
                      text: "Already have an account? ",
                      style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 15),
                      children: [
                    TextSpan(
                        text: "Log in.",
                        style: GoogleFonts.montserrat(
                            color: bdprimaryclr, fontWeight: FontWeight.bold))
                  ])),
            )
          ],
        ),
      )),
    );
  }
}
