import 'package:book_library/data/model/book_model.dart';
import 'package:book_library/data/model/impl/book_model_impl.dart';
import 'package:flutter/foundation.dart';

import '../data/vos/book_vo.dart';

class LibraryBloc extends ChangeNotifier{ 
  final BookModel _bookModel = BookModelImpl();
  List<BookVO> get visitedBookList => _bookList;
  List<BookVO> _bookList = [];
  
  LibraryBloc(){
    _bookModel.getVisitedBookFromDB().listen((event) { 
      _bookList = event;
      notifyListeners();
    }).onError((error){
      debugPrint("Library Visited Book Error:$error");
    });
  }
}