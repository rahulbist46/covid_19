import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../repositories/countries/countries_repo.dart';


part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final CountriesRepository countriesRepository = CountriesRepository();

  CountriesBloc() : super(CountriesInitial()) {
    on<FetchCountries>(_handleFetchCountries);
    on<ResetCountries>(_handleResetCountries);
  }

  Future<void> _handleFetchCountries(FetchCountries event, Emitter<CountriesState> emit) async {
    emit(CountriesLoading());
    try {
      final List<CountriesModal> countriesModal = await countriesRepository.countriesDataFetch();
      emit(CountriesSuccess(countriesModal));
    } catch (e) {
      emit(CountriesError(e.toString()));
    }
  }

  void _handleResetCountries(ResetCountries event, Emitter<CountriesState> emit) {
    emit(CountriesInitial());
  }
}

