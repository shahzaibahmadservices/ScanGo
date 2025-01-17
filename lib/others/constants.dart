import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// COLORS
const Color gClr = Color(0xff0f4751);
const Color wClr = Color(0xffffffff);

// TEXTSTYLES
var fontStyle = GoogleFonts.poppins;
// --green
TextStyle g16 =
    fontStyle(color: gClr, fontSize: 16, fontWeight: FontWeight.w700);
TextStyle g18 =
    fontStyle(color: gClr, fontSize: 18, fontWeight: FontWeight.w700);
// --white
TextStyle w18 =
    fontStyle(color: wClr, fontSize: 18, fontWeight: FontWeight.w700);

// IMAGES
const AssetImage logoRemoveBg = AssetImage("assets/logoRemoveBg.png");
