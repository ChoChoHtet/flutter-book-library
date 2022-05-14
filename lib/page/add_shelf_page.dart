import 'package:book_library/bloc/add_shelf_bloc.dart';
import 'package:book_library/data/vos/shelf_vo.dart';
import 'package:book_library/resource/dimen.dart';
import 'package:book_library/viewItems/item_shelve_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddShelfPage extends StatefulWidget {
  const AddShelfPage({
    Key? key,
    required this.bookTitle,
  }) : super(key: key);
  final String bookTitle;

  @override
  State<AddShelfPage> createState() => _AddShelfPageState();
}

class _AddShelfPageState extends State<AddShelfPage> {
  AddShelfBloc? addShelfBloc;

  @override
  void initState() {
    super.initState();
    addShelfBloc = AddShelfBloc();
  }

  @override
  void dispose() {
    super.dispose();
    addShelfBloc?.clearDisposeNotify();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => addShelfBloc,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
                size: normalIconSize,
                color: Colors.black54,
              ),
            ),
          ),
          body: Selector<AddShelfBloc, List<ShelfVO>>(
            selector: (context, bloc) => bloc.shelfList,
            builder: (context, shelfList, child) => ListView.builder(
                itemCount: shelfList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      addShelfBloc?.addBookToShelves(widget.bookTitle, index);
                    },
                    child: ItemShelveView(
                        shelfName: shelfList[index].name ?? "",
                        bookNo: shelfList[index].bookNo ?? 0),
                  );
                }),
          )),
    );
  }
}
