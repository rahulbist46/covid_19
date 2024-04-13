part of 'countries_bloc.dart';

sealed class CountriesEvent extends Equatable{
  const CountriesEvent();

  @override
  List<Object>get  props => [];

}

class FetchCountries extends CountriesEvent{}
class ResetCountries extends CountriesEvent{}
class CountriesSearchItem extends CountriesEvent{

  final  String stSearch;
  const CountriesSearchItem( this.stSearch);

}
