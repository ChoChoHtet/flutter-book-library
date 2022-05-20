import 'package:book_library/bloc/detail_shelf_bloc.dart';
import 'package:book_library/resource/dimen.dart';
import 'package:book_library/resource/string.dart';
import 'package:book_library/utils/action_enum.dart';
import 'package:book_library/widgets/custom_back_icon_view.dart';
import 'package:book_library/widgets/normal_text.dart';
import 'package:book_library/widgets/sort_and_list_menu_view.dart';
import 'package:book_library/widgets/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_shelf_page.dart';
import 'detail_book_page.dart';

class DetailShelvePage extends StatefulWidget {
  const DetailShelvePage({
    Key? key,
    required this.shelfId,
    required this.index,
  }) : super(key: key);
  final String shelfId;
  final int index;

  @override
  State<DetailShelvePage> createState() => _DetailShelvePageState();
}

class _DetailShelvePageState extends State<DetailShelvePage> {
  int _result = 1;
  int selectedSortBy = 1;
  /* ShelfAction actionShelf = ShelfAction.none;
  String? editedShelfName = "";*/

  DetailShelfBloc? detailShelfBloc;
  @override
  void initState() {
    super.initState();
    detailShelfBloc = DetailShelfBloc(widget.shelfId);
  }

  @override
  void dispose() {
    super.dispose();
    detailShelfBloc?.clearDisposeNotify();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => detailShelfBloc,
      child: Scaffold(
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    floating: true,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    leading: CustomBackIconView(
                      onTapBack: () => Navigator.pop(context),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: paddingNormal),
                        child: InkWell(
                          onTap: () {
                            debugPrint("On Tap Vertical Menu");
                            var shelfController = _showShelveMenu(context);
                            shelfController.then((value) {
                              if (value == ShelfAction.delete) {
                                /* detailShelfBloc?.deleteShelf(widget.shelfId);
                                Navigator.pop(context);*/
                                _showDeleteShelfDialog(context,
                                    detailShelfBloc?.shelfItem?.name ?? "");
                              }
                            });
                          },
                          child: const Icon(
                            Icons.more_vert,
                            size: normalIconSize,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
            body: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Consumer<DetailShelfBloc>(
                builder: (context, bloc, child) {
                  return ListView(
                    children: [
                      ShelfInfoAndEditView(
                        shelfName: bloc.shelfItem?.name ?? "",
                        bookNo: bloc.shelfItem?.bookNo ?? 0,
                        shelfAction: bloc.actionShelf,
                        onTapDoneEdit: (shelfName) {
                          debugPrint("Edited shelf name:$shelfName");
                          bloc.onTapDoneEdit(shelfName, widget.index);
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: paddingNormal),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 16, right: 16),
                        child: bloc.shelfItem?.books?.isNotEmpty ?? false
                            ? SortAndListMenuView(
                                bookList: bloc.bookList,
                                listType: _result,
                                sortByName: getSortTitle(selectedSortBy),
                                onTapSortBy: () {
                                  var sortByController = _showMenuSort(context);
                                  sortByController.then((value) {
                                  //  setState(() {});
                                    detailShelfBloc?.sortBy(selectedSortBy);
                                  });

                                },
                                onTapList: () {
                                  var bottomSheetController =
                                      _showMenuList(context);
                                  bottomSheetController.then(
                                    (value) {
                                      setState(() {});
                                    },
                                  );
                                },
                                onTapBook: (title) =>
                                    _navigateToBookDetailScreen(context, title),
                                onTapMenu: (title, imgPath, author) =>
                                    _showAddShelfMenuList(
                                        context, title, imgPath, author),
                              )
                            : const Center(
                                child: TitleText(title: "No Shelves."),
                              ),
                      ),
                    ],
                  );
                },
              ),
            )),
      ),
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

