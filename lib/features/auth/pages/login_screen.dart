import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/helper/show_alert_dialog.dart';
import 'package:whatsapp_clone/common/routes/routes.dart';
import 'package:whatsapp_clone/common/utils/colors.dart';
import 'package:whatsapp_clone/common/widgets/custom_elevate_button.dart';
import 'package:whatsapp_clone/common/widgets/custom_icon_buttom.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/features/auth/widgets/custom_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  void navigateToVerificationScreen(context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.verification,
      (route) => false,
      arguments: {
        'phoneNumber': phoneNumberController.text,
        'smsCodeId': '01',
      },
    );
  }

  void sendCodeToPhone() {
    final phoneNumber = phoneNumberController.text;
    final countryName = countryNameController.text;
    final CountryCode = countryCodeController.text;

    if (phoneNumber.isEmpty) {
      print('sendCodeToPhone isEmpty : ${phoneNumber.isEmpty}');
      showAlertDialog(
        context: context,
        message: "The phone number is required !",
      );
    } else if (phoneNumber.length < 9) {
      print('sendCodeToPhone isTooShort : ${phoneNumber.length < 9}');
      showAlertDialog(
        context: context,
        message:
            "The phone number you entered is too short for the country: $countryName.\n\n Include your area if yoe haven't",
      );
    } else if (phoneNumber.length >= 10) {
      print('sendCodeToPhone isTooLong : ${phoneNumber.length >= 10}');
      showAlertDialog(
        context: context,
        message:
            "The phone number you entered is too long for the country: $countryName.",
      );
    } else {
      // request a verification code
      ref.read(authControllerProvider).sendVerificationCode(
            context: context,
            phoneNumber: '+$CountryCode$phoneNumber',
          );
    }
  }

  void showCountryCodePicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ['CM', 'US', 'FR'],
      countryListTheme: CountryListThemeData(
          bottomSheetHeight: 600,
          backgroundColor: Theme.of(context).colorScheme.background,
          flagSize: 25,
          borderRadius: BorderRadius.circular(25),
          textStyle: TextStyle(color: context.theme.greyColor),
          inputDecoration: InputDecoration(
            labelStyle: TextStyle(color: context.theme.greyColor),
            prefixIcon: const Icon(
              Icons.language,
              color: Coloors.greenDark,
            ),
            hintText: 'Search country code or name',
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Coloors.greenDark,
              ),
            ),
          )),
      onSelect: (country) {
        countryNameController.text = country.name;
        countryCodeController.text = country.phoneCode;
      },
    );
  }

  @override
  void initState() {
    countryNameController = TextEditingController(text: " Cameroon ");
    countryCodeController = TextEditingController(text: " 237 ");
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countryNameController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 2,
        title: Text(
          'Enter You Phone Number',
          style: TextStyle(
            color: context.theme.authAppbarTextColor,
          ),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onTap: () => {},
            icon: Icons.more_vert_rounded,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 35,
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Whatsapp Lerob will need to verify your phone number! ',
                style: TextStyle(
                  color: context.theme.greyColor,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: "what'S my number?",
                    style: TextStyle(
                      color: context.theme.blueColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 20,
            ),
            child: CustomTextField(
              controller: countryNameController,
              onTap: showCountryCodePicker,
              readOnly: true,
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: Coloors.greenDark,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomTextField(
                    onTap: showCountryCodePicker,
                    controller: countryCodeController,
                    prefixText: ' + ',
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    onTap: () => {},
                    controller: phoneNumberController,
                    hintText: 'Phone number.',
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Carrier charges may be apply',
            style: TextStyle(
              color: context.theme.greyColor,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevateButton(
        onPressed: sendCodeToPhone,
        text: 'NEXT',
        buttonWidth: 80,
      ),
    );
  }
}
