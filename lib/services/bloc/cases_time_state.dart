part of 'cases_time_bloc.dart';

@immutable
sealed class CasesTimeState  extends Equatable{
  const CasesTimeState();


  @override
  List<Object> get props => [];

}

class CasesTimeInitial extends CasesTimeState {}

class CasesTimeLoading extends CasesTimeState {}

class CasesTimeSuccess extends CasesTimeState {
  const CasesTimeSuccess(this.summaryModal);
  final SummaryModal summaryModal;

  @override
  List<Object> get props => [summaryModal];
}

class CasesTimeError extends CasesTimeState {
  CasesTimeError(this.casesTimeError);

  final dynamic casesTimeError;

  @override
  List<Object> get props => [casesTimeError];
}
