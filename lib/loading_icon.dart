import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

enum LoadingFormat {
  Circle,
  CircleX,
  IconX,
  Dots,
  Bars,
  Grid,
  Orbit,
  Octagon,
  Saw,
  Coin,
  Gear,
  Gears,
  Hourglass,
  Pulse,
  Pokeball,
}

//ignore: must_be_immutable
class LoadingIcon extends StatefulWidget {
  late LoadingFormat loadingFormat;
  late double? size;
  late Color color;
  late double speed;
  late IconData? icon;
  late String? text;
  late double blinkSpeed;

  LoadingIcon(
      {required this.loadingFormat,
      this.size,
      this.color = Colors.white,
      this.speed = 10.0,
      this.icon,
      this.text,
      this.blinkSpeed = 0.0});

  @override
  LoadingIconState createState() => LoadingIconState();
}

class CircleXLoadingShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(width * 0.15, 0);
    path.lineTo(width * 0.85, 0);
    path.lineTo(width * 0.75, height * 0.20);
    path.lineTo(width * 0.25, height * 0.20);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class OctagonLoaderShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(width * 0.33 + width * 0.01, height * 0.05);
    path.lineTo(width * 0.66 - width * 0.01, height * 0.05);
    path.lineTo(width * 0.60 - width * 0.01, height * 0.2);
    path.lineTo(width * 0.39 + width * 0.01, height * 0.2);
    path.lineTo(width * 0.33 + width * 0.01, height * 0.05);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class SawLoaderShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(width * 0.25 + width * 0.01, height * 0.05);
    path.lineTo(width * 0.65 - width * 0.01, height * 0.10);
    path.lineTo(width * 0.67 - width * 0.01, height * 0.15);
    path.lineTo(width * 0.55 - width * 0.01, height * 0.2);
    path.lineTo(width * 0.25 + width * 0.01, height * 0.05);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class GearLoaderShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.moveTo(width * 0.4, 0);
    path.lineTo(width * 0.6, 0);
    path.lineTo(width * 0.65, height * 0.2);
    path.lineTo(width * 0.35, height * 0.2);

    path.moveTo(width * 0.4, height);
    path.lineTo(width * 0.6, height);
    path.lineTo(width * 0.65, height * 0.8);
    path.lineTo(width * 0.35, height * 0.8);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class HourglassLoaderShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.moveTo(width * 0.27, height * 0.15);
    path.lineTo(width * 0.73, height * 0.15);
    path.lineTo(width * 0.73, height * 0.18);
    path.lineTo(width * 0.27, height * 0.18);
    path.lineTo(width * 0.27, height * 0.15);

    path.moveTo(width * 0.30, height * 0.2);
    path.lineTo(width * 0.70, height * 0.2);
    path.quadraticBezierTo(
        width * 0.70, height * 0.5, width * 0.55, height * 0.5);
    path.quadraticBezierTo(
        width * 0.65, height * 0.45, width * 0.65, height * 0.25);
    path.lineTo(width * 0.35, height * 0.25);
    path.quadraticBezierTo(
        width * 0.35, height * 0.45, width * 0.45, height * 0.5);
    path.quadraticBezierTo(
        width * 0.30, height * 0.50, width * 0.30, height * 0.2);

    path.moveTo(width * 0.27, height * 0.85);
    path.lineTo(width * 0.73, height * 0.85);
    path.lineTo(width * 0.73, height * 0.82);
    path.lineTo(width * 0.27, height * 0.82);
    path.lineTo(width * 0.27, height * 0.85);

    path.moveTo(width * 0.30, height * 0.8);
    path.lineTo(width * 0.70, height * 0.8);
    path.quadraticBezierTo(
        width * 0.70, height * 0.5, width * 0.55, height * 0.5);
    path.quadraticBezierTo(
        width * 0.65, height * 0.55, width * 0.65, height * 0.75);
    path.lineTo(width * 0.35, height * 0.75);
    path.quadraticBezierTo(
        width * 0.35, height * 0.55, width * 0.45, height * 0.5);
    path.quadraticBezierTo(
        width * 0.30, height * 0.50, width * 0.30, height * 0.8);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class HourglassSandLoaderShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();

    path.moveTo(width * 0.38, height * 0.28);
    path.lineTo(width * 0.62, height * 0.28);
    path.quadraticBezierTo(
        width * 0.62, height * 0.47, width * 0.5, height * 0.47);
    path.quadraticBezierTo(
        width * 0.38, height * 0.47, width * 0.38, height * 0.28);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class HalfCircleShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();

    path.moveTo(0.0, 0.0);
    path.lineTo(0.0, height * 0.5);
    path.lineTo(width, height * 0.5);
    path.lineTo(width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class LoadingIconState extends State<LoadingIcon> {
  Timer? timer;
  double frame = 0.0;

  Widget circleSlice(double angle, double size) {
    if (angle > 360.0) angle -= 360;

    double opacity = (180.0 - angle).abs() / 180.0;

    return Transform.rotate(
        angle: (pi / 180.0) * angle,
        child: ClipPath(
          clipper: CircleXLoadingShape(),
          child: Container(
            width: size,
            height: size,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: size * 0.08,
                color: widget.color.withOpacity(opacity),
              ),
            ),
          ),
        ));
  }

  Widget circleDots(double pos, double size) {
    double intensity =
        (((((1000.0 / 3.0) * pos) + frame) % 1000.0) - 500.0).abs() / 1000.0;

    return Container(
      width: (size / 6.0) + ((size / 6) * intensity),
      height: (size / 6.0) + ((size / 6) * intensity),
      decoration: new BoxDecoration(
        color: widget.color.withOpacity(intensity + 0.5),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget rectBars(double pos, double size) {
    double intensity =
        (((((1000.0 / 8.0) * pos) + frame) % 1000.0) - 500.0).abs() / 1000.0;

    return Container(
      width: (size * 0.80),
      height: (size * 0.2) + ((size * 0.8) * intensity),
      decoration: new BoxDecoration(
        color: widget.color.withOpacity(intensity * 2.0),
      ),
    );
  }

  Widget rectGrid(double pos, double size) {
    double intensity =
        (((((1000.0 * pos) + frame) % 1000.0) - 500.0).abs() / 1000.0) * 2.0;

    return Container(
      width: (size * intensity),
      height: (size * intensity),
      color: widget.color,
    );
  }

  Widget circlesOrbit(double angle, double size) {
    if (angle > 360.0) angle -= 360;

    return Transform.rotate(
        angle: (pi / 180.0) * angle,
        child: Container(
            width: size,
            height: size,
            child: Stack(alignment: AlignmentDirectional.center, children: [
              Padding(
                  padding: EdgeInsets.only(bottom: size * 0.85),
                  child: Container(
                    width: size * 0.15,
                    height: size * 0.15,
                    decoration: new BoxDecoration(
                      color: widget.color,
                      shape: BoxShape.circle,
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: size * 0.39, left: size * 0.75),
                  child: Container(
                    width: size * 0.15,
                    height: size * 0.15,
                    decoration: new BoxDecoration(
                      color: widget.color,
                      shape: BoxShape.circle,
                    ),
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(top: size * 0.39, right: size * 0.75),
                  child: Container(
                    width: size * 0.15,
                    height: size * 0.15,
                    decoration: new BoxDecoration(
                      color: widget.color,
                      shape: BoxShape.circle,
                    ),
                  )),
              Container(
                width: size * 0.86,
                height: size * 0.86,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: size * 0.01,
                    color: widget.color.withOpacity(0.5),
                  ),
                ),
              ),
            ])));
  }

  Widget octogonSlice(double angle, double size, double lap) {
    if (angle > 360.0) angle -= 360;

    double opacity = 1.0 - ((lap % 360).toDouble() / 360.0);

    return Transform.rotate(
        angle: (pi / 180.0) * angle,
        child: ClipPath(
            clipper: OctagonLoaderShape(),
            child: Container(
              width: size,
              height: size,
              decoration: new BoxDecoration(
                color: widget.color.withOpacity(opacity),
              ),
            )));
  }

  Widget sawSlice(double angle, double size, double lap) {
    if (angle > 360.0) angle -= 360;

    double opacity = 1.0 - ((lap % 360).toDouble() / 360.0);

    return Transform.rotate(
        angle: (pi / 180.0) * angle,
        child: ClipPath(
            clipper: SawLoaderShape(),
            child: Container(
              width: size,
              height: size,
              decoration: new BoxDecoration(
                color: widget.color.withOpacity(opacity),
              ),
            )));
  }

  Widget gearPiece(double angle, double size, Color color) {
    if (angle > 360.0) angle -= 360;

    return Stack(alignment: AlignmentDirectional.center, children: [
      Transform.rotate(
          angle: (pi / 180.0) * angle,
          child: ClipPath(
              clipper: GearLoaderShape(),
              child: Container(
                width: size,
                height: size,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              ))),
      Transform.rotate(
          angle: (pi / 180.0) * (angle + 120.0),
          child: ClipPath(
              clipper: GearLoaderShape(),
              child: Container(
                width: size,
                height: size,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              ))),
      Transform.rotate(
          angle: (pi / 180.0) * (angle + 240.0),
          child: ClipPath(
              clipper: GearLoaderShape(),
              child: Container(
                width: size,
                height: size,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              ))),
      Container(
        width: size * 0.75,
        height: size * 0.75,
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(
                Radius.elliptical(size * 0.75, size * 0.75)),
            border: Border.all(color: color, width: size * 0.10)),
      ),
      Container(
        width: size * 0.5,
        height: size * 0.5,
        decoration: new BoxDecoration(
            borderRadius:
                new BorderRadius.all(Radius.elliptical(size * 0.5, size * 0.5)),
            border: Border.all(color: color, width: size * 0.07)),
      ),
      Container(
        width: size * 0.3,
        height: size * 0.3,
        decoration: new BoxDecoration(
          borderRadius:
              new BorderRadius.all(Radius.elliptical(size * 0.55, size * 0.55)),
          color: color,
        ),
      )
    ]);
  }

  Widget hourglassFormat(double frame, double size, Color color) {
    double pos = min(frame / 500.0, 1.0);

    if (frame > 1000.0) frame -= 1000.0;

    return Stack(alignment: AlignmentDirectional.center, children: [
      ClipPath(
          clipper: HourglassLoaderShape(),
          child: Container(
            width: size,
            height: size,
            decoration: new BoxDecoration(
              color: color,
            ),
          )),
      ClipRect(
          child: Align(
              alignment: Alignment.center,
              widthFactor: 1.0,
              heightFactor: 0.44 * (1.0 - pos),
              child: ClipPath(
                  clipper: HourglassSandLoaderShape(),
                  child: Container(
                    width: size,
                    height: size,
                    decoration: new BoxDecoration(
                      color: color,
                    ),
                  )))),
      Transform.rotate(
        angle: (pi / 180.0) * (180.0),
        child: Padding(
            padding: EdgeInsets.only(bottom: (size - size * pos) * 0.5),
            child: ClipPath(
                clipper: HourglassSandLoaderShape(),
                child: Container(
                  width: size * pos,
                  height: size * pos,
                  decoration: new BoxDecoration(
                    color: color,
                  ),
                ))),
      ),
    ]);
  }

  Widget pulseWave(double pos, double size) {
    double intensity = ((pos + frame) % 1000.0) / 1000.0;

    return Container(
      width: size * intensity,
      height: size * intensity,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: size * 0.02,
          color: widget.color.withOpacity(1.0 - intensity),
        ),
      ),
    );
  }

  Widget pokeballIcon(double size) {
    return Transform.rotate(
        angle: (pi / 180.0) * frame,
        child: Stack(alignment: AlignmentDirectional.center, children: [
          ClipPath(
              clipper: HalfCircleShape(),
              child: Container(
                width: size,
                height: size,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    border: Border.all(
                      color: Colors.black,
                      width: 6.0,
                    )),
              )),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationX(pi),
            child: ClipPath(
                clipper: HalfCircleShape(),
                child: Container(
                  width: size,
                  height: size,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white12,
                      border: Border.all(
                        color: Colors.black,
                        width: 6.0,
                      )),
                )),
          ),
          Padding(
              padding: EdgeInsets.only(),
              child: Container(
                width: size - 6.0,
                height: 6.0,
                color: Colors.black,
              )),
          Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
          ),
          Container(
            width: 18.0,
            height: 18.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black54,
            ),
          ),
        ]));
  }

  Widget getCircleLoadingWidget(double size) {
    return Container(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        color: widget.color,
      ),
    );
  }

  Widget getCircleXLoadingWidget(double size) {
    double angle = (frame / 1000.0) * 360.0;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        circleSlice(angle + 0.0, size),
        circleSlice(angle + 90.0, size),
        circleSlice(angle + 180.0, size),
        circleSlice(angle + 270.0, size),
        Container(
          width: size * 0.6,
          height: size * 0.6,
          decoration: new BoxDecoration(
            color: widget.color.withOpacity(0.75),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  Widget getIconXLoadingWidget(double size) {
    double angle = (frame / 1000.0) * 360.0;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        circleSlice(angle + 0.0, size),
        circleSlice(angle + 90.0, size),
        circleSlice(angle + 180.0, size),
        circleSlice(angle + 270.0, size),
        Container(
          width: size * 0.6,
          height: size * 0.6,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: size * 0.05,
              color: widget.color.withOpacity(0.8),
            ),
          ),
        ),
        widget.icon != null
            ? Icon(
                widget.icon,
                color: widget.color.withOpacity(0.8),
                size: size * 0.4,
              )
            : SizedBox(),
      ],
    );
  }

  Widget getDotsLoadingWidget(double size) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: size / 3.0,
            child: Center(child: circleDots(0.0, size)),
          ),
          SizedBox(
            width: size / 3.0,
            child: Center(child: circleDots(1.0, size)),
          ),
          SizedBox(
            width: size / 3.0,
            child: Center(child: circleDots(2.0, size)),
          ),
        ],
      ),
    );
  }

  Widget getBarsLoadingWidget(double size) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: size * 0.120,
            child: Center(child: rectBars(7.0, size)),
          ),
          SizedBox(width: size * 0.005),
          SizedBox(
            width: size * 0.120,
            child: Center(child: rectBars(6.0, size)),
          ),
          SizedBox(width: size * 0.005),
          SizedBox(
            width: size * 0.120,
            child: Center(child: rectBars(5.0, size)),
          ),
          SizedBox(width: size * 0.005),
          SizedBox(
            width: size * 0.120,
            child: Center(child: rectBars(4.0, size)),
          ),
          SizedBox(width: size * 0.005),
          SizedBox(
            width: size * 0.120,
            child: Center(child: rectBars(3.0, size)),
          ),
          SizedBox(width: size * 0.005),
          SizedBox(
            width: size * 0.120,
            child: Center(child: rectBars(2.0, size)),
          ),
          SizedBox(width: size * 0.005),
          SizedBox(
            width: size * 0.120,
            child: Center(child: rectBars(1.0, size)),
          ),
          SizedBox(width: size * 0.005),
          SizedBox(
            width: size * 0.120,
            child: Center(child: rectBars(0.0, size)),
          ),
        ],
      ),
    );
  }

  Widget getGridLoadingWidget(double size) {
    double quadSize = size * 0.25;

    return Stack(alignment: AlignmentDirectional.center, children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: quadSize,
                  height: quadSize,
                  child: Center(child: rectGrid(0.6, quadSize)),
                ),
                SizedBox(
                  width: quadSize,
                  height: quadSize,
                  child: Center(child: rectGrid(0.5, quadSize)),
                ),
                SizedBox(
                  width: quadSize,
                  height: quadSize,
                  child: Center(child: rectGrid(0.4, quadSize)),
                ),
                SizedBox(
                  width: quadSize,
                  height: quadSize,
                  child: Center(child: rectGrid(0.3, quadSize)),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: quadSize,
                  height: quadSize,
                  child: Center(child: rectGrid(0.5, quadSize)),
                ),
                SizedBox(
                  width: quadSize,
                  height: quadSize,
                  child: widget.icon == null
                      ? Center(child: rectGrid(0.4, quadSize))
                      : SizedBox(),
                ),
                SizedBox(
                  width: quadSize,
                  height: quadSize,
                  child: widget.icon == null
                      ? Center(child: rectGrid(0.3, quadSize))
                      : SizedBox(),
                ),
                SizedBox(
                  width: quadSize,
                  height: quadSize,
                  child: Center(child: rectGrid(0.2, quadSize)),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: quadSize,
                  height: quadSize,
                  child: Center(child: rectGrid(0.4, quadSize)),
                ),
                SizedBox(
                  width: quadSize,
                  height: quadSize,
                  child: widget.icon == null
                      ? Center(child: rectGrid(0.3, quadSize))
                      : SizedBox(),
                ),
                SizedBox(
                  width: quadSize,
                  height: quadSize,
                  child: widget.icon == null
                      ? Center(child: rectGrid(0.2, quadSize))
                      : SizedBox(),
                ),
                SizedBox(
                  width: quadSize,
                  height: quadSize,
                  child: Center(child: rectGrid(0.1, quadSize)),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: quadSize,
                  height: quadSize,
                  child: Center(child: rectGrid(0.3, quadSize)),
                ),
                SizedBox(
                  width: quadSize,
                  height: quadSize,
                  child: Center(child: rectGrid(0.2, quadSize)),
                ),
                SizedBox(
                  width: quadSize,
                  height: quadSize,
                  child: Center(child: rectGrid(0.1, quadSize)),
                ),
                SizedBox(
                  width: quadSize,
                  height: quadSize,
                  child: Center(child: rectGrid(0.0, quadSize)),
                ),
              ],
            ),
          ]),
      widget.icon != null
          ? Icon(
              widget.icon,
              color: widget.color,
              size: size * 0.45,
            )
          : SizedBox(),
    ]);
  }

  Widget getOrbitLoadingWidget(double size) {
    double angle = (frame / 1000.0) * 360.0;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        circlesOrbit(angle, size),
        circlesOrbit(-angle, size * 0.65),
        widget.icon != null
            ? Icon(
                widget.icon,
                color: widget.color,
                size: size * 0.4,
              )
            : SizedBox(),
      ],
    );
  }

  Widget getOctagonLoadingWidget(double size) {
    double angle = (frame / 1000.0) * 360.0;
    double lap = (frame / 1000.0) * 720.0;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        octogonSlice(angle + 0.0, size, lap + 0.0),
        octogonSlice(angle + 45.0, size, lap + 45.0),
        octogonSlice(angle + 90.0, size, lap + 90.0),
        octogonSlice(angle + 135.0, size, lap + 135.0),
        octogonSlice(angle + 180.0, size, lap + 180.0),
        octogonSlice(angle + 225.0, size, lap + 225.0),
        octogonSlice(angle + 270.0, size, lap + 270.0),
        octogonSlice(angle + 315.0, size, lap + 315.0),
        widget.icon != null
            ? Icon(
                widget.icon,
                color: widget.color.withOpacity(
                    ((lap % 360).toDouble() - 180.0).abs() / 180.0),
                size: size * 0.4,
              )
            : SizedBox(),
      ],
    );
  }

  Widget getSawLoadingWidget(double size) {
    double angle = (frame / 1000.0) * 360.0;
    double lap = (frame / 1000.0) * 720.0;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        sawSlice(angle + 0.0, size, lap + 0.0),
        sawSlice(angle + 45.0, size, lap + 45.0),
        sawSlice(angle + 90.0, size, lap + 90.0),
        sawSlice(angle + 135.0, size, lap + 135.0),
        sawSlice(angle + 180.0, size, lap + 180.0),
        sawSlice(angle + 225.0, size, lap + 225.0),
        sawSlice(angle + 270.0, size, lap + 270.0),
        sawSlice(angle + 315.0, size, lap + 315.0),
        widget.icon != null
            ? Icon(
                widget.icon,
                color: widget.color.withOpacity(
                    ((lap % 360).toDouble() - 180.0).abs() / 180.0),
                size: size * 0.4,
              )
            : SizedBox(),
      ],
    );
  }

  Widget getCoinLoadingWidget(double size) {
    double angle = (frame / 1000.0) * 360.0;

    return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(((pi / 180.0) * (angle + 90.0)) *
              2.0 *
              (angle >= 90.0 && angle < 270.0 ? 1.0 : 0.0))
          ..rotateY((pi / 180.0) *
              (angle + 90.0) *
              2.0 *
              (angle < 90.0 || angle >= 270.0 ? 1.0 : 0.0)),
        alignment: Alignment.center,
        transformHitTests: false,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: size,
              height: size,
              decoration: new BoxDecoration(
                  borderRadius:
                      new BorderRadius.all(Radius.elliptical(size, size)),
                  border: Border.all(color: widget.color, width: size * 0.01)),
            ),
            widget.icon != null
                ? Container(
                    width: size * 0.65,
                    height: size * 0.65,
                    child: Icon(
                      widget.icon,
                      color: widget.color,
                      size: size * 0.65,
                    ))
                : SizedBox(),
          ],
        ));
  }

  Widget getGearLoadingWidget(double size) {
    double angle = (frame / 1000.0) * 360.0;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        gearPiece(angle + 0.0, size, widget.color),
      ],
    );
  }

  Widget getGearsLoadingWidget(double size) {
    double angle = (frame / 1000.0) * 360.0;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: size * 0.26, top: size * 0.33),
          child: gearPiece(angle, size * 0.65, widget.color),
        ),
        Padding(
          padding: EdgeInsets.only(left: size * 0.45, bottom: size * 0.46),
          child: gearPiece(-angle, size * 0.5, widget.color),
        ),
      ],
    );
  }

  Widget getHourglassLoadingWidget(double size) {
    double rotation =
        sin(frame > 500.0 ? ((frame - 500.0) / 500.0) * 1.70 : 0.0);

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Transform.rotate(
          angle: (pi / 180.0) * (180.0 * rotation),
          child: hourglassFormat(frame, size, widget.color),
        )
      ],
    );
  }

  Widget getPulseLoadingWidget(double size) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Center(child: pulseWave(0.0, size)),
        Center(child: pulseWave(500.0, size)),
      ],
    );
  }

  @override
  void initState() {
    if (timer == null) {
      timer =
          new Timer.periodic(const Duration(milliseconds: 20), (Timer _timer) {
        setState(() {
          frame += widget.speed;
          if (frame > 1000.0) frame -= 1000.0;
        });
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double size = widget.size != null
          ? widget.size!
          : min(constraints.maxWidth, constraints.maxHeight);
      double decreasedSize = widget.text != null ? size * 0.75 : size;
      Widget child = SizedBox();

      switch (widget.loadingFormat) {
        case (LoadingFormat.Circle):
          child = getCircleLoadingWidget(decreasedSize);
          break;

        case (LoadingFormat.CircleX):
          child = getCircleXLoadingWidget(decreasedSize);
          break;

        case (LoadingFormat.IconX):
          child = getIconXLoadingWidget(decreasedSize);
          break;

        case (LoadingFormat.Dots):
          child = getDotsLoadingWidget(decreasedSize);
          break;

        case (LoadingFormat.Bars):
          child = getBarsLoadingWidget(decreasedSize);
          break;

        case (LoadingFormat.Grid):
          child = getGridLoadingWidget(decreasedSize);
          break;

        case (LoadingFormat.Orbit):
          child = getOrbitLoadingWidget(decreasedSize);
          break;

        case (LoadingFormat.Octagon):
          child = getOctagonLoadingWidget(decreasedSize);
          break;

        case (LoadingFormat.Saw):
          child = getSawLoadingWidget(decreasedSize);
          break;

        case (LoadingFormat.Coin):
          child = getCoinLoadingWidget(decreasedSize);
          break;

        case (LoadingFormat.Gear):
          child = getGearLoadingWidget(decreasedSize);
          break;

        case (LoadingFormat.Gears):
          child = getGearsLoadingWidget(decreasedSize);
          break;

        case (LoadingFormat.Hourglass):
          child = getHourglassLoadingWidget(decreasedSize);
          break;

        case (LoadingFormat.Pulse):
          child = getPulseLoadingWidget(decreasedSize);
          break;

        case (LoadingFormat.Pokeball):
          child = pokeballIcon(decreasedSize);
          break;

        default:
          break;
      }

      return Container(
          width: size,
          height: size,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    width: decreasedSize, height: decreasedSize, child: child),
                widget.text != null
                    ? Padding(
                        padding: EdgeInsets.all(size * 0.02),
                        child: Text(widget.text!,
                            style: TextStyle(
                                fontSize: size * 0.15,
                                color: widget.color.withOpacity(
                                    (frame - 500.0).abs() / 500.0))))
                    : SizedBox(),
              ]));
    });
  }
}
