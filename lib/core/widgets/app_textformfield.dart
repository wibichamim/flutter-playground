import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextFormField extends StatefulWidget {
  final String hint;
  final bool obscure;
  final Color textHintColor;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? errorText;
  final Widget? endIcon;
  final Function? endIconClicked;
  final bool? readOnlyField;
  final TextInputType? keyboardType;
  final double borderRadius;
  final isLabeled;
  const AppTextFormField({
    Key? key,
    required this.hint,
    this.obscure = false,
    this.textHintColor = Colors.white,
    this.controller,
    this.onChanged,
    this.errorText,
    this.endIcon,
    this.endIconClicked,
    this.readOnlyField,
    this.keyboardType,
    this.borderRadius = 20.0,
    this.isLabeled = false,
  }) : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isVisible = false;
  bool focused = false;
  bool alreadyClicked = false;

  late BorderRadius borderRadius = BorderRadius.circular(widget.borderRadius);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isLabeled
            ? Column(
                children: [
                  Text(
                    widget.hint,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                ],
              )
            : SizedBox.shrink(),
        TextFormField(
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(color: Colors.black),
          obscureText: widget.obscure && isVisible == false,
          controller: widget.controller,
          onChanged: widget.onChanged,
          readOnly: widget.readOnlyField == true,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: const BorderSide(
                color: AppColors.softGray,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: const BorderSide(
                color: AppColors.softGray,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: const BorderSide(
                color: AppColors.primary,
              ),
            ),
            hintText: widget.hint,
            filled: true,
            fillColor: Colors.white,
            errorText: alreadyClicked ? widget.errorText : null,
            suffixIcon: widget.obscure
                ? InkWell(
                    onTap: () => setState(() => isVisible = !isVisible),
                    child: Icon(
                        isVisible ? Icons.visibility_off : Icons.visibility),
                  )
                : widget.endIcon != null
                    ? InkWell(
                        child: widget.endIcon,
                        onTap: () => widget.endIconClicked?.call(),
                      )
                    : null,
          ),
        ),
      ],
    );
  }
}
