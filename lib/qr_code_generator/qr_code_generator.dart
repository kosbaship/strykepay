import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:strykepay/shared/colors.dart';

class QrCodeGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Use your IPhone',
          style: TextStyle(color: kSloganColor, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Scan Me',
              style: TextStyle(color: kSloganColor, fontSize: 32),
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            QrImage(
              data: "https://apps.apple.com/us/app/facebook/id284882215",
              version: QrVersions.auto,
              size: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
