import 'package:cms_app/helper/shared_methods.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  final Color? backgroundColor;
  final bool isPassword;
  final String hintText;
  final String? text;
  final String? validateEmptyText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? maxLength;
  final String? labelText;
  final String? suffixText;
  final bool? required;
  final bool? showLabel;
  final Color? hintColor;
  final Color? labelColor;
  final Color? textColor;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Color? suffixIconColor;
  final bool enabled;
  final List<String>? autoFillHints;
  final double? radius;
  final Function(String value)? onChanged;
  final Function(String value)? onFieldSubmitted;

  final Color? fillColor;

  const AppTextFormField({
    Key? key,
    this.backgroundColor,
    this.isPassword = false,
    required this.hintText,
    this.text,
    this.validateEmptyText,
    required this.controller,
    required this.keyboardType,
    this.maxLines,
    this.maxLength,
    this.labelText,
    this.suffixText,
    this.required = true,
    this.hintColor,
    this.labelColor = Colors.black,
    this.textColor,
    this.enabled = true,
    this.onChanged,
    this.onFieldSubmitted,
    this.autoFillHints,
    this.suffixIcon,
    this.prefixIcon,
    this.radius = 8,
    this.showLabel = false,
    this.suffixIconColor,
    this.fillColor,
  }) : super(key: key);

  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isSecure = false;

  @override
  void initState() {
    super.initState();
    isSecure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
          obscureText: isSecure,
          style: TextStyle(
            fontSize: 14,
            // fontFamily: mediumFont,
            color: widget.textColor ?? Theme.of(context).textTheme.subtitle1!.color,
          ),
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: widget.onFieldSubmitted,
          autofillHints: widget.autoFillHints,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.start,
          validator: widget.required ?? true
              ? (String? value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return widget.validateEmptyText;
                    } else if (widget.keyboardType == TextInputType.emailAddress) {
                      return SharedMethods.email(value);
                    } else if (widget.keyboardType == TextInputType.phone) {
                      return SharedMethods.phone(value);
                    }
                  } else {
                    return null;
                  }
                  return null;
                }
              : null,
          maxLines: widget.isPassword ? 1 : widget.maxLines,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            labelText: widget.showLabel! ? widget.labelText : null,
            hintText: widget.hintText,
            fillColor: widget.enabled ? (widget.fillColor ?? Colors.white) : Colors.white,
            filled: true,
            labelStyle: TextStyle(
              fontSize: 14,
              color: widget.labelColor ??  Colors.black87,
              // fontFamily: mediumFont,
            ),
            hintStyle: TextStyle(
              fontSize: 14,
              color: widget.hintColor ?? const Color(0xFF929292),
              // fontFamily: mediumFont,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            alignLabelWithHint: true,
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon, size: 20, color: Colors.grey)
                : null,
            suffixText: widget.suffixText ?? '',
            suffixStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 12,
            ),
            suffixIcon: widget.suffixIcon != null || widget.isPassword
                ? InkWell(
                    onTap: widget.isPassword ? _toggle : null,
                    child: Icon(
                      widget.isPassword
                          ? isSecure
                              ? Icons.remove_red_eye
                              : Icons.visibility_off
                          : widget.suffixIcon,
                      size: 20,
                      color: widget.suffixIconColor ?? Colors.grey,
                    ),
                  )
                : null,
            enabled: widget.enabled,
            errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
            errorBorder: const UnderlineInputBorder(borderSide: BorderSide(
              color: Colors.red,
            ),),
          ),
      );
  }

  void _toggle() {
    setState(() {
      isSecure = !isSecure;
    });
  }
}
