import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final bool password;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final FormFieldValidator<String>? fieldValidator;
  final String? initialValue;
  final int? maxLength;
  final double? borderWidth;
  final bool? enabled;
  final ValueChanged<String>? onChanged;
  final int? minLines, maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final bool? filled;
  final Color? fillColor;
  final bool? readOnly;
  final VoidCallback? onTap;

  const CustomTextField(
      {required this.labelText,
      this.password = false,
      required this.textInputType,
      required this.textInputAction,
      required this.controller,
      this.fieldValidator,
      this.initialValue,
      this.maxLength,
      this.borderWidth = 3.0,
      this.enabled = true,
      this.onChanged,
      this.minLines,
      this.maxLines,
      this.suffixIcon,
      this.onFieldSubmitted,
      this.focusNode,
      this.inputFormatters,
      this.filled = false,
      this.fillColor,
      this.prefixIcon,
      this.readOnly = false,
      this.onTap});

  @override
  _FormInputFieldState createState() => _FormInputFieldState();
}

class _FormInputFieldState extends State<CustomTextField> {
  var _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: widget.labelText.toLowerCase().capitalizeEachWord,
            style: TextStyle(
              fontSize: 16,
              color: Get.theme.textSelectionTheme.selectionColor,
            ),
            // children: widget.fieldValidator == null ||
            //         widget.textInputType == TextInputType.emailAddress
            //     ? null
            //     : [
            //         const TextSpan(
            //           text: ' *',
            //           style: TextStyle(
            //             color: Colors.redAccent,
            //           ),
            //         )
            //       ]
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          cursorColor: Theme.of(context).textSelectionTheme.selectionColor,
          inputFormatters: widget.inputFormatters,
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFieldSubmitted,
          onChanged: widget.onChanged,
          enabled: widget.enabled,
          minLines: widget.minLines,
          maxLines: !widget.password ? widget.maxLines : 1,
          validator: widget.fieldValidator,
          obscureText: widget.password && !_passwordVisible,
          maxLength: widget.maxLength,
          keyboardType: widget.textInputType,
          textInputAction: widget.textInputAction,
          controller: widget.controller,
          initialValue: widget.initialValue,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            hintText:
                "${'Enter'.tr} ${widget.labelText.replaceAll("add", "").trim()}",
            errorStyle:
                TextStyle(color: Theme.of(context).errorColor, fontSize: 14),
            errorMaxLines: 3,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none),
            filled: widget.filled,
            fillColor: widget.fillColor,
            suffixIcon: widget.suffixIcon,
            prefix: widget.prefixIcon,
          ),
          // readOnly: widget.readOnly,
          onTap: widget.onTap,
        ),
      ],
    );
  }
}

extension CapExtension on String {
  String get capitalizeEachWord =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
