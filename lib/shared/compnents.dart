
// app db configuration
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:strykepay/shared/colors.dart';
import 'package:strykepay/network/api_provider.dart';

import 'constants.dart';

void initApp() {
  APIProvider();

}

// toast message
void showToast({@required String message, @required bool error}) => Fluttertoast.showToast(
    msg: " $message ",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: error ? Colors.red : Colors.green,
    textColor: Colors.white,
    fontSize: 16.0);

// navigation
void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
void navigateToReplaceMe(context, widget) => Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) => false);

// alert dialog
void showAlertDialog({context, text, error = false}) => showDialog(context: context, builder: (context) => AlertDialog(
  content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        children: [
          if (!error) CircularProgressIndicator(),
          if (!error)
            SizedBox(
              width: 20.0,
            ),
          Expanded(
            child: Text(
              text,
            ),
          ),
        ],
      ),
      if (error) SizedBox(height: 20.0),
      if (error)
        buildDefaultButton(
          onPressed: () => Navigator.pop(context),
          text: "Cancel",
        ),
    ],
  ),
),);

// custom logo
Widget showLogo({@required screenHeight}) => Container(
      height: screenHeight * .2,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/icons/buyicon.png'),
          ),
          Positioned(
            bottom: 0,
            child: Text(
              'Cloths Shop',
              style: TextStyle(
                  fontFamily: 'Pacifico', fontSize: 25, color: kSloganColor),
            ),
          ),
          SizedBox(
            width: double.infinity,
          ),
        ],
      ),
    );

// custom appbar
Widget drawAppbar({@required context, @required actionWidget, @required leadingWidget, @required title}) => AppBar(
      iconTheme: IconThemeData(
        color: kWhiteColor, //change your color here
      ),
      centerTitle: true,
      backgroundColor: kMainColor,
      title: title,
      leading: leadingWidget,
      actions: [
        actionWidget,
        SizedBox(
          width: 20.0,
        ),
      ],
      elevation: 0.0,
    );

// custom text field
Widget buildTextField({@required TextEditingController controller, @required icon, @required hint, @required TextInputType type, bool isPassword = false, Color color = kSecondaryColor,}) => TextField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      cursorColor: kSecondaryColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: kGreyColor,
        ),
        prefixIcon: Icon(
          icon,
          color: kSecondaryColor,
        ),
        filled: true,
        fillColor: kMainColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: color)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: color)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: color)),
      ),

);

// custom text
Widget writeQuickText({@required String text, double fontSize = 16.0, Color color = kTextDarkColor, FontWeight fontWeight = FontWeight.normal, TextAlign textAlign = TextAlign.center}) => Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        fontFamily: "MontserratRegular",
      ),
    );

// custom text form Field
Widget buildTextFormField({@required String title, @required TextEditingController controller, @required IconData icon, TextInputType keyboardType = TextInputType.text, bool obscureText = false, Function onChange}) => TextFormField(
  keyboardType: keyboardType,
  obscureText: obscureText,
  controller: controller,
  onChanged: onChange,
  validator: (value) {
    if (value.isEmpty) {
      return 'Please enter some text';
    } else if (title == kTextFormFirstName && value.length < 2 || title == kTextFormLastName && value.length < 2 ){
      return 'enter at least 2 Characters';
    }else if (title == kTextFormEmail && !value.contains('@')){
      return 'Please enter valid Email';
    } else if (title == kTextFormEmail && !value.contains('.')){
      return 'Please enter valid Email';
    } else if (title == kTextFormPassword && value.length < 6){
      return 'enter at least 6 Characters';
    }
    return null;
  },
  decoration: InputDecoration(
    hintText: "Enter your $title",
    floatingLabelBehavior: FloatingLabelBehavior.always,
    suffixIcon: Icon(icon),
    labelText: title,
    labelStyle: TextStyle(
      fontSize: 16.0,
    ),
    hintStyle: TextStyle(color: kGreyColor, fontSize: 10),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: kSloganColor, width: 2),
      gapPadding: 10,
    ),
  ),
  style: TextStyle(fontSize: 14.0, color: kSecondaryColor),
);

// custom button not used
Widget buildBtn({@required Function onPressed, @required String title}) => FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: onPressed,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 9),
        child: Text(
          title,
          style: TextStyle(color: kWhiteColor, fontSize: 14),
        ),
      ),
    );

// custom button 
Widget buildButton({title, onPressed,}) => FlatButton(
      onPressed: onPressed,
      color: kSloganColor,
      textColor: Colors.white,
      child: Container(
        height: 50.0,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'BoltSemiBold',
            ),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );

// custom default button
Widget buildDefaultButton({@required Function onPressed, @required String text, Color textColor = kMainColor, Color backgroundColor = kSecondaryColor, Color borderColor = kMainColor}) => Container(
      width: double.infinity,
      height: 58.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: backgroundColor,
          border: Border.all(
            width: 3,
            color: borderColor,
          )),
      child: FlatButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textColor: textColor,
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            fontFamily: "MontserratRegular",
          ),
        ),
      ),
    );

// custom expanded card

