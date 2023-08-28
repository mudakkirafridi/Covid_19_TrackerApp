import 'package:coronavirus_tracker_app/model/Worldstatesmodel.dart';
import 'package:coronavirus_tracker_app/screens/countries_list.dart';
// import 'package:coronavirus_tracker_app/services/utilities/app_uri.dart';
import 'package:coronavirus_tracker_app/services/utilities/state_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class Worldstates extends StatefulWidget {
  const Worldstates({super.key});

  @override
  State<Worldstates> createState() => _WorldstatesState();
}

class _WorldstatesState extends State<Worldstates>
    with TickerProviderStateMixin {
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
  Widget build(BuildContext context) {
    Stateservices stateservices = Stateservices();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            FutureBuilder(
                future: stateservices.worldstaterecored(),
                builder: (context, AsyncSnapshot<worldStatesModel> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                        flex: 1,
                        child: SpinKitCircle(
                          color: const Color.fromARGB(255, 238, 4, 4),
                          size: 50.0,
                          controller: _controller,
                        ));
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            'total': double.parse(
                                snapshot.data!.critical.toString()),
                            'recovered': double.parse(
                                snapshot.data!.recovered.toString()),
                            'death':
                                double.parse(snapshot.data!.deaths.toString()),
                          },
                          chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true),
                          chartRadius: MediaQuery.of(context).size.width / 3.0,
                          animationDuration: Duration(seconds: 2),
                          chartType: ChartType.disc,
                          legendOptions: LegendOptions(
                              legendPosition: LegendPosition.left),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * .06),
                          child: Card(
                            child: Column(
                              children: [
                                reusablerow(
                                    title: 'Total',
                                    value: snapshot.data!.cases.toString()),
                                reusablerow(
                                    title: 'Deaths',
                                    value: snapshot.data!.deaths.toString()),
                                reusablerow(
                                    title: 'Recovered',
                                    value: snapshot.data!.recovered.toString()),
                                reusablerow(
                                    title: 'Active',
                                    value: snapshot.data!.active.toString()),
                                reusablerow(
                                    title: 'Critical',
                                    value: snapshot.data!.critical.toString()),
                                reusablerow(
                                    title: 'Today Deaths',
                                    value:
                                        snapshot.data!.todayDeaths.toString()),
                                reusablerow(
                                    title: 'Today Recovered',
                                    value: snapshot.data!.todayRecovered
                                        .toString()),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const countrieslist()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 33, 15, 224),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Text('Track Country'),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                }),
          ],
        ),
      )),
    );
  }
}

// ignore: must_be_immutable
class reusablerow extends StatelessWidget {
  String title, value;
  reusablerow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
