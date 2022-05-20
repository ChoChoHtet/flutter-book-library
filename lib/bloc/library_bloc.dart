import 'package:book_library/data/model/book_model.dart';
import 'package:book_library/data/model/impl/book_model_impl.dart';
import 'package:book_library/data/vos/category_chip_vo.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import '../data/vos/book_vo.dart';

class LibraryBloc extends ChangeNotifier {
  final BookModel _bookModel = BookModelImpl();

  List<BookVO> _bookList = [];
  List<CategoryChipVO> _categoriesList = [];
  List<BookVO> _bookTempList = [];

  bool isDisposed = false;
  List<BookVO> get visitedBookList => _bookList;
  List<CategoryChipVO> get categoryList => _categoriesList;
  bool isRefresh = false;
  bool isShowClearChip = false;


  LibraryBloc() {
    _bookModel.getVisitedBookFromDB().listen((event) {
      _bookTempList = event;
      event.sort((a, b) => a.visitedDateTime?.compareTo(b.visitedDateTime ?? -1) ?? 0);
      _bookList = event.reversed.toList();
      categoriesName(event);
      safeNotifyListener();
    }).onError((error) {
      debugPrint("Library Visited Book Error:$error");
    });
  }
  void categoriesName(List<BookVO> bookList) {
    isShowClearChip = false;
    List<CategoryChipVO> categories = [];
    for (var element in bookList) {
      // debugPrint("CategoriesName: ${element.categories}");
      if (element.categories != null && element.categories!.isNotEmpty) {
        categories
            .add(CategoryChipVO(name: element.categories, isSelected: false));
      }
    }
    _categoriesList = categories.toSet().toList();
    // debugPrint("CategoriesList:${_categoriesList.toString()}");
  }

  void onTapCategory(int curIndex) {
    List<CategoryChipVO> categories =
        _categoriesList.mapIndexed((index, element) {
      if (curIndex == index) {
        element.isSelected = !(element.isSelected ?? false);
      }
      return element;
    }).toList();
    categories.sort((a, b) => b.isSelected == true ? 1 : -1);
    _categoriesList = categories;
    filterSelectedCategory(categories);
    safeNotifyListener();
  }

  void filterSelectedCategory(List<CategoryChipVO> categoryList) async {
    List<CategoryChipVO> selected =
        categoryList.where((element) => element.isSelected == true).toList();
    isShowClearChip = selected.isNotEmpty;
    if(selected.isNotEmpty){
      _bookList = await filterBooks(selected);
    }else{
      _bookList = _bookTempList;
    }

  }

  Future<List<BookVO>> filterBooks(List<CategoryChipVO> selected) {
    List<BookVO> tempList = List.empty(growable: true);
    for (var element in selected) {
      for (var book in _bookTempList) {
       // debugPrint("Book ${book.categories},element: ${element.name}");
        if (book.categories == element.name) {
          tempList.add(book);
        }
      }
    }
    debugPrint("tempList: ${tempList.length},selected: ${selected.length}");
    return Future.value(tempList);
  }

  void onTapClear() {
    List<CategoryChipVO> categories =
        _categoriesList.mapIndexed((index, element) {
      element.isSelected = false;
      return element;
    }).toList();
    _categoriesList = categories;
    _bookList = _bookTempList;
    isShowClearChip = false;
    safeNotifyListener();
  }

  void sortBy(int sortType) {
    switch (sortType) {
      case 1:
        _bookList.sort((a, b) => a.visitedDateTime?.compareTo(b.visitedDateTime ?? -1) ?? 0);
       List<BookVO> temp = _bookList.reversed.toList();
        _bookList = temp;
        break;
      case 2:
        _bookList.sort((a, b) => a.title
            .toString()
            .toLowerCase()
            .compareTo(b.title.toString().toLowerCase()));
       // List<BookVO> temp = _bookList.reversed.toList();
       // _bookList = temp;
        break;
      case 3:
        _bookList.sort((a, b) => a.author
            .toString()
            .toLowerCase()
            .compareTo(b.author.toString().toLowerCase()));
       // List<BookVO> temp = _bookList.reversed.toList();
       // _bookList = temp;
        break;
    }
    safeNotifyListener();
  }

  void safeNotifyListener() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  void clearDisposeNotify() {
    if (!isDisposed) {
      isDisposed = true;
    }
  }
}
