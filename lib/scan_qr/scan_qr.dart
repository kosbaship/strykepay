
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:strykepay/shared/colors.dart';
import 'package:strykepay/shared/compnents.dart';
import 'package:strykepay/signup/signup_screen.dart';

class ScanQrCodePage extends StatefulWidget {
  @override
  _ScanQrCodePageState createState() => _ScanQrCodePageState();
}

class _ScanQrCodePageState extends State<ScanQrCodePage> {
  String _data = 'Barcode Data appears here';
  // String _data = '';

  // داله الاسكان دي هيا اللي هيبق فيها كود الكيو ار كود
  _scan() async{
    // 1 -هات الكيو ار كود
    // قبل ما عتنفذ اتنين استدعي ست استيت علشان تعمل ري بلد وتظهر التغيرات
    // 2- قيمته حطها في المتغير اللي اسمه داتا
    await FlutterBarcodeScanner
        .scanBarcode('#000000', 'Cancel', true, ScanMode.BARCODE)
        .then((value) => setState(() =>_data = value));

    if( _data == 'SignUpScreen()') {
      navigateTo(context, SignUpScreen());
    } else {
      showToast(message: 'Scan from our app ', error: false);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'IOS App',
          style: TextStyle(color: kSloganColor, fontSize: 18),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Open your Mail\nTo find A screenshot\nof Generated QR Code',
            style: TextStyle(color: kSloganColor, fontSize: 22),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: double.infinity,
            height: 20,
          ),
          RawMaterialButton(
            onPressed: () {
_scan();            },
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

        ],
      ),
    );
  }
}