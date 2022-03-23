import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:imei_number/constants/colors.dart';

class Verify extends StatelessWidget {
  final String phoneNumber;

// ignore: use_key_in_widget_constructors
  const Verify(this.phoneNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(
          'Verify Phone number',
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.yellow,
        iconTheme: const IconThemeData(
          color: AppColors.black,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              'Code is sent to $phoneNumber',
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            OtpTextField(
              numberOfFields: 4,
              fieldWidth: 55,
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              enabledBorderColor: AppColors.grey,
              cursorColor: AppColors.black,
              focusedBorderColor: AppColors.yellow,
              borderRadius: BorderRadius.circular(10),
              borderColor: AppColors.yellow,
              filled: true,

              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            const Text("Didn't receive code?"),
            const SizedBox(height: 5),
            InkWell(
              enableFeedback: true,
              splashColor: Colors.transparent,
              onTap: () {},
              child: const Text(
                "Resend",
                style: TextStyle(
                  fontSize: 17,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
