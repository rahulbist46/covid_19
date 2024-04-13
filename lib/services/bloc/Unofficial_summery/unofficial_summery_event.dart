part of 'unofficial_summery_bloc.dart';


sealed class UnofficialSummeryEvent extends Equatable{
  const UnofficialSummeryEvent();


  @override
  List<Object> get props => <Object>[];
}

class UnofficialSummeryData extends UnofficialSummeryEvent{}
class UnofficialSummeryReset extends UnofficialSummeryEvent{}
