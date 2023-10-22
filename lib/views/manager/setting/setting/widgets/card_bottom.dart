import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fmanager/views/manager/setting/setting/utils/constatns.dart';

import '../../../../../utils/asset_manager.dart';

class CardBottom extends StatefulWidget {
  const CardBottom({
    super.key,
    required this.theme,
    required this.title,
    required this.iconPath,
  });

  final ThemeData theme;
  final String title;
  final String iconPath;

  @override
  State<CardBottom> createState() => _CardBottomState();
}

class _CardBottomState extends State<CardBottom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Material(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: InkWell(
                  child: SvgPicture.asset(
                    width: 32,
                    height: 32,
                    AssetManager.getIconPath(widget.iconPath),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 24),
            SizedBox(
              width: 150,
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: widget.theme.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
        if (widget.title != 'Đăng xuất')
          SvgPicture.asset(
            width: 24,
            height: 24,
            AssetManager.getIconPath(IconManager.icNext),
          )
        else
          const SizedBox(width: 24, height: 24),
      ],
    );
  }
}
