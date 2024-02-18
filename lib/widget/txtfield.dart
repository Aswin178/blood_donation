import 'package:blood_donation/controller/auth_controller.dart';
import 'package:blood_donation/utility/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class txtfield extends StatelessWidget {

  final IconData icondata;
  final TextEditingController cntrl;
  final String hinttext;
  final bool obscure;
  IconButton? btn;

  String? Function(String?)? validator;

  txtfield(

      {super.key,
      this.btn,
      required this.icondata,
      required this.cntrl,
      required this.hinttext,
      this.obscure = false,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: TextFormField(
        validator: validator,
        obscureText: obscure,
        controller: cntrl,
        decoration: InputDecoration(
            suffixIcon: btn,
            hintText: hinttext,
            prefixIcon: Icon(icondata, color: txtfieldclr),
            contentPadding: EdgeInsets.all(18),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: bdprimaryclr))),
      ),
    );
  }
}
