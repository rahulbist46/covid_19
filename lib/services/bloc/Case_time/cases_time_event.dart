part of 'cases_time_bloc.dart';


sealed class CasesTimeEvent extends Equatable{
  const CasesTimeEvent();

  @override
  List<Object> get props => <Object>[];
}


class CaseTimeFetchData extends CasesTimeEvent{}

class CaseTimeReset extends CasesTimeEvent{}
