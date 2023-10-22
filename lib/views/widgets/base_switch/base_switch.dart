import 'package:flutter/material.dart';

class BaseSwitch extends StatefulWidget {
  const BaseSwitch({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  State<BaseSwitch> createState() => _BaseSwitchState();
}

class _BaseSwitchState extends State<BaseSwitch> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () => widget.onChanged(widget.value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(2),
        height: 30,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: widget.value ? Colors.orange : themeData.colorScheme.tertiary,
        ),
        child: AnimatedAlign(
          alignment: widget.value ? Alignment.centerRight : Alignment.centerLeft,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          child: Container(
            height: 27,
            width: 27,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
