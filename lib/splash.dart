import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:foodgo/mainScreen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: .infinity,
          width: .infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
              colors: [Color(0xffFF929B), Color(0xffEF2A39)],
            ),
          ),
        ),
        Center(
          child: FadeInDown(child: Image.asset("assets/images/Foodgo.png")),
        ),
        Align(
          alignment: AlignmentGeometry.bottomLeft,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentGeometry.bottomLeft,
            children: [
              FadeInDown(
                child: Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/1.png"),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: -100,
                child: FadeInRight(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/2.png"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
