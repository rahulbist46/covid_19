part of 'unofficial_summery_bloc.dart';

@immutable
sealed class UnofficialSummeryState extends Equatable{

  const UnofficialSummeryState();

  @override
  List<Object> get props=> [];
}

final class UnofficialSummeryInitial extends UnofficialSummeryState {}
final class UnofficialSummeryLoading extends UnofficialSummeryState {}
final class UnofficialSummerySuccess extends UnofficialSummeryState {

  final UnofficialSummaryModal unofficialSummaryModal;

  const UnofficialSummerySuccess(this.unofficialSummaryModal);

  @override
  List<Object>get props=> [];

}

 class UnofficialSummeryError extends UnofficialSummeryState{
   final dynamic unofficialSummeryError;

  const UnofficialSummeryError(this.unofficialSummeryError);

  @override
  List<Object> get props => [unofficialSummeryError];


}
