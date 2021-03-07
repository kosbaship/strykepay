import 'package:flutter/material.dart';
import 'package:strykepay/scan_qr/scan_qr.dart';
import 'package:strykepay/shared/colors.dart';
import 'package:strykepay/shared/theme.dart';

import 'generated_qr/generated_qr.dart';
import 'shared/compnents.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initApp();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StrykePay',
      theme: theme(),
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: () {
                  navigateTo(context, ScanQrCodePage());
                },
                fillColor: kButtonBGColor,
                splashColor: kButtonSplashColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Scan Our QR',
                        style: TextStyle(color: kButtonTextColor, fontSize: 20),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Icon(
                          Icons.qr_code_scanner,
                          color: kButtonIconColor,
                        ),
                      ),
                    ],
                  ),
                ),
                shape: const StadiumBorder(),
              ),
              SizedBox(
                height: 20.0,
              ),
              RawMaterialButton(
                onPressed: () {
                  navigateTo(context, GeneratedQrCodePage());
                },
                fillColor: kButtonBGColor,
                splashColor: kButtonSplashColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Our Generated\nQR Code',
                        style: TextStyle(color: kButtonTextColor, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Icon(
                          Icons.qr_code,
                          color: kButtonIconColor,
                        ),
                      ),
                    ],
                  ),
                ),
                shape: const StadiumBorder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

