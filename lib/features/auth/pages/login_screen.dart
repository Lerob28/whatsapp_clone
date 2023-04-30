import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/helper/show_alert_dialog.dart';
import 'package:whatsapp_clone/common/utils/colors.dart';
import 'package:whatsapp_clone/common/widgets/custom_elevate_button.dart';
import 'package:whatsapp_clone/common/widgets/custom_icon_buttom.dart';
import 'package:whatsapp_clone/features/auth/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  sendCodeToPhone() {
    final phone = phoneNumberController.text;
    final name = countryNameController.text;
    bool isTooShort = phone.length < 9 ;
    bool isTooLong = phone.length >= 10 ;

    if(phone.isEmpty) {
      return showAlertDialog(
        context: context,
        message: "The phone number is required !",
      );
    }else if(isTooShort) {
      return showAlertDialog(
        context: context,
        message: "The phone number you entered is too short for the country: $name.\n\n Include your area if yoe haven't",
      );
    }else if(isTooLong) {
      return showAlertDialog(
        context: context,
        message: "The phone number you entered is too long for the country: $name.",
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
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Coloors.greenDark,
              ),
            ),
          )),
      onSelect: (country) {
        countryNameController.text = country.name;
        countryCodeController.text = country.countryCode;
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