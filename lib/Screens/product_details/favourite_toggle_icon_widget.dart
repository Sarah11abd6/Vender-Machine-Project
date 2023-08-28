import 'package:flutter/material.dart';

class FavoriteToggleIcon extends StatefulWidget {
  const FavoriteToggleIcon({super.key});

  @override
  FavoriteToggleIconState createState() => FavoriteToggleIconState();
}

class FavoriteToggleIconState extends State<FavoriteToggleIcon> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          favorite = !favorite;
        });
      },
      child: Icon(
        favorite ? Icons.favorite : Icons.favorite_border,
        color: favorite ? Colors.red : Colors.blueGrey,
        size: 30,
      ),
    );
  }
}
