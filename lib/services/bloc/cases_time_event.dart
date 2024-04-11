part of 'cases_time_bloc.dart';

@immutable
sealed class CasesTimeEvent extends Equatable{
  const CasesTimeEvent();

  List<Object> get props => <Object>[];
}


class CaseTimeFetchData extends CasesTimeEvent{}
class CaseTimeReset extends CasesTimeEvent{}
