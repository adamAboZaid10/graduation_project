import 'package:flutter/material.dart';

class CustomDefaultTextFormField extends StatelessWidget {
  const CustomDefaultTextFormField({
    super.key,
    required this.controller,
    required this.type,
    required this.validator,
    required this.hintText,
    this.suffix,
    this.onChange,
    this.onSubmit,
    this.onTap,
    this.suffixPressed,
    required this.obscure,
    this.prefix,
    this.prefixPressed,
    this.maxLine,
    this.radius,
    required this.backgroundColor,
    required this.hintColor,
    required this.textColor,
  });
  final TextEditingController controller;
  final TextInputType type;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChange;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final IconData? suffix;
  final int? maxLine;
  final IconData? prefix;
  final GestureTapCallback? suffixPressed;
  final GestureTapCallback? prefixPressed;
  final bool obscure;
  final double? radius;
  final Color backgroundColor;
  final Color hintColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          maxLines: maxLine,
          controller: controller,
          keyboardType: type,
          onFieldSubmitted: onSubmit,
          onTap: onTap,
          onChanged: onChange,
          validator: validator,
          obscureText: obscure,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            prefixIcon: prefix != null
                ? IconButton(
                    onPressed: prefixPressed,
                    icon: Icon(
                      prefix,
                      color: Theme.of(context).iconTheme.color,
                      size: 16,
                    ),
                  )
                : null,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: hintColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
            suffixIcon: suffix != null
                ? IconButton(
                    onPressed: suffixPressed,
                    icon: Icon(
                      suffix,
                      color: Colors.black,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
