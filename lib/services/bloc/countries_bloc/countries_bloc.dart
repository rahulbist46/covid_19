
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repositories/countries/countries_repo.dart';

part  'countries_event.dart';
part  'countries_state.dart';


class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final CountriesRepository countriesRepository = CountriesRepository();
  late List<CountriesModal> allCountries; // Store all countries for filtering

  CountriesBloc() : super(CountriesInitial()) {
    on<FetchCountries>(_handleFetchCountries);
    on<ResetCountries>(_handleResetCountries);
    on<CountriesSearchItem>(_handleCountriesSearchItem);
  }

  Future<void> _handleFetchCountries(FetchCountries event, Emitter<CountriesState> emit) async {
    emit(CountriesLoading());
    try {
      allCountries = await countriesRepository.countriesDataFetch();
      emit(CountriesSuccess(allCountries, allCountries));
    } catch (e) {
      emit(CountriesError(e.toString()));
    }
  }

  void _handleResetCountries(ResetCountries event, Emitter<CountriesState> emit) {
    emit(CountriesInitial());
  }

  void _handleCountriesSearchItem(CountriesSearchItem event, Emitter<CountriesState> emit) {
    final query = event.stSearch.toLowerCase();
    final filteredCountries = allCountries.where((country) => country.loc.toLowerCase().contains(query)).toList();
    emit(CountriesSuccess(filteredCountries, allCountries));
  }
}
