import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: SvgPicture.asset('assets/bulb.svg'),
          ),
          Container(
            child: SvgPicture.asset('assets/feather-home.svg'),
          ),
          Container(
            child: SvgPicture.asset('assets/feather-settings.svg'),
          ),
        ],
      ),
    );
  }
}
