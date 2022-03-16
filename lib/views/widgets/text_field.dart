import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mc_crud_test/config/design_config.dart';
import 'package:mc_crud_test/config/theme_data.dart';
import 'package:mc_crud_test/views/widgets/animated_visibility.dart';
import 'package:mc_crud_test/views/widgets/text.dart';

class RayankarTextField extends StatefulWidget {
  final void Function(String value)? onChanged;
  final void Function(String value)? onSubmitted;
  final bool enabled;
  final bool autoFocus;
  final TextAlign textAlign;
  final String? title;
  final String? hintText;
  final dynamic initialValue;
  final bool acceptSpace;
  final String? Function(String value)? validator;
  final TextInputType? textInputType;
  const RayankarTextField({
    Key? key,
    this.onChanged,
    this.enabled = true,
    this.title,
    this.hintText,
    this.initialValue,
    this.validator,
    this.textInputType,
    this.textAlign = TextAlign.right,
    this.autoFocus = false,
    this.onSubmitted,
    this.acceptSpace = true,
  }) : super(key: key);

  @override
  State<RayankarTextField> createState() => _RayankarTextFieldState();
}

class _RayankarTextFieldState extends State<RayankarTextField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  String? _error;

  @override
  void initState() {
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue;
    }
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          RayankarText(
            widget.title!,
            color: _titleColor(),
          ),
        if (widget.title != null) const SizedBox(height: 8),
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: _fillColor(),
            borderRadius: DesignConfig.lowBorderRadius,
            border: Border.all(color: _borderColor()),
          ),
          child: TextFormField(
            inputFormatters: <TextInputFormatter>[
              if (!widget.acceptSpace)
                FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
            ],
            autofocus: widget.autoFocus,
            textAlign: widget.textAlign,
            keyboardType: widget.textInputType,
            focusNode: _focusNode,
            controller: _controller,
            onFieldSubmitted: widget.onSubmitted,
            onChanged: _onChanged,
            validator: _validator,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              enabled: widget.enabled,
              border: InputBorder.none,
              hintText: widget.hintText,
              errorStyle: const TextStyle(height: 0.01),
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Theme.of(context).colorScheme.hint),
            ),
          ),
        ),
        const SizedBox(height: 8),
        AnimatedVisibility(
          isVisible: _error != null,
          duration: DesignConfig.lowAnimationDuration,
          child: Row(
            children: [
              Icon(
                Icons.info,
                color: Theme.of(context).colorScheme.error,
                size: 14,
              ),
              RayankarText(
                _error ?? '',
                style: Theme.of(context).textTheme.caption,
                color: Theme.of(context).colorScheme.error,
              ),
            ],
          ),
        )
      ],
    );
  }

  Color _borderColor() {
    if (_focusNode.hasFocus) {
      return Theme.of(context).colorScheme.focusedBorder;
    } else if (_error != null) {
      return Theme.of(context).colorScheme.error;
    }
    return Theme.of(context).colorScheme.border;
  }

  Color? _titleColor() {
    if (!widget.enabled) {
      return Theme.of(context).colorScheme.hint;
    }
    if (_error != null) {
      return Theme.of(context).colorScheme.error;
    }
    return null;
  }

  Color _fillColor() {
    if (!widget.enabled) {
      return Theme.of(context).colorScheme.secondCTA;
    }
    if (_focusNode.hasFocus) {
      return Theme.of(context).colorScheme.focused;
    }
    if (_error != null) {
      return Theme.of(context).colorScheme.errorBack;
    }
    return Theme.of(context).colorScheme.surface;
  }

  void _onChanged(String value) {
    setState(() {
      _error = null;
    });

    widget.onChanged?.call(value);
  }

  String? _validator(String? value) {
    if (widget.validator != null) {
      final String? error = widget.validator!(value!);
      if (error != null) {
        setState(() {
          _error = error;
        });
        return '';
      } else {
        setState(() {
          _error = null;
        });
      }
    }
    return null;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
