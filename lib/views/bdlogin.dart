import 'package:blood_donation/controller/auth_controller.dart';
import 'package:blood_donation/utility/const.dart';
import 'package:blood_donation/utility/imagepath.dart';
import 'package:blood_donation/views/bd_regis.dart';
import 'package:blood_donation/views/bdhome.dart';
import 'package:blood_donation/widget/button.dart';
import 'package:blood_donation/widget/txtfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BdLogin extends StatelessWidget {
  final authcontroller = Get.put(AuthController());
  final formkey = GlobalKey<FormState>();

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
                icondata: Icons.mail,
                cntrl: authcontroller.loginemail_cntrl,
                hinttext: "Email",
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return "Enter a valid email";
                  } else {
                    return null;
                  }
                },
              ),
              Obx(
                () => txtfield(
                  btn: IconButton(
                      onPressed: () {
                        authcontroller.hideText();
                      },
                      icon: Icon(
                        authcontroller.obscure.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: txtfieldclr,
                      )),
                  icondata: Icons.lock,
                  cntrl: authcontroller.loginpass_cntrl,
                  hinttext: "Password",
                  obscure: authcontroller.obscure.value,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return "Password must be longer than 6 characters.";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: authcontroller.checBoxvalue.value,
                          onChanged: ((value) {
                            authcontroller.checkboxChange();
                          })),
                    ),
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
                  
                    authcontroller.signIN();
                    
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
