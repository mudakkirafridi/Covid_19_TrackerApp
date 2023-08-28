import 'dart:async';
import 'dart:math' as math;
import 'package:coronavirus_tracker_app/screens/world_states.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<splashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Worldstates())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: _controller,
                  child: Container(
                    height: 200,
                    width: 200,
                    child:
                        Center(child: Image.asset('assets/images/virus.jpg')),
                  ),
                  builder: (BuildContext context, Widget? Child) {
                    return Transform.rotate(
                      angle: _controller.value * 2.0 * math.pi,
                      child: Child,
                    );
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "CoronaTrack\nApp",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
              )
            ]),
      ),
    );
  }
}
