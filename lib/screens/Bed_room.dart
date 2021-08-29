import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_home/controller/animationController.dart';
import 'package:flutter_home/controller/tab_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:spring/spring.dart';
import 'package:flutter_home/components/bottom_bar.dart';
import 'package:flutter_home/components/marker.dart';
import 'package:flutter/services.dart';

Rx<Color> bulbColor =
    Color(0xFFFFEB3B).withAlpha(currentSliderValue.value.toInt()).obs;
MyTabController tabController = Get.find<MyTabController>();
SpringController springController = SpringController();
AnimeController anime = Get.put(AnimeController());

Rx<double> currentSliderValue = 100.toDouble().obs;

class BedRoom extends StatelessWidget {
  const BedRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double kHieght = MediaQuery.of(context).size.height;
    double kwidhth = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF00579E),
          statusBarIconBrightness: Brightness.dark),
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: -100.0,
                left: -100.0,
                child: Container(
                  width: kwidhth + 200,
                  child: Spring.rotate(
                    startAngle: 0,
                    endAngle: -40,
                    animDuration: Duration(milliseconds: 700),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: SvgPicture.asset('assets/circles.svg'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 40.0, horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/back.svg',
                                width: 25.0,
                              ),
                              Text(
                                ' Bed',
                                style: TextStyle(
                                  fontSize: 35.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Room',
                            style: TextStyle(
                                fontSize: 35.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.0),
                          DelayedDisplay(
                            delay: Duration(seconds: 1),
                            slidingBeginOffset: Offset(0.0, -3.5),
                            child: Text(
                              "4 Lights",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.yellow[800],
                                  fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/light bulb.svg',
                          color: Colors.black,
                        ),
                        Obx(
                          () => SvgPicture.asset(
                            'assets/light bulb.svg',
                            color: bulbColor.value
                                .withOpacity(currentSliderValue.value / 100),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/Group 38.svg',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DelayedDisplay(
                    delay: Duration(milliseconds: 700),
                    slidingBeginOffset: Offset(3.5, 0.0),
                    child: TabBar(
                      labelPadding: EdgeInsets.only(left: 10),
                      indicatorColor: Colors.transparent,
                      isScrollable: true,
                      controller: tabController.controller,
                      tabs: [
                        Container(
                          height: 50.0,
                          width: kwidhth / 2.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                'assets/surface1.svg',
                                width: 25.0,
                              ),
                              Text(
                                'Main Light',
                                style: TextStyle(
                                  color: Colors.indigo[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50.0,
                          width: kwidhth / 2.7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.indigo[900]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                'assets/desk.svg',
                                width: 25.0,
                              ),
                              Text(
                                'Desk lights',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50.0,
                          width: kwidhth / 2.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                'assets/bed (1).svg',
                                width: 25.0,
                              ),
                              Text(
                                'Bed lights',
                                style: TextStyle(
                                  color: Colors.indigo[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Hero(
                    tag: 'dash',
                    child: Material(
                      color: Color(0xFFF0F0F7),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        height: 1230 - kHieght,
                        width: kwidhth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Intensity',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SvgPicture.asset(
                                  'assets/solution2.svg',
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: kwidhth / 1.3,
                                      child: Obx(
                                        () => Slider(
                                            activeColor: Colors.yellow[800],
                                            min: 10,
                                            max: 100,
                                            value: anime.tickerValue.value <=
                                                    currentSliderValue.value
                                                ? anime.tickerValue.value
                                                : currentSliderValue.value,
                                            onChanged: (double value) {
                                              currentSliderValue.value = value;
                                              anime.tickerValue.value = value;
                                            }),
                                      ),
                                    ),
                                    //Marker
                                    Marker(kwidhth: kwidhth),
                                  ],
                                ),
                                SvgPicture.asset(
                                  'assets/solution.svg',
                                  width: 20.0,
                                ),
                              ],
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Colors',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ColorBall(Color(0xFFEF9A9A)),
                                ColorBall(Color(0xFF81C784)),
                                ColorBall(Color(0xFF64B5F6)),
                                ColorBall(Color(0xFFBA68C8)),
                                ColorBall(Color(0xFF546E7A)),
                                ColorBall(Color(0xFFFFEB3B)),
                                Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/+.svg',
                                      width: 10.0,
                                    ),
                                  ),
                                ),
                                Spring.animatedCard(
                                  fromWidth: kwidhth / 3.7,
                                  toWidth: 10,
                                  fromHeight: 10,
                                  toHeight: 10,
                                  fromElevation: 0,
                                  toElevation: 0,
                                  fromColor: Colors.transparent,
                                  toColor: Colors.transparent,
                                  child: Text(''),
                                ),
                              ],
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Scenes',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 60.0,
                                      width: kwidhth / 2.5,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        gradient: LinearGradient(
                                          begin: Alignment.centerRight,
                                          end: Alignment.centerLeft,
                                          colors: [
                                            Colors.orangeAccent,
                                            Colors.deepOrange
                                          ],
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/surface2.svg',
                                            width: 25.0,
                                          ),
                                          Text(
                                            'Birthday',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 60.0,
                                      width: kwidhth / 2.5,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        gradient: LinearGradient(
                                          begin: Alignment.centerRight,
                                          end: Alignment.centerLeft,
                                          colors: [
                                            Colors.purpleAccent,
                                            Colors.deepPurple
                                          ],
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/surface2.svg',
                                            width: 25.0,
                                          ),
                                          Text(
                                            'Party',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 60.0,
                                      width: kwidhth / 2.5,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        gradient: LinearGradient(
                                          begin: Alignment.centerRight,
                                          end: Alignment.centerLeft,
                                          colors: [
                                            Colors.lightBlueAccent,
                                            Colors.blue
                                          ],
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/surface2.svg',
                                            width: 25.0,
                                          ),
                                          Text(
                                            'Relax',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 60.0,
                                      width: kwidhth / 2.5,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        gradient: LinearGradient(
                                          begin: Alignment.centerRight,
                                          end: Alignment.centerLeft,
                                          colors: [
                                            Colors.lightGreenAccent,
                                            Colors.greenAccent
                                          ],
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/surface2.svg',
                                            width: 25.0,
                                          ),
                                          Text(
                                            'Fun',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BottomBar(),
                ],
              ),
              Positioned(
                bottom: 1253 - kHieght,
                right: 0.0,
                child: PowerButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PowerButton extends StatelessWidget {
  const PowerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        if (currentSliderValue.value > 10) {
          currentSliderValue.value = 10;
          anime.tickerValue.value = 10;
        } else {
          currentSliderValue.value = 100;
          anime.tickerValue.value = 100;
        }
      },
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/power.svg',
            width: 18.0,
          ),
        ),
      ),
    );
  }
}

class ColorBall extends StatelessWidget {
  final Color color;
  ColorBall(this.color);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bulbColor.value = color.withOpacity(currentSliderValue.value / 100);
      },
      child: Container(
        height: 30.0,
        width: 30.0,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }
}
