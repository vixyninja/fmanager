import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/utils/utils.dart';

class CardOption extends StatefulWidget {
  const CardOption({
    super.key,
    required this.title,
    required this.iconPath,
    required this.theme,
  });

  final String title;
  final String iconPath;
  final ThemeData theme;

  @override
  State<CardOption> createState() => _CardOptionState();
}

class _CardOptionState extends State<CardOption> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 86,
      child: ElevatedButton(
        onPressed: () => {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              AssetManager.getIconPath(
                widget.iconPath,
              ),
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 32),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: widget.theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
