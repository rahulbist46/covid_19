import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/bloc/countries_bloc/countries_bloc.dart';
import '../Details/countries_all_details.dart';
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
    countriesBloc = BlocProvider.of<CountriesBloc>(context);
    countriesBloc.add(FetchCountries());
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SearchBar(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
              const CountriesList(),
            ],
          ),
        ),
      ),
    );
  }
}