import 'package:book_library/resource/dimen.dart';
import 'package:book_library/widgets/custom_vertical_divider.dart';
import 'package:book_library/widgets/sort_and_list_menu_view.dart';
import 'package:flutter/material.dart';

class YourBookPage extends StatefulWidget {
  const YourBookPage({Key? key}) : super(key: key);

  @override
  State<YourBookPage> createState() => _YourBookPageState();
}

class _YourBookPageState extends State<YourBookPage> {
  bool chipBook = false;
  bool chipDownload = false;
  bool chipPurchase = false;
  bool chipClose = false;
  int _result = 1;
  int selectedSortBy = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 50,
                      child: ChoiceChip(
                        label: Icon(
                          Icons.close,
                          color: chipClose ? Colors.white : Colors.black87,
                        ),
                        backgroundColor: Colors.white,
                        labelPadding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(
                              color: Colors.black12, width: chipClose ? 0 : 1),
                        ),
                        selected: chipClose,
                        selectedColor: Colors.blueAccent,
                        onSelected: (select) {
                          setState(() {
                            chipClose = !chipClose;
                            chipBook = false;
                            chipPurchase = false;
                            chipDownload = false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: paddingNormal,
                    ),
                    ChoiceChip(
                      label: Text(
                        "Ebooks",
                        style: TextStyle(
                          color: chipBook ? Colors.white : Colors.black87,
                        ),
                      ),
                      labelPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      backgroundColor: Colors.white,
                      selected: chipBook,
                      selectedColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            color: Colors.black12, width: chipBook ? 0 : 1),
                      ),
                      onSelected: (select) {
                        setState(() {
                          chipBook = !chipBook;
                          chipClose = false;
                        });
                      },
                    ),
                    const SizedBox(
                      width: paddingNormal,
                    ),
                    ChoiceChip(
                      label: SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                "Purchases",
                                style: TextStyle(
                                    color: chipPurchase
                                        ? Colors.white
                                        : Colors.black87),
                              ),
                            ),
                            CustomVerticalDivider(
                              height: 18,
                              color:
                                  chipPurchase ? Colors.white : Colors.black87,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Samples",
                                style: TextStyle(
                                    color: chipPurchase
                                        ? Colors.white
                                        : Colors.black87),
                              ),
                            ),
                          ],
                        ),
                      ),
                      backgroundColor: Colors.white,
                      labelPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            color: Colors.black12, width: chipPurchase ? 0 : 1),
                      ),
                      selected: chipPurchase,
                      selectedColor: Colors.blueAccent,
                      onSelected: (select) {
                        setState(() {
                          chipPurchase = !chipPurchase;
                          chipClose = false;
                        });
                      },
                    ),
                    const SizedBox(
                      width: paddingNormal,
                    ),
                    ChoiceChip(
                      label: Text(
                        "Download",
                        style: TextStyle(
                            color:
                                chipDownload ? Colors.white : Colors.black87),
                      ),
                      labelPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            color: Colors.black12, width: chipDownload ? 0 : 1),
                      ),
                      selected: chipDownload,
                      selectedColor: Colors.blueAccent,
                      onSelected: (select) {
                        setState(() {
                          chipDownload = !chipDownload;
                          chipClose = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              SortAndListMenuView(
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
                  }),
            ],
          ),
        ),
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
