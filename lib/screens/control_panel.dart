import 'package:flutter/material.dart';
import 'package:flutter_home/components/bottom_bar.dart';
import 'package:flutter_home/screens/Bed_room.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class ControlPanel extends StatelessWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double kHieght = MediaQuery.of(context).size.height;
    double kwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -100.0,
            left: -100.0,
            child: Container(
              width: kwidth + 200,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: SvgPicture.asset('assets/circles.svg'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 30.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (kwidth - 150),
                        child: Text(
                          'Control Panel',
                          style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                              height: 1.4,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Image.asset('assets/user.png'),
                      ),
                    ]),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Hero(
                tag: 'dash',
                child: Material(
                  color: Color(0xFFF0F0F7),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    height: (kHieght) / 1.4,
                    width: (kwidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'All Rooms',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 10, 0, 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OptionTile(
                                        "Bed Room", "4", "assets/bed.svg"),
                                    OptionTile(
                                        "Living Room", "2", "assets/room.svg"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OptionTile("Kitchen Room", "5",
                                        "assets/kitchen.svg"),
                                    OptionTile(
                                        "Bathroom", "1", "assets/bathtube.svg"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OptionTile(
                                        "Outdoor", "5", "assets/house.svg"),
                                    OptionTile(
                                        "Balcony", "2", "assets/balcony.svg"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BottomBar(),
            ],
          ),
        ],
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final String _decText;
  final String _itemCount;
  final String svgPath;
  OptionTile(this._decText, this._itemCount, this.svgPath);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return BedRoom();
        }));
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        alignment: Alignment.centerLeft,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        elevation: MaterialStateProperty.all(3.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 5.55,
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0),
              child: Container(
                width: 50.0,
                height: 50.0,
                child: SvgPicture.asset(
                  svgPath,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0),
              child: Text(
                _decText,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 17.0,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, left: 10.0),
              child: Text(
                "$_itemCount" + " Lights",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                    fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
