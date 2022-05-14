import 'package:book_library/bloc/library_bloc.dart';
import 'package:book_library/data/vos/category_chip_vo.dart';
import 'package:book_library/resource/dimen.dart';
import 'package:book_library/widgets/sort_and_list_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resource/string.dart';
import '../widgets/normal_text.dart';
import 'add_shelf_page.dart';
import 'detail_book_page.dart';

class YourBookPage extends StatefulWidget {
  const YourBookPage({Key? key}) : super(key: key);

  @override
  State<YourBookPage> createState() => _YourBookPageState();
}

class _YourBookPageState extends State<YourBookPage> {
  LibraryBloc? libraryBloc;
  bool chipBook = false;
  bool chipDownload = false;
  bool chipPurchase = false;
  bool chipClose = false;
  int _result = 1;
  int selectedSortBy = 1;

  @override
  void initState() {
    super.initState();
    libraryBloc = LibraryBloc();
  }

  @override
  void dispose() {
    super.dispose();
    libraryBloc?.clearDisposeNotify();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => libraryBloc,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 16, top: 20),
          child: SingleChildScrollView(
            child: Consumer<LibraryBloc>(
              builder: (context, bloc, child) => Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: bloc.isShowClearChip ? 50 : 0,
                          child: Visibility(
                            visible: bloc.isShowClearChip,
                            child: ClearChipView(
                                chipClose: chipClose,
                                onSelectChip: (value) {
                                  bloc.onTapClear();
                                }),
                          ),
                        ),
                        const SizedBox(width: paddingNormal),
                        ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: paddingNormal),
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: bloc.categoryList.length,
                          itemBuilder: (context, index) => CategoryChipView(
                              category: bloc.categoryList[index],
                              onSelectCategoryChip: (value) {
                                bloc.onTapCategory(index);
                                //debugPrint("On Tap Chip");
                              }),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  SortAndListMenuView(
                    bookList: bloc.visitedBookList,
                    listType: _result,
                    sortByName: getSortTitle(selectedSortBy),
                    onTapSortBy: () {
                      var sortByController = _showMenuSort(context);
                      sortByController.then((value) {
                        libraryBloc?.sortBy(selectedSortBy);
                      });
                    },
                    onTapList: () {
                      var bottomSheetController = _showMenuList(context);
                      bottomSheetController.then((value) {
                        setState(() {});
                      });
                    },
                    onTapBook: (title) =>_navigateToBookDetailScreen(context, title),
                    onTapMenu: (title,imgPath,author) => _showAddShelfMenuList(context, title, imgPath, author),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _navigateToBookDetailScreen(BuildContext context,String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  DetailBookPage(title: title,)),
    );
  }
  String getSortTitle(int result) {
    var text = "";
    switch (result) {
      case 1:
        text = "Recent";
        break;
      case 2:
        text = "Title";
        break;
      case 3:
        text = "Author";
        break;
      default:
        text = "Recent";
        break;
    }
    return text;
  }

  _showMenuList(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) => StatefulBuilder(builder: (context, setState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.36,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(
                        top: 16, bottom: 16, left: 16, right: 16),
                    child: Text(
                      "List Menu",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
                const Divider(
                  thickness: 1,
                ),
                Wrap(
                  children: [
                    ListTile(
                      title: const Text("List"),
                      leading: Radio(
                        value: 1,
                        groupValue: _result,
                        onChanged: (int? result) {
                          setState(() {
                            _result = result!;
                            Navigator.pop(context, _result);
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("Two Grid"),
                      leading: Radio(
                        value: 2,
                        groupValue: _result,
                        onChanged: (int? result) {
                          setState(() {
                            debugPrint("radio click: $result");
                            _result = result!;
                            Navigator.pop(context, _result);
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("Three Grid"),
                      leading: Radio(
                        value: 3,
                        groupValue: _result,
                        onChanged: (int? result) {
                          setState(() {
                            _result = result!;
                            Navigator.pop(context, _result);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      );
  _showMenuSort(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) => StatefulBuilder(builder: (context, setState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.36,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(
                        top: 16, bottom: 16, left: 16, right: 16),
                    child: Text(
                      "Sort by",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
                const Divider(
                  thickness: 1,
                ),
                Wrap(
                  children: [
                    ListTile(
                      title: const Text("Recently opened"),
                      leading: Radio(
                        value: 1,
                        groupValue: selectedSortBy,
                        onChanged: (int? result) {
                          setState(() {
                            selectedSortBy = result!;
                            Navigator.pop(context, selectedSortBy);
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("Title"),
                      leading: Radio(
                        value: 2,
                        groupValue: selectedSortBy,
                        onChanged: (int? result) {
                          setState(() {
                            debugPrint("radio click: $result");
                            selectedSortBy = result!;
                            Navigator.pop(context, selectedSortBy);
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("Author"),
                      leading: Radio(
                        value: 3,
                        groupValue: selectedSortBy,
                        onChanged: (int? result) {
                          setState(() {
                            selectedSortBy = result!;
                            Navigator.pop(context, selectedSortBy);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      );
  void _navigateTAddShelfScreen(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddShelfPage(
            bookTitle: title,
          )),
    );
  }

  void _onTapMenuItem(String action, {String bookTitle = ""}) {
    //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("onTap Menu")),);
    debugPrint("on Tap Menu: $action");
    if (action == menuAddToShelf) {
      _navigateTAddShelfScreen(context, bookTitle);
    }
  }

  void _showAddShelfMenuList(BuildContext context, String title, String imgPath,String author) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 70,
                        height: 100,
                        child: Image.network(
                          imgPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: paddingNormal,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            NormalText(text:title),
                            NormalText(text: author),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Wrap(
                children: [
                  ListTile(
                    leading: const Icon(Icons.remove_circle_outline),
                    title: const NormalText(
                      text: menuRemoveDownload,
                    ),
                    onTap: () => _onTapMenuItem(menuRemoveDownload),
                  ),
                  ListTile(
                    leading: const Icon(Icons.delete),
                    title: const NormalText(
                      text: menuDeleteLibrary,
                    ),
                    onTap: () => _onTapMenuItem(menuDeleteLibrary),
                  ),
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const NormalText(
                      text: menuAddToShelf,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _onTapMenuItem(menuAddToShelf, bookTitle: title);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.book),
                    title: const NormalText(
                      text: menuAddThisBook,
                    ),
                    onTap: () => _onTapMenuItem(menuAddThisBook),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Buy SGD 10"),
                ),
              )
            ],
          ),
        ));
  }
}

class ClearChipView extends StatelessWidget {
  const ClearChipView({
    Key? key,
    required this.chipClose,
    required this.onSelectChip,
  }) : super(key: key);
  final bool chipClose;
  final Function(bool) onSelectChip;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Icon(
        Icons.close,
        color: chipClose ? Colors.white : Colors.black87,
      ),
      backgroundColor: Colors.white,
      labelPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: Colors.black12, width: chipClose ? 0 : 1),
      ),
      selected: chipClose,
      selectedColor: Colors.blueAccent,
      onSelected: (select) {
        onSelectChip(!chipClose);
      },
    );
  }
}

class CategoryChipView extends StatelessWidget {
  const CategoryChipView({
    Key? key,
    required this.category,
    required this.onSelectCategoryChip,
  }) : super(key: key);
  final CategoryChipVO category;
  final Function(bool) onSelectCategoryChip;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        category.name ?? "",
        style: TextStyle(
          color: category.isSelected ?? false ? Colors.white : Colors.black87,
        ),
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      backgroundColor: Colors.white,
      selected: category.isSelected ?? false,
      selectedColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
            color: Colors.black12, width: category.isSelected ?? false ? 0 : 1),
      ),
      onSelected: (select) {
        /* setState(() {
         chipBook = !chipBook;
         chipClose = false;
       });*/
        onSelectCategoryChip(!(category.isSelected ?? false));
      },
    );
  }
}
