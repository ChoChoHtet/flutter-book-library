import 'package:book_library/bloc/home_bloc.dart';
import 'package:book_library/bloc/search_bloc.dart';
import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/resource/dimen.dart';
import 'package:book_library/resource/string.dart';
import 'package:book_library/viewItems/item_book_view.dart';
import 'package:book_library/widgets/custom_search_view.dart';
import 'package:book_library/widgets/search_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchBloc(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          toolbarHeight: 70,
          iconTheme: const IconThemeData(color: Colors.grey),
          titleSpacing: 0,
          title: Builder(
            builder: (context) {
              return BookSearchView(
                onTextChanged: (query) {
                  var searchBloc = Provider.of<SearchBloc>(context,listen: false);
                  searchBloc.getSearchSuggestion(query);
                },
              );
            }
          ),
        ),
        body: ListView(
          children: [
            Selector<SearchBloc, List<BookVO>>(
              selector: (context, bloc) => bloc.suggestionList,
              builder: (context, bookList, child) => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: bookList.length,
                  itemBuilder: (context, index) {
                    return  ItemBookView(
                        imgPath: bookList[index].bookImage ?? "",
                        description: bookList[index].title ?? "",
                        author: bookList[index].author ?? "");
                  }),
            ),
            /*ListTile(
              leading: Icon(
                Icons.show_chart,
                color: Colors.blue,
              ),
              title: Text("Top Selling"),
            ),
            ListTile(
              leading: Icon(
                Icons.new_releases_outlined,
                color: Colors.blue,
              ),
              title: Text(
                "New releases",
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.store_outlined,
                color: Colors.blue,
              ),
              title: Text("Bookshop"),
            )*/
          ],
        ),
      ),
    );
  }
}

class BookSearchView extends StatelessWidget {
  const BookSearchView({
    Key? key,
    required this.onTextChanged,
  }) : super(key: key);
  final Function(String) onTextChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: normalIconSize,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.76,
                child: TextField(
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Search Play Books"),
                  onChanged: (value) {
                    debugPrint("On Change was called: $value");
                    onTextChanged(value);
                  },
                ),
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.mic,
                  size: normalIconSize,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}
