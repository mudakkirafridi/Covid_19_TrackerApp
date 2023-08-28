import 'package:coronavirus_tracker_app/screens/world_states.dart';
import 'package:flutter/material.dart';

class detailspage extends StatefulWidget {
  String name, image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  detailspage({
    required this.name,
    required this.image,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  });

  @override
  State<detailspage> createState() => _detailspageState();
}

class _detailspageState extends State<detailspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                      ),
                      reusablerow(
                          title: 'cases', value: widget.totalCases.toString()),
                      reusablerow(
                          title: 'Recovered',
                          value: widget.totalRecovered.toString()),
                      reusablerow(
                          title: 'Deaths',
                          value: widget.totalDeaths.toString()),
                      reusablerow(
                          title: 'Critical', value: widget.critical.toString()),
                      reusablerow(
                          title: 'Today recovered',
                          value: widget.todayRecovered.toString()),
                      reusablerow(
                          title: 'cases', value: widget.totalCases.toString()),
                      reusablerow(
                          title: 'cases', value: widget.totalCases.toString()),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 120),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
