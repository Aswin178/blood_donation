import 'package:blood_donation/utility/const.dart';
import 'package:flutter/material.dart';

class txtfield extends StatelessWidget {
  final IconData icondata;
  final TextEditingController cntrl;
  final String hinttext;
  final bool obscure;
  String? Function(String?)? validator;



  txtfield(
      {super.key,
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
        validator:validator,
        obscureText: obscure,
        controller: cntrl,
        decoration: InputDecoration(
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
