import 'package:flutter/material.dart';

class BaseHeader extends StatelessWidget {
  const BaseHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          child: InkWell(
            onTap: () {},
            child: const CircleAvatar(
              backgroundImage: NetworkImage('https://picsum.photos/200/300'),
              radius: 24,
            ),
          ),
        )
      ],
    );
  }
}
