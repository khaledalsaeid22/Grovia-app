import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final int? maxLines;
  final bool? enabled;
  final FocusNode? focusNode;
  final Color? fillColor;
  final bool filled;
  final TextCapitalization textCapitalization;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? autoFocusNode;
  const CustomTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.maxLines = 1,
    this.enabled,
    this.focusNode,
    this.fillColor,
    this.filled = false,
    this.textCapitalization = TextCapitalization.none,
    this.contentPadding,
    this.inputFormatters,
    this.autoFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        maxLines: maxLines,
        enabled: enabled,
        focusNode: focusNode,
        textCapitalization: textCapitalization,
        onEditingComplete: () {
          FocusScope.of(context).unfocus();
        },

        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,

          labelStyle: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.outline,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: fillColor ?? theme.colorScheme.surfaceContainerHighest,
          filled: filled,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: theme.colorScheme.outline,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: theme.colorScheme.outlineVariant,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: theme.colorScheme.error, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: theme.colorScheme.error, width: 2.0),
          ),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
        ),
      ),
    );
  }
}
