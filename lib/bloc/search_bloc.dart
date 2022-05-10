import 'package:book_library/data/model/impl/booK_google_model_impl.dart';
import 'package:book_library/data/model/impl/book_google_model.dart';
import 'package:book_library/data/vos/book_vo.dart';
import 'package:flutter/foundation.dart';

class SearchBloc extends ChangeNotifier{
  final BookGoogleModel _model = BookGoogleModelImpl();
  List<BookVO> get suggestionList => _suggestionList;

  List<BookVO> _suggestionList = [];

  SearchBloc();

  void getSearchSuggestion(String query){
    _model.getSearchSuggestions(query)
        .then((value){
          _suggestionList = value;
          debugPrint("Suggestion list: ${_suggestionList.length}");
          notifyListeners();
    });
  }
}