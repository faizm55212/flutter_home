import 'package:flutter/material.dart';

class Marker extends StatelessWidget {
  const Marker({
    Key? key,
    required this.kwidhth,
  }) : super(key: key);

  final double kwidhth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0, left: 20),
      width: kwidhth / 1.4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '|',
            style: TextStyle(fontSize: 8.0),
          ),
          Text(
            '|',
            style: TextStyle(fontSize: 8.0),
          ),
          Text(
            '|',
            style: TextStyle(fontSize: 8.0),
          ),
          Text(
            '|',
            style: TextStyle(fontSize: 8.0),
          ),
          Text(
            '|',
            style: TextStyle(fontSize: 8.0),
          ),
          Text(
            '|',
            style: TextStyle(fontSize: 8.0),
          ),
        ],
      ),
    );
  }
}
