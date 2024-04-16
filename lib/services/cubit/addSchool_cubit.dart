import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class AddSchoolPageCubit extends Cubit<int> {
  AddSchoolPageCubit() : super(0);

  final PageController pageController = PageController();

  void forward() {
    if (state >= 3) return;
    pageController.animateToPage(state + 1,
        duration: const Duration(microseconds: 300), curve: Curves.ease);
    emit(state + 1);
  }

  void backward() {
    if (state >= 0) return;
    pageController.animateToPage(state - 1,
        duration: const Duration(microseconds: 150), curve: Curves.ease);
    emit(state - 1);
  }

  void reset() {
    pageController.jumpToPage(0);
    emit(0);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
