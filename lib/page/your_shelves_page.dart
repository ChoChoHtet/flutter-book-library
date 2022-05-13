import 'package:book_library/bloc/shelf_bloc.dart';
import 'package:book_library/page/create_shelves_page.dart';
import 'package:book_library/page/detail_shelve_page.dart';
import 'package:book_library/resource/dimen.dart';
import 'package:book_library/viewItems/item_shelve_view.dart';
import 'package:book_library/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/vos/shelf_vo.dart';

class YourShelvesPage extends StatefulWidget {
  const YourShelvesPage({Key? key}) : super(key: key);

  @override
  State<YourShelvesPage> createState() => _YourShelvesPageState();
}

class _YourShelvesPageState extends State<YourShelvesPage> {
  ShelfBloc? shelfBloc;
  @override
  void initState() {
    super.initState();
    shelfBloc = ShelfBloc();
  }

  @override
  void dispose() {
    super.dispose();
    shelfBloc?.clearDisposeNotify();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => shelfBloc,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                child: Selector<ShelfBloc, List<ShelfVO>>(
                  selector: (context, bloc) => bloc.shelfList,
                  builder: (context, shelfList, child) => ListView.builder(
                    itemCount: shelfList.isNotEmpty ? shelfList.length : 1,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => shelfList.isNotEmpty
                        ? Column(
                            children: [
                              InkWell(
                                  onTap: () => _navigateDetailShelveScreen(
                                      context,
                                      "10 International Design Books to Read",
                                      3),
                                  child:  ItemShelveView(
                                    shelfName: shelfList[index].name ?? "",
                                    bookNo: shelfList[index].bookNo ?? 0,
                                  )),
                              const Divider(
                                height: 2,
                                color: Colors.black87,
                              ),
                            ],
                          )
                        : const Center(
                            child: NormalText(
                              text: 'No Created Shelf',
                            ),
                          ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: paddingNormal),
                child: CreateNewButton(
                  onTapCreate: () {
                    debugPrint("On Tap Create");
                    _navigateCreateShelveScreen(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _navigateCreateShelveScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateShelvesPage(),
      ),
    );
  }

  void _navigateDetailShelveScreen(
      BuildContext context, String shelveName, int noOfBook) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailShelvePage(
          shelvesName: shelveName,
          noOfBooks: noOfBook,
        ),
      ),
    );
  }
}

class CreateNewButton extends StatelessWidget {
  final VoidCallback onTapCreate;
  const CreateNewButton({Key? key, required this.onTapCreate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.48,
      height: MediaQuery.of(context).size.height * 0.07,
      child: GestureDetector(
        onTap: onTapCreate,
        child: Card(
          color: Colors.blueAccent,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.edit,
                  size: normalIconSize,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 16,
                ),
                NormalText(
                  text: "Create New",
                  color: Colors.white,
                  textSize: mediumTextSize,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
