


/*class BottomNavBarCubit extends Cubit<int>{
  BottomNavBarCubit() : super(0);

  final PageController  pageController = PageController();


void changeIndex(int index){


_hideKeyBoard();

if (state == index)return;
emit(index);
pageController.jumpToPage(index);
  }

  void changeIndexByPageView(int index)
  {
    _hideKeyBoard();

if (_checkIfShowLoginWarning(index))return;
if(state==index)return;
emit(index);
  }


  bool _checkIfShowLoginWarning(int index){
if (index ==2 && StorageServics.instance.isLoggedIn){
final BuildContext ?? contaxt =Keys.navigetorkey.currentContext;

if(context == null)return false;
Navigator.push(context, ModalBottomSheetRoute<dynamic>(builder: (_)=>LoginBottomSheet(),
    isScrollControlled: false,
    backgroundColor: Colors.transparent,
    isDismissible: true,
    enableDrag: true));
return true;
}
return false;
}

void _hideKeyBoard(){
final BuildContext? context = keys.NavigetorKey.currentContext;
if (context == null)return;
if (!isKeyBoardVisible(context))return;
focusScope.of(context).unfocus();

}

@override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}*/
