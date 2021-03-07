import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:strykepay/shared/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneratedQrCodePage extends StatefulWidget {
  @override
  _GeneratedQrCodePageState createState() => _GeneratedQrCodePageState();
}

class _GeneratedQrCodePageState extends State<GeneratedQrCodePage> {


  // @override
  // void initState() {
  //   launchURL(url: SignUpCubit.get(context).redirectLik);
  //
  //
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Android App',
          style: TextStyle(color: kSloganColor, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'An Image of me\nsend you via Mail',
              style: TextStyle(color: kSloganColor, fontSize: 22),
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            QrImage(
              data: "SignUpScreen()",
              version: QrVersions.auto,
              size: 200.0,
            ),
          ],
        ),
      ),
    );
  }


}

Future<bool> launchURL({@required String url}) async {
  if (await canLaunch(url)) {
    return await launch(url);
  } else {
    return false;
  }
}

