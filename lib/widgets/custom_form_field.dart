import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final TextInputType inputType;
  final String label;
  final bool isLast;
  final void Function(String? value)? onSaved;

  const CustomFormField({
    super.key,
    this.inputType = TextInputType.text,
    required this.label,
    this.isLast = true,
    required this.onSaved,
  });
  const CustomFormField.email({
    super.key,
    this.isLast = true,
    required this.onSaved,
  })  : inputType = TextInputType.emailAddress,
        label = 'Email Address';

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  var _isObsecure = true;
  void _toggleObsecure() {
    setState(() {
      _isObsecure = !_isObsecure;
    });
  }

  ColorScheme get _colorScheme {
    return Theme.of(context).colorScheme;
  }

  String get _validationErrorMessage {
    return 'enter a valid ${widget.label.toLowerCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 9.0,
      ),
      child: SizedBox(
        width: 300,
        child: TextFormField(
          autocorrect:
              widget.inputType == TextInputType.emailAddress ? false : true,
          textCapitalization: TextCapitalization.none,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return _validationErrorMessage;
            }
            if (widget.inputType == TextInputType.emailAddress) {
              if (!value.contains('@')) {
                return _validationErrorMessage;
              }
            } else if (value.trim().length < 6) {
              return '${widget.label.toLowerCase()} must be 6 chars long';
            }

            return null;
          },
          obscureText: widget.inputType == TextInputType.emailAddress
              ? false
              : _isObsecure,
          onSaved: widget.onSaved,
          textInputAction:
              widget.isLast ? TextInputAction.done : TextInputAction.next,
          keyboardType: widget.inputType,
          cursorColor: _colorScheme.surface,
          style: TextStyle(
            color: _colorScheme.surface,
          ),
          decoration: InputDecoration(
            suffixIcon: widget.inputType == TextInputType.emailAddress
                ? null
                : IconButton(
                    icon: Icon(
                      color: Theme.of(context).colorScheme.surface,
                      _isObsecure
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                    ),
                    onPressed: _toggleObsecure,
                  ),
            labelText: widget.label,
            labelStyle: TextStyle(
              color: _colorScheme.surface,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            fillColor: _colorScheme.secondary,
            filled: true,
          ),
        ),
      ),
    );
  }
}
