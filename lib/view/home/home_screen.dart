import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../services/bloc/Case_time/cases_time_bloc.dart';
import '../../services/bloc/Unofficial_summery/unofficial_summery_bloc.dart';
import 'bottom_button.dart';
import 'pie_chart.dart';
part'all_data.dart';
part'top row.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late CasesTimeBloc casesTimeBloc;
  late UnofficialSummeryBloc unofficialSummeryBloc;

  @override
  void initState() {
    super.initState();
    casesTimeBloc = context.read<CasesTimeBloc>();
    unofficialSummeryBloc = context.read<UnofficialSummeryBloc>();

    if (casesTimeBloc.state is! CasesTimeSuccess) {
      casesTimeBloc.add(CaseTimeFetchData());
    }
    if (unofficialSummeryBloc.state is! UnofficialSummerySuccess) {
      unofficialSummeryBloc.add(UnofficialSummeryData());
    }
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            const HomeTopRow(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
            const PieChartScreen(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
            const AllData(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
            const BottomButton(),
          ],
        ),
      ),
    );
  }
}
