import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/utils/utils.dart';

class Header extends StatefulWidget {
  const Header({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(
            width: 58,
            height: 58,
            child: CircleAvatar(
              radius: 999,
              backgroundImage: NetworkImage(
                'https://www.phanmemninja.com/wp-content/uploads/2023/06/avatar-facebook-anime-cute-1.jpeg',
              ),
            ),
          ),
          Text(
            'Harry Tomson Rui',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: widget.theme.colorScheme.surface,
            ),
          ),
          SvgPicture.asset(
            AssetManager.getIconPath(IconManager.icNotification),
            width: 24,
            height: 24,
            color: widget.theme.colorScheme.surface,
          ),
        ],
      ),
    );
  }
}
