import 'package:flutter/material.dart';

class CardHistory extends StatefulWidget {
  const CardHistory({
    super.key,
    required this.title,
    required this.creator,
    required this.date,
    required this.hour,
    required this.room,
    required this.image,
    required this.theme,
  });

  final String title;
  final String creator;
  final String date;
  final String hour;
  final String room;
  final String image;
  final ThemeData theme;

  @override
  State<CardHistory> createState() => _CardHistoryState();
}

class _CardHistoryState extends State<CardHistory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ElevatedButton(
        onPressed: () => {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: widget.theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Nguoi yeu cau gui: ${widget.creator}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: widget.theme.colorScheme.onSurface,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      widget.date,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: widget.theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      widget.hour,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: widget.theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Phong: ${widget.room}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: widget.theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 48,
              height: 48,
              child: CircleAvatar(
                radius: 999,
                backgroundImage: NetworkImage(
                  widget.image,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
