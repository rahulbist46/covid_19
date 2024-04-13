part of 'countries_bloc.dart';

sealed class CountriesState extends Equatable {
  const CountriesState();
  @override
  List<Object> get props => [];
}

final class CountriesInitial extends CountriesState {}
final class CountriesLoading extends CountriesState {}
final class CountriesSuccess extends CountriesState {
  final List <CountriesModal> countriesModal;

  const CountriesSuccess(this.countriesModal);

  @override
  List<Object> get props => [countriesModal];
}

class CountriesError extends CountriesState {
  const CountriesError(this.casesTimeError);

  final dynamic casesTimeError;

  @override
  List<Object> get props => [casesTimeError];
}