  void _navigateToBookDetailScreen(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailBookPage(
                title: title,
              )),
    );
  }

  _showDeleteShelfDialog(BuildContext context, String shelfName) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: TitleText(
                title: shelfName,
              ),
              content: const Text(contentShelfDelete),
              actions: [
                TextButton(
                  onPressed: () {
                    debugPrint("cancel button");
                    Navigator.of(context).pop();
                  },
                  child: const Text("CANCEL"),
                ),
                TextButton(
                  onPressed: () {
                    debugPrint("cancel button");
                    detailShelfBloc?.deleteShelf(widget.shelfId);
                    Navigator.of(context).pop();
                    Navigator.pop(context);
                  },
                  child: const Text("Delete"),
                ),
              ],
            ));
  }

  _showShelveMenu(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) => StatefulBuilder(builder: (context, setState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.25,
            padding: const EdgeInsets.only(top: margin1X),
            child: Wrap(
              children: [
                ListTile(
                  title: const NormalText(
                    text: "Rename shelf",
                    textSize: mediumTextSize,
                  ),
                  leading: const Icon(
                    Icons.edit,
                    size: normalIconSize,
                  ),
                  onTap: () {
                    //actionShelf = ShelfAction.edit;
                    detailShelfBloc?.onTapEditMenu();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const NormalText(
                    text: "Delete shelf",
                    textSize: mediumTextSize,
                  ),
                  leading: const Icon(
                    Icons.delete,
                    size: normalIconSize,
                  ),
                  onTap: () {
                    //actionShelf = ShelfAction.delete;
                    detailShelfBloc?.onTapDeleteMenu();
                    Navigator.pop(context, ShelfAction.delete);
                  },
                ),
              ],
            ),
          );
        }),
      );
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

  void _showAddShelfMenuList(
      BuildContext context, String title, String imgPath, String author) {
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
                              children: [
                                Text(
                                  title,
                                  style:
                                      const TextStyle(fontSize: mediumTextSize),
                                ),
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

class ShelfInfoAndEditView extends StatelessWidget {
  const ShelfInfoAndEditView({
    Key? key,
    required this.shelfName,
    required this.bookNo,
    required this.shelfAction,
    required this.onTapDoneEdit,
  }) : super(key: key);

  final ShelfAction shelfAction;
  final Function(String) onTapDoneEdit;
  final String shelfName;
  final int bookNo;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: shelfAction == ShelfAction.edit
          ? ShelfEditView(
              shelfName: shelfName,
              onTapDoneEdit: onTapDoneEdit,
            )
          : ShelfInfoView(
              shelfName: shelfName,
              bookNo: bookNo,
            ),
    );
  }
}

class ShelfEditView extends StatelessWidget {
  const ShelfEditView({
    Key? key,
    required this.onTapDoneEdit,
    required this.shelfName,
  }) : super(key: key);
  final String shelfName;
  final Function(String) onTapDoneEdit;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _shelfName =
        TextEditingController(text: shelfName);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: paddingNormal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (_shelfName.text.isNotEmpty) {
                onTapDoneEdit(_shelfName.text);
              } else {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  "Couldn't create this shelf",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              const Divider(),
                              const Padding(
                                padding: EdgeInsets.all(16),
                                child: NormalText(text: "Enter a shelf name"),
                              ),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                child: ElevatedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("OK")),
                              )
                            ],
                          ),
                        ));
              }
            },
            child: const Icon(
              Icons.done,
              size: normalIconSize,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _shelfName,
            decoration: const InputDecoration(
                labelText: "Shelf name",
                labelStyle:
                    TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
          )
        ],
      ),
    );
  }
}

class ShelfInfoView extends StatelessWidget {
  const ShelfInfoView({
    Key? key,
    required this.shelfName,
    required this.bookNo,
  }) : super(key: key);

  final String shelfName;
  final int bookNo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
          child: Text(
            shelfName,
            style: const TextStyle(
              fontSize: largeTextSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
          child: NormalText(
            text: "$bookNo Book(s)",
            textSize: normalTextSize,
          ),
        ),
      ],
    );
  }
}
