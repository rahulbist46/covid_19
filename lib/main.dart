import 'package:covid_tracker/services/bloc/Case_time/cases_time_bloc.dart';
import 'package:covid_tracker/services/bloc/Unofficial_summery/unofficial_summery_bloc.dart';
import 'package:covid_tracker/services/bloc/countries_bloc/countries_bloc.dart';
import 'package:covid_tracker/services/cubit/theme_services.dart';
import 'package:covid_tracker/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CasesTimeBloc>(
          create: (context) => CasesTimeBloc(),
        ),
        BlocProvider<UnofficialSummeryBloc>(
          create: (context) => UnofficialSummeryBloc(),
        ),
        BlocProvider<CountriesBloc>(
          create: (context) => CountriesBloc(),
        ),
        BlocProvider<ThemeServices>(
          create: (context) => ThemeServices(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
