import 'package:dating_app/resources/assets.gen.dart';
import 'package:dating_app/resources/colors.gen.dart';
import 'package:dating_app/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String? errorText;
  final TextInputAction textInputAction;
  final VoidCallback onSubmitted;
  final FocusNode? focusNode;

  const EmailTextField({
    super.key,
    required this.onChanged,
    required this.errorText,
    required this.onSubmitted,
    required this.textInputAction,
    required this.focusNode,
  });

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
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
        hintText: 'E-Posta',
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: SvgPicture.asset(
          Assets.icon.message,
          fit: BoxFit.scaleDown,
        ),
        labelStyle: TextStyle(color: ColorName.white),
        floatingLabelBehavior: FloatingLabelBehavior.never,
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
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9.@_-]')),
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      onChanged: widget.onChanged,
      onFieldSubmitted: (_) {
        widget.onSubmitted();
      },
      textInputAction: widget.textInputAction,
      keyboardType: TextInputType.emailAddress,
      autofillHints: [AutofillHints.email],
      onEditingComplete: () => TextInput.finishAutofillContext(),
      focusNode: widget.focusNode,
    );
  }
}
