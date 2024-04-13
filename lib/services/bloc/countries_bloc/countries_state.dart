part of 'countries_bloc.dart';

sealed class CountriesState extends Equatable {
  const CountriesState();
  @override
  List<Object> get props => [];
}

final class CountriesInitial extends CountriesState {}
final class CountriesLoading extends CountriesState {}
final class CountriesSuccess extends CountriesState {
  final List<CountriesModal> countriesModal;
  final List<CountriesModal> temCountriesModal;

  const CountriesSuccess(this.countriesModal, this.temCountriesModal);

  @override
  List<Object> get props => [countriesModal, temCountriesModal];
}


class CountriesError extends CountriesState {
  const CountriesError(this.casesTimeError);

  final dynamic casesTimeError;

  @override
  List<Object> get props => [casesTimeError];
}
