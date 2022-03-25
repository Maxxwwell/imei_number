import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:imei_number/constants/colors.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:imei_number/widgets/carouselItems.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String IMEI_Number;
  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();

  void validated() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      setState(() {
        showSpinner = true;
      });

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          showSpinner = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.yellow,
        title: const Text('Capture phone details'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        progressIndicator: LoadingAnimationWidget.fourRotatingDots(
          color: AppColors.black,
          size: 32,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColors.white,
          child: Column(
            children: [
              // SizedBox(height: MediaQuery.of(context).size.height * 0.033),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.07),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          enableInteractiveSelection: false,
                          // textAlign: TextAlign.center,
                          maxLength: 15,
                          cursorColor: AppColors.black,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                          onSaved: (value) {
                            IMEI_Number = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty || value.length != 15) {
                              return 'Please enter a valid IMEI number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            suffixIcon: TextButton(
                              onPressed: () {
                                validated();
                              },
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  color: AppColors.black,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  shadowColor: AppColors.yellow),
                              // color: AppColors.white,
                            ),
                            filled: true,
                            fillColor: AppColors.white,
                            helperText: 'Enter IMEI number',
                            helperStyle: const TextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: AppColors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: AppColors.black),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: AppColors.red),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: AppColors.red),
                            ),
                          ),
                        ),
                        TextFormField(
                          enableInteractiveSelection: false,
                          // textAlign: TextAlign.center,
                          // maxLength: 15,
                          cursorColor: AppColors.black,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                          onSaved: (value) {
                            IMEI_Number = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty || value.length != 15) {
                              return 'Please enter a valid IMEI number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.white,
                            helperText: 'Enter MSISDN',
                            helperStyle: const TextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: AppColors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: AppColors.black),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: AppColors.red),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: AppColors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
