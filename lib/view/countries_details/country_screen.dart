import 'package:covid_tracker/repositories/countries/countries_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/bloc/countries_bloc/countries_bloc.dart';
part 'Country_search_bar.dart';
part 'Countries_List.dart';
class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  late CountriesBloc countriesBloc;

  @override
  void initState() {
    super.initState();
    countriesBloc = context.read<CountriesBloc>();

    if (countriesBloc.state is! CountriesBloc) {
      countriesBloc.add(FetchCountries());
    }

  }
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
             children: [
               SearchBar(),
               SizedBox(height: 30,),
               CountriesList(),
             ],
           ),
        ),
      ),
    );
  }
}
