import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color BaseColor = Color.fromRGBO(33, 26, 26, 1);
const Color white = Colors.white;
const Color grey717 = Color(0xff717171);

const Color backgroundCard = Color.fromRGBO(251, 251, 253, 1);
final kTextStyle = GoogleFonts.inter(
  color: BaseColor,
);
TextFormField2({
  prefixIcon,
  controller,
  keyboardType,
  hintText,
  onChange,
}) {
  return TextFormField(
    onChanged: onChange,
    keyboardType: keyboardType,
    cursorColor: BaseColor,
    controller: controller,
    style: TextStyle(
      color: BaseColor,
      fontSize: 14,
      //fontFamily: FontFamily.PoppinsRegular,
    ),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: GoogleFonts.inter(
        textStyle: TextStyle(
          fontSize: 14,
          color: grey717,
          fontWeight: FontWeight.normal,
        ),
      ),
      prefixIcon: prefixIcon,
      filled: true,
      fillColor: white,
      contentPadding: EdgeInsets.zero,
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: white, width: 0)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: white, width: 0)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: white, width: 0)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: white, width: 0)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: white, width: 0)),
    ),
  );
}
