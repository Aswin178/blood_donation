import 'package:blood_donation/utility/const.dart';
import 'package:blood_donation/utility/imagepath.dart';
import 'package:blood_donation/views/bdhome.dart';
import 'package:blood_donation/views/bdregis.dart';
import 'package:blood_donation/widget/button.dart';
import 'package:blood_donation/widget/txtfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BdLogin extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final email_cntrl = TextEditingController();
  final pass_cntrl = TextEditingController();
  BdLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
               ImagePath.loginimg,
                width: 200,
                height: 400,
              ),
              txtfield(
                  icondata: Icons.mail, cntrl: email_cntrl, hinttext: "Email",
                 validator: (value) {
                  if (value!.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                    return "Enter a valid email";
                  } else {
                    return null;
                  }
                },),
              txtfield(
                icondata: Icons.lock,
                cntrl: pass_cntrl,
                hinttext: "Password",
                obscure: true,
                 validator: (value) {
                  if (value!.isEmpty || value.length<6) {
                    return "Password must be longer than 6 characters.";
                  } else {
                    return null;
                  }
                },
              

              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Checkbox(value: true, onChanged: ((value) {})),
                    Text(
                      "Keep me logged in",
                      style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 15),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              custombutton(
                bttntxt: "Log in",
                function: () {
                  var valid = formkey.currentState!.validate();
                  if (valid) {

                     Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BdHome()));
                    
                  }
                },
              ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BdRegi()));
                },
                child: RichText(
                    text: TextSpan(
                        text: "Dont have an account? ",
                        style: GoogleFonts.montserrat(
                            color: Colors.black, fontSize: 15),
                        children: [
                      TextSpan(
                          text: "Sign Up",
                          style: GoogleFonts.montserrat(
                              color: bdprimaryclr, fontWeight: FontWeight.bold))
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
