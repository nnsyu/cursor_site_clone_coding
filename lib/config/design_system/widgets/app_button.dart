import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppDarkButton extends HookWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color focusColor;
  final EdgeInsetsGeometry? boxPadding;
  final Duration duration;

  const AppDarkButton({
    super.key,
    required this.child,
    this.onPressed,
    this.padding,
    this.width,
    this.height,
    this.focusColor = Colors.grey,
    this.boxPadding,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    final isHovered = useState(false);

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: AnimatedContainer(
        duration: duration,
        width: width,
        height: height,
        padding: boxPadding ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: isHovered.value ? focusColor : Colors.grey.shade800,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onPressed,
            child: Padding(
              padding: padding ?? const EdgeInsets.all(11),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class AppLightButton extends HookWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color focusColor;
  final EdgeInsetsGeometry? boxPadding;
  final Duration duration;

  const AppLightButton({
    super.key,
    required this.child,
    this.onPressed,
    this.padding,
    this.width,
    this.height,
    this.focusColor = Colors.black,
    this.boxPadding,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    final isHovered = useState(false);

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: AnimatedContainer(
        duration: duration,
        width: width,
        height: height,
        padding: boxPadding ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isHovered.value ? focusColor : Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onPressed,
            child: Padding(
              padding: padding ?? const EdgeInsets.all(11),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
