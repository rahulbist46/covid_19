import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../services/bloc/Case_time/cases_time_bloc.dart';

class PieChartScreen extends StatefulWidget {
  const PieChartScreen({super.key});

  @override
  PieChartScreenState createState() => PieChartScreenState();
}

class PieChartScreenState extends State<PieChartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CasesTimeBloc, CasesTimeState>(
      builder: (context, state) {
        if (state is CasesTimeLoading) {
          return const SpinKitFadingCircle(
            color: Colors.white,
            size: 40,
          );
        } else if (state is CasesTimeSuccess) {
          final summaryModal = state.summaryModal;

          return Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              const SpinKitFadingCircle(
                color: Colors.white,
                size: 50.0,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              PieChart(
                dataMap: {
                  "Total": summaryModal.total.toDouble(),
                  "Recovered": summaryModal.discharged.toDouble(),
                  "Deaths": summaryModal.deaths.toDouble(),
                },
                colorList: const [
                  Colors.blue,  // Total ke liye blue color
                  Colors.green, // Recovered ke liye green color
                  Colors.red,   // Deaths ke liye red color
                ],
                animationDuration: const Duration(milliseconds: 1200),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
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

            ],
          );
        }
        // Handle other states if needed
        return Container();
      },
    );
  }
}
