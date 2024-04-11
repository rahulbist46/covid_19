import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../services/bloc/cases_time_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  void initState() {
    super.initState();
    context.read<CasesTimeBloc>().add(CaseTimeFetchData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocBuilder<CasesTimeBloc, CasesTimeState>(
            builder: (context, state) {
              if (state is CasesTimeLoading) {
                return SpinKitFadingCircle(
                  color: Colors.white,
                  size: 40,
                  controller: _controller,
                );
              } else if (state is CasesTimeSuccess) {
                final casesTimeModal = state.casesTimeSeriesModal;

                return Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    SpinKitFadingCircle(
                      color: Colors.white,
                      size: 50.0,
                      controller: _controller,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    PieChart(
                      dataMap: {
                        "Total": double.parse(casesTimeModal.totalconfirmed),
                        "Recovered": double.parse(casesTimeModal.totalrecovered),
                        "Deaths": double.parse(casesTimeModal.totaldeceased),
                      },
                      animationDuration: const Duration(milliseconds: 1200),
                      chartLegendSpacing: 32,
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      colorList: colorList,
                      initialAngleInDegree: 0,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 25,
                      legendOptions: const LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.left,
                        showLegends: true,
                        legendTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        showChartValuesInPercentage: true,
                        showChartValuesOutside: true,
                        decimalPlaces: 1,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.06),
                        child: Card(
                          child: Column(
                            children: [
                              ReusableRow(title: 'Daily Confirmed', value: casesTimeModal.dailyconfirmed),
                              ReusableRow(title: 'daily Deceased', value: casesTimeModal.dailydeceased),
                              ReusableRow(title: 'daily Recovered', value: casesTimeModal.dailyrecovered),
                              ReusableRow(title: 'Total Cases', value: casesTimeModal.totalconfirmed),
                              ReusableRow(title: 'Deaths', value: casesTimeModal.totaldeceased),
                              ReusableRow(title: 'Recovered', value: casesTimeModal.totalrecovered),

                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xff1aa260),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text('Track Countries'),
                        ),
                      ),
                    ),
                  ],
                );
              }
              // Handle other states if needed
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title;
  final String value;
  const ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const SizedBox(height: 5),
          const Divider(),
        ],
      ),
    );
  }
}

