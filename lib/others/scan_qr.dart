import 'package:flutter/material.dart';
import 'package:scan_go/others/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'dart:typed_data';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wClr,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Scan QR", style: g16),
        centerTitle: true,
        backgroundColor: wClr,
      ),
      body: MobileScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
          returnImage: true,
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;
          if (image != null) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: Material(
                    type: MaterialType.transparency,
                    child: AlertDialog(
                      title: GestureDetector(
                        onTap: () async {
                          final url = barcodes.first.rawValue;
                          final Uri uri = Uri.parse(url!);
                          Future<void> onLauchUrl() async {
                            if (!await launchUrl(uri)) {
                              throw Exception();
                            }
                          }

                          onLauchUrl();
                        },
                        child: Text(
                          barcodes.first.rawValue ?? '',
                          style: TextStyle(
                            color: gClr,
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image(image: MemoryImage(image)),
                          SizedBox(
                            height: 4,
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: gClr),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
