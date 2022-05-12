import 'package:book_library/data/model/book_model.dart';
import 'package:book_library/data/model/impl/book_model_impl.dart';
import 'package:book_library/data/vos/overview_vo.dart';
import 'package:flutter/foundation.dart';

import '../data/vos/book_vo.dart';

class HomeBloc extends ChangeNotifier {
  final BookModel _bookModel = BookModelImpl();

  List<OverviewVO> get overviewList => _overviewList;
  List<BookVO> get visitedBookList => _bookList;

  List<OverviewVO> _overviewList = [];
  List<BookVO> _bookList = [];

  bool isDisposed = false;

  HomeBloc() {
    _bookModel.getBooksOverview().then((value) {
      _overviewList = value;
      safeNotifyListener();
    });
    _bookModel.getVisitedBookFromDB().listen((event) {
      var reversedList = event.reversed;
      _bookList = reversedList.toList();
      safeNotifyListener();
    });
  }
  void safeNotifyListener(){
    if(!isDisposed){
      notifyListeners();
    }
  }
  void clearDisposeNotify(){
    if(!isDisposed){
      isDisposed = true;
    }
  }
}
