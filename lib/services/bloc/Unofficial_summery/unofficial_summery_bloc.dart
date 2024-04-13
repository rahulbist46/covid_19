import 'package:bloc/bloc.dart';
import 'package:covid_tracker/repositories/unofficial_summary/unofficial_summary_repo.dart';
import 'package:equatable/equatable.dart';

part 'unofficial_summery_event.dart';
part 'unofficial_summery_state.dart';

class UnofficialSummeryBloc extends Bloc<UnofficialSummeryEvent, UnofficialSummeryState> {
  final UnofficialSummaryRepo unofficialSummaryRepo = UnofficialSummaryRepo();

  UnofficialSummeryBloc() : super(UnofficialSummeryInitial()) {
    on<UnofficialSummeryEvent>(handler);
  }

  Future<void> handler(UnofficialSummeryEvent event, Emitter<UnofficialSummeryState> emit) async {
    if (event is UnofficialSummeryData) {
      await unofficialSummaryData(emit);
    } else if (event is UnofficialSummeryReset) {
      emit(UnofficialSummeryInitial());
    }
  }

  Future<void> unofficialSummaryData(Emitter<UnofficialSummeryState> emit) async {
    emit(UnofficialSummeryLoading());
    try {
      final UnofficialSummaryModal unofficialSummaryModal = await unofficialSummaryRepo.fetchUnofficialSummeryModal();
      emit(UnofficialSummerySuccess(unofficialSummaryModal));
    } catch (e) {
      emit(UnofficialSummeryError(e.toString()));
    }
  }
}
