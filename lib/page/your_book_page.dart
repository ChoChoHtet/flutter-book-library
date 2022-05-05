import 'package:book_library/resource/dimen.dart';
import 'package:book_library/viewItems/item_book_library_view.dart';
import 'package:book_library/widgets/custom_chip_view.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
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
                      label:  Icon(Icons.close,color: chipClose ? Colors.white: Colors.black87,),
                      backgroundColor: Colors.white,
                      labelPadding: const EdgeInsets.symmetric(vertical: 6,horizontal: 7),
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
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
                          Container(
                            width: 1,
                            height: 18,
                            color: chipPurchase ? Colors.white :Colors.black87,
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
                    labelPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
                          color: chipDownload ? Colors.white : Colors.black87),
                    ),
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) => const ItemBookLibraryView(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) => const ItemBookLibraryView(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
