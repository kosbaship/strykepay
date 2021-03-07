import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strykepay/models/user.dart';
import 'package:strykepay/shared/colors.dart';
import 'package:strykepay/shared/compnents.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/constants.dart';
import 'cubit/signup_cubit.dart';
import 'cubit/signup_states.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double signUpScreenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpLoadingState) {
            showAlertDialog(
              context: context,
              text: 'please wait ...',
            );
          }

          if (state is SignUpSuccessState) {
            // close the progress dialog in the last state
            Navigator.pop(context);

            launchURL(url: SignUpCubit.get(context).redirectLik);
            // navigateTo(context, QrCodeGenerator());
            print('===================${SignUpCubit.get(context).redirectLik}');
          }

          if (state is SignUpErrorState) {
            // close the progress dialog in the last state
            Navigator.pop(context);
            showAlertDialog(
              context: context,
              text: "Try Again",
              error: true,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: kMainColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildTextFormField(
                          title: kTextFormFirstName,
                          controller: firstNameController,
                          icon: Icons.person,
                        ),
                        SizedBox(
                          height: signUpScreenHeight * 0.04,
                        ),
                        buildTextFormField(
                          title: kTextFormLastName,
                          controller: lastNameController,
                          icon: Icons.person,
                        ),
                        SizedBox(
                          height: signUpScreenHeight * 0.03,
                        ),
                        buildTextFormField(
                            title: kTextFormEmail,
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            icon: Icons.email),
                        SizedBox(
                          height: signUpScreenHeight * 0.03,
                        ),
                        buildTextFormField(
                          title: kTextFormPhone,
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          icon: Icons.phone_android,
                        ),
                        SizedBox(
                          height: signUpScreenHeight * 0.03,
                        ),
                        buildTextFormField(
                            title: kTextFormPassword,
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            icon: Icons.lock,
                            obscureText: true),
                        SizedBox(
                          height: signUpScreenHeight * 0.03,
                        ),
                        buildTextFormField(
                          title: kTextFormDob,
                          controller: dobController,
                          icon: Icons.double_arrow,
                        ),
                        SizedBox(
                          height: signUpScreenHeight * 0.03,
                        ),
                        buildTextFormField(
                          title: kTextFormAddress,
                          controller: addressController,
                          icon: Icons.location_on,
                        ),
                        SizedBox(
                          height: signUpScreenHeight * 0.05,
                        ),
                        buildButton(
                          onPressed: () {
                            String firstName = firstNameController.text.trim();
                            String lastName = firstNameController.text.trim();
                            String email = emailController.text.trim();
                            String phone = phoneController.text.trim();
                            String password = passwordController.text.trim();
                            String dob = dobController.text.trim();
                            String address = addressController.text.trim();

                            if (_formKey.currentState.validate()) {
                              _checkValidationAndSignUP(
                                  context: context,
                                  firstName: firstName,
                                  lastName: lastName,
                                  email: email,
                                  phone: phone,
                                  password: password,
                                  address: address,
                                  dob: dob);
                            }
                          },
                          title: kSignUp,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void _checkValidationAndSignUP({
  @required BuildContext context,
  @required String firstName,
  @required String lastName,
  @required String email,
  @required String phone,
  @required String password,
  @required String dob,
  @required String address,
}) {
  SignUpCubit.get(context).signUp(
    user: User(
      userFirstName: firstName,
      userLastName: lastName,
      userEmail: email,
      userPhone: phone,
      userPassword: password,
      userDob: dob,
      userAddress: address,
    ),
  );
}
Future<bool> launchURL({@required String url}) async {
  if (await canLaunch(url)) {
    return await launch(url);
  } else {
    return false;
  }
}