import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:kryptonium/controllers/login_controller.dart';
import 'package:kryptonium/widgets/custom_button.dart';
import 'package:kryptonium/widgets/customer_text_field.dart';

class Login extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailValidator = MultiValidator([
    EmailValidator(errorText: 'Please enter a valid email address'.tr),
    RequiredValidator(errorText: 'Please enter your email address'.tr)
  ]);

  final passwordValidator = MultiValidator(
      [RequiredValidator(errorText: 'Please enter your password'.tr)]);

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
                  Get.toNamed('/register');
                },
                child: Text(
                  'Register'.tr,
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
                  'Login'.tr,
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
                  controller: loginController.emailTextController,
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
                  controller: loginController.passwordTextController,
                  labelText: 'Password'.tr,
                  fieldValidator: passwordValidator,
                  password:
                      loginController.passwordVisible.value ? false : true,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  fillColor: Get.theme.canvasColor,
                  filled: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      loginController.passwordVisible.value =
                          !loginController.passwordVisible.value;
                    },
                    icon: Icon(
                      loginController.passwordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                InkWell(
                    onTap: () {
                      // Get.to(ForgetPassword());
                    },
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forget Password ?",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12.0,
                          ),
                        ))),
                const SizedBox(
                  height: 24.0,
                ),
                CustomButton(
                  title: 'Login',
                  color: Get.theme.primaryColor,
                  isGradient: true,
                  onClick: () {},
                )
              ],
            ),
          ),
        );
      })),
    );
  }
}
