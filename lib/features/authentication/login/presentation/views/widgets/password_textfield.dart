import 'package:dating_app/resources/assets.gen.dart';
import 'package:dating_app/resources/colors.gen.dart';
import 'package:dating_app/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class PasswordTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String? errorText;
  final TextInputAction textInputAction;
  final VoidCallback onSubmitted;
  final FocusNode? focusNode;

  const PasswordTextField({
    super.key,
    required this.onChanged,
    required this.errorText,
    required this.onSubmitted,
    required this.textInputAction,
    required this.focusNode,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      obscureText: isHidden,
      style: Theme.of(
        context,
      ).textTheme.bodyMedium?.copyWith(color: ColorName.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(Dimens.paddingMedium2),
        filled: true,
        fillColor: Color(0xFF2C2C2E),
        labelText: "Şifre",
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: SvgPicture.asset(Assets.icon.unlock, fit: BoxFit.scaleDown),
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
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: Dimens.paddingMedium1),
          child: IconButton(
            icon: isHidden
                ? SvgPicture.asset(Assets.icon.hidePassword)
                : SvgPicture.asset(Assets.icon.showPassword),
            onPressed: onPressedPasswordVisibility,
          ),
        ),
      ),
      keyboardType: TextInputType.text,
      maxLines: 1,
      onChanged: widget.onChanged,
      onFieldSubmitted: (_) {
        widget.onSubmitted();
      },
      textInputAction: widget.textInputAction,
      autofillHints: [AutofillHints.password],
      onEditingComplete: () => TextInput.finishAutofillContext(),
      focusNode: widget.focusNode,
    );
  }

  void onPressedPasswordVisibility() => setState(() => isHidden = !isHidden);
}
