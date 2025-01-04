import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scan_go/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimatedDialog extends StatelessWidget {
  final List<Barcode> barcodes;
  final Uint8List image;

  const AnimatedDialog(
      {super.key, required this.barcodes, required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: AlertDialog(
          title: GestureDetector(
            onTap: () async {
              final url = barcodes.first.rawValue;
              if (url != null && await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url));
              }
            },
            child: Text(
              barcodes.first.rawValue ?? '',
              style: TextStyle(
                color: gClr,
                decoration: TextDecoration.underline,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(image: MemoryImage(image)),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
