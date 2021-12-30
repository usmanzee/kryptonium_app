import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:kryptonium/controllers/register_controller.dart';
import 'package:kryptonium/widgets/custom_button.dart';
import 'package:kryptonium/widgets/customer_text_field.dart';

class Register extends StatelessWidget {
  final RegisterController registerController = Get.put(RegisterController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final firstNameValidator = MultiValidator(
      [RequiredValidator(errorText: 'Please enter your first name'.tr)]);

  final lastNameValidator = MultiValidator(
      [RequiredValidator(errorText: 'Please enter your last name'.tr)]);

  final emailValidator = MultiValidator([
    EmailValidator(errorText: 'Please enter a valid email address'.tr),
    RequiredValidator(errorText: 'Please enter your email address'.tr)
  ]);

  final phoneNumberValidator = MultiValidator([
    RequiredValidator(errorText: 'Please enter your phone number'.tr),
  ]);

  final passwordValidator = MultiValidator([
    PatternValidator(r'((?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*\W)\w.{6,18}\w)',
        errorText:
            'Passwords must be 8 characters with uppercase and special letters'
                .tr)
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.clear,
            size: 24,
          ),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).hintColor),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 16.0),
            child: GestureDetector(
                onTap: () {
                  Get.toNamed('/login');
                },
                child: Text(
                  'Login'.tr,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(child: Obx(() {
        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Register'.tr,
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Theme.of(context).textSelectionTheme.selectionColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                CustomTextField(
                  controller: registerController.firstNameTextController,
                  labelText: 'First Name'.tr,
                  fieldValidator: firstNameValidator,
                  password: false,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  fillColor: Get.theme.canvasColor,
                  filled: true,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                CustomTextField(
                  controller: registerController.lastNameTextController,
                  labelText: 'Last Name'.tr,
                  fieldValidator: lastNameValidator,
                  password: false,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  fillColor: Get.theme.canvasColor,
                  filled: true,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                CustomTextField(
                  controller: registerController.emailTextController,
                  labelText: 'Email'.tr,
                  fieldValidator: emailValidator,
                  password: false,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  fillColor: Get.theme.canvasColor,
                  filled: true,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                CustomTextField(
                  controller: registerController.phoneTextController,
                  labelText: 'Phone'.tr,
                  fieldValidator: phoneNumberValidator,
                  password: false,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  fillColor: Get.theme.canvasColor,
                  filled: true,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                CustomTextField(
                  controller: registerController.passwordTextController,
                  labelText: 'Password'.tr,
                  fieldValidator: passwordValidator,
                  password:
                      registerController.passwordVisible.value ? false : true,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  fillColor: Get.theme.canvasColor,
                  filled: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      registerController.passwordVisible.value =
                          !registerController.passwordVisible.value;
                    },
                    icon: Icon(
                      registerController.passwordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                CustomTextField(
                  controller: registerController.confirmPasswordTextController,
                  labelText: 'Confirm Password'.tr,
                  fieldValidator: (val) =>
                      MatchValidator(errorText: 'Passwords do not match'.tr)
                          .validateMatch(val != null ? val : '',
                              registerController.passwordTextController.text),
                  password:
                      registerController.passwordVisible.value ? false : true,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  fillColor: Get.theme.canvasColor,
                  filled: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      registerController.passwordVisible.value =
                          !registerController.passwordVisible.value;
                    },
                    icon: Icon(
                      registerController.passwordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                CustomButton(
                  title: 'Register',
                  color: Get.theme.primaryColor,
                  isGradient: true,
                  onClick: () {},
                ),
                const SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          ),
        );
      })),
    );
  }
}
