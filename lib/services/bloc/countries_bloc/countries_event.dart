part of 'countries_bloc.dart';

@immutable
sealed class CountriesEvent extends Equatable{
  const CountriesEvent();

  @override
  List<Object>get  props => [];

}

class FetchCountries extends CountriesEvent{}
class ResetCountries extends CountriesEvent{}
