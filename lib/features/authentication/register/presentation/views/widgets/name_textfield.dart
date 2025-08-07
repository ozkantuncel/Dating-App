import 'package:dating_app/resources/assets.gen.dart';
import 'package:dating_app/resources/colors.gen.dart';
import 'package:dating_app/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class NameTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String? errorText;
  final TextInputAction textInputAction;
  final VoidCallback onSubmitted;
  final FocusNode? focusNode;

  const NameTextField({
    super.key,
    required this.onChanged,
    required this.errorText,
    required this.onSubmitted,
    required this.textInputAction,
    required this.focusNode,
  });

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      maxLines: 1,
      style: Theme.of(
        context,
      ).textTheme.bodyMedium?.copyWith(color: ColorName.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(Dimens.paddingMedium2),
        filled: true,
        fillColor: Color(0xFF2C2C2E),
        labelText: "Ad Soyad",
        labelStyle: TextStyle(color: ColorName.white),
        hintStyle: const TextStyle(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: SvgPicture.asset(
          Assets.icon.addUser,
          fit: BoxFit.scaleDown,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.textFormFieldRadius),
          borderSide: BorderSide(width: 2, color: ColorName.crystalBlue),
        ),
        errorText: widget.errorText,
        errorStyle: TextStyle(
          color: ColorName.sunsetOrange,
          fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
        ),
        suffixStyle: TextStyle(color: ColorName.blackPearl),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-ZçÇğĞıİöÖşŞüÜ ]')),
      ],
      onChanged: widget.onChanged,
      onFieldSubmitted: (_) {
        widget.onSubmitted();
      },
      textInputAction: widget.textInputAction,
      keyboardType: TextInputType.name,
      autofillHints: [AutofillHints.name],
      onEditingComplete: () => TextInput.finishAutofillContext(),
      focusNode: widget.focusNode,
    );
  }
}
