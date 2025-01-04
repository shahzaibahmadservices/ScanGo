import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// COLORS
const Color gClr = Color(0xff0f4751);
const Color wClr = Color(0xffffffff);
//                                   THEME
var fontStyle = GoogleFonts.poppins;
// Primary
TextStyle g12 = fontStyle(color: gClr, fontSize: 12, fontWeight: FontWeight.w700);
TextStyle g16 = fontStyle(color: gClr, fontSize: 16, fontWeight: FontWeight.w700);
// Secondary
TextStyle w12 = fontStyle(color: wClr, fontSize: 12, fontWeight: FontWeight.w700);
TextStyle w16 = fontStyle(color: wClr, fontSize: 16, fontWeight: FontWeight.w700);

// IMAGES
const AssetImage logoRemoveBg = AssetImage("assets/logo_removebg.png");