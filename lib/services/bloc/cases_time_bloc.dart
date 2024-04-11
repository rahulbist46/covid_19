import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_tracker/repositories/CasesTimeSeries/cases_time_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cases_time_event.dart';
part 'cases_time_state.dart';

class CasesTimeBloc extends Bloc<CasesTimeEvent, CasesTimeState> {
  final CasesTimeSeriesRepository casesTimeSeriesRepository = CasesTimeSeriesRepository();

  CasesTimeBloc() : super(CasesTimeInitial()) {
    on<CasesTimeEvent>(handler);
  }

  Future<void> handler(CasesTimeEvent event, Emitter<CasesTimeState> emit) async {
    if (event is CaseTimeFetchData) {
      await caseTimeFetchData(emit);
    } else if (event is CaseTimeReset) {
      emit(CasesTimeInitial());
    }
  }

  Future<void> caseTimeFetchData(Emitter<CasesTimeState> emit) async {
    emit(CasesTimeLoading());
    try {
      final CasesTimeSeriesModal casesTimeSeriesModal = await casesTimeSeriesRepository
          .fetchCasesTimeSeries();
      emit(CasesTimeSuccess(casesTimeSeriesModal));
    } catch (e) {
      emit(CasesTimeError(e));
    }
  }
}
