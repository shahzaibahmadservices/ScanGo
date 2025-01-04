import 'package:flutter/material.dart';
import 'package:scan_go/constants/constants.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:scan_go/widgets/navigation_widget.dart';
import 'package:scan_go/views/scan_qr.dart';
import 'package:scan_go/views/generate_qr.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    splashInitialization();
  }

  void splashInitialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScanQR',
      debugShowCheckedModeBanner: false,
      home: const MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wClr,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              children: [
                Image(image: logoRemoveBg, width: 130),
                Text("ScanGo", style: g16),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            navigationWidget(context, ScanQR());
                          },
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: gClr,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text("Scan QR", style: w16),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            navigationWidget(context, GenerateQR());
                          },
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: gClr,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text("Generate QR", style: w16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
