import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../repositories/countries/countries_repo.dart';


part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final CountriesRepository countriesRepository= CountriesRepository();

  CountriesBloc() : super(CountriesInitial()) {
    on<CountriesEvent>(handler) ;
  }

  Future<void>handler(CountriesEvent event,Emitter<CountriesState>emit )async{
    if(event is FetchCountries){
      await fetchCountries(emit);

    }else if(event is ResetCountries){
      emit (CountriesInitial());
    }
  }

  Future<void>fetchCountries(Emitter<CountriesState>emit)async{
    emit(CountriesLoading());
    try{

      final CountriesModal countriesModal = await countriesRepository.countriesDataFetch();
      emit(CountriesSuccess(countriesModal));
    } catch (e) {
      emit(CountriesError(e));
    }
  }
}
