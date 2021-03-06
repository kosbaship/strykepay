import 'package:flutter/material.dart';
import 'package:strykepay/signup/signup_screen.dart';
import 'package:strykepay/shared/theme.dart';

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
      title: 'Flutter Demo',
      theme: theme(),
      home: SignUpScreen(),
    );
  }
}

