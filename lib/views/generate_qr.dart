import 'package:flutter/material.dart';
import 'package:scan_go/constants/constants.dart';

class GenerateQR extends StatelessWidget {
  const GenerateQR({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wClr,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Generate QR", style: g16,),
        centerTitle: true,
        backgroundColor: wClr,
      ),
    );
  }
}
