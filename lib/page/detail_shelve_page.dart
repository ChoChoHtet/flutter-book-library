import 'package:book_library/resource/dimen.dart';
import 'package:book_library/utils/action_enum.dart';
import 'package:book_library/widgets/custom_back_icon_view.dart';
import 'package:book_library/widgets/normal_text.dart';
import 'package:book_library/widgets/sort_and_list_menu_view.dart';
import 'package:flutter/material.dart';

class DetailShelvePage extends StatefulWidget {
  const DetailShelvePage({
    Key? key,
    required this.shelvesName,
    required this.noOfBooks,
  }) : super(key: key);
  final String shelvesName;
  final int noOfBooks;

  @override
  State<DetailShelvePage> createState() => _DetailShelvePageState();
}

class _DetailShelvePageState extends State<DetailShelvePage> {
  int _result = 1;
  int selectedSortBy = 1;
  ShelfAction actionShelf = ShelfAction.none;
  String? editedShelfName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            setState(() {
                              debugPrint("shelf action: $actionShelf");
                              editedShelfName = value;
                            });
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
            child: ListView(
              children: [
                ShelfInfoAndEditView(
                  shelfName:
                      ShelfAction.done == actionShelf && editedShelfName != null
                          ? editedShelfName!
                          : widget.shelvesName,
                  bookNo: widget.noOfBooks,
                  shelfAction: actionShelf,
                  onTapDoneEdit: (shelfName) {
                    debugPrint("Edited shelf name:$shelfName");
                    setState(() {
                      actionShelf = ShelfAction.done;
                      editedShelfName = shelfName ;
                    });
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: paddingNormal),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: SortAndListMenuView(
                    listType: _result,
                    sortByName: getSortTitle(selectedSortBy),
                    onTapSortBy: () {
                      var sortByController = _showMenuSort(context);
                      sortByController.then((value) {
                        setState(() {});
                      });
                    },
                    onTapList: () {
                      var bottomSheetController = _showMenuList(context);
                      bottomSheetController.then((value) {
                        setState(() {});
                      });
                    },
                  ),
                ),
              ],
            ),
          )),
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

  _showShelveMenu(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) => StatefulBuilder(builder: (context, setState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
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
                    actionShelf = ShelfAction.edit;
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
                    actionShelf = ShelfAction.delete;
                    Navigator.pop(context);
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
  ShelfEditView({
    Key? key,
    required this.onTapDoneEdit,
  }) : super(key: key);

  final TextEditingController _shelfName = TextEditingController();
  final Function(String) onTapDoneEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  const EdgeInsets.symmetric(horizontal: paddingNormal),
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
                labelStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
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
