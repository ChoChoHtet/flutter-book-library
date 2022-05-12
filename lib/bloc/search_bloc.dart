import 'package:book_library/data/model/impl/booK_google_model_impl.dart';
import 'package:book_library/data/model/impl/book_google_model.dart';
import 'package:book_library/data/vos/book_vo.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class SearchBloc extends ChangeNotifier {
  final BookGoogleModel _model = BookGoogleModelImpl();
  List<BookVO> get suggestionList => _suggestionList;
  Map<String?, List<BookVO>> get searchResultList => _searchResultList;
  bool shouldShowResult = false;

  Map<String?, List<BookVO>> _searchResultList = {};
  List<BookVO> _suggestionList = [];

  SearchBloc();

  void getSearchSuggestion(String query) {
    _model.getSearchSuggestions(query).then((value) {
      value.sort((a, b) => a.title
          .toString()
          .toLowerCase()
          .compareTo(b.title.toString().toLowerCase()));
      _suggestionList = value;
      debugPrint("Suggestion list: ${_suggestionList.length}");
      shouldShowResult = false;
      notifyListeners();
    });
  }

  void getSearchResultGroup(String query) {
    debugPrint("result query: $query");
    _model.getSearchSuggestions(query).then((value) {
     value.sort((a, b) => a.title
          .toString()
          .toLowerCase()
          .compareTo(b.title.toString().toLowerCase()));
      var groupData = groupBy(value, (BookVO obj) => obj.categories);
      _searchResultList = groupData;
      shouldShowResult = true;
      debugPrint("_searchResultList key: ${_searchResultList.keys}");
      debugPrint("_searchResultList key: ${_searchResultList.values}");
      notifyListeners();
    });
  }
}
