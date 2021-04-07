import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:textfield_validation_bloc/ui/styles/palette.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isBorder;
  final bool showField;
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final String initialValue;
  final TextStyle labelStyle;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final Color hintColor;
  final bool isBorderTransparent;
  final bool isChangeLabelColor;
  final double borderRadius;
  final int maxLines;
  final int minLines;

  const CustomTextField(
      {Key key,
      this.maxLines = 1,
      this.minLines = 1,
      this.label = '',
      this.validator,
      this.onChanged,
      this.isBorder = false,
      this.initialValue,
      this.icon,
      this.hintText,
      this.labelStyle,
      this.controller,
      this.inputFormatters,
      this.showField = true,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.hintColor,
      this.isBorderTransparent = false,
      this.isChangeLabelColor,
      this.borderRadius = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // _buildLabel(context),
        // middeChild,
        _buildField(context),
      ],
    );
  }

  Widget _buildField(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      validator: validator,
      onChanged: onChanged,
      initialValue: initialValue,
      keyboardType: keyboardType,
      obscureText: obscureText,
      // style: isBorderTransparent
      //     ? TextStyles.headline4
      //     : TextStyles.bodyText1.normal,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: isBorder
            ? const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0)
            : const EdgeInsets.symmetric(vertical: 12.0),
        fillColor: Colors.transparent,
        hintText: hintText,
        labelText: label,
        labelStyle: labelStyle,
        hintStyle: TextStyle(color: hintColor),
        prefixIconConstraints: const BoxConstraints(
          minHeight: 32.0,
          minWidth: 32.0,
        ),
        focusedBorder: isBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius),
                ),
                borderSide: const BorderSide(color: Palette.veryLightGrey),
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide(color: Palette.dimGreenText),
              ),
        enabledBorder: isBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius),
                ),
                borderSide: BorderSide(
                  color: isBorderTransparent
                      ? Colors.transparent
                      : Palette.veryLightGrey,
                ),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(
                  color: isBorderTransparent
                      ? Colors.transparent
                      : Palette.veryLightGrey,
                ),
              ),
        prefixIcon: icon == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
                child: Icon(icon, size: 20.0),
              ),
      ),
    );
  }
}
