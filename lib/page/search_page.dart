import 'package:book_library/resource/dimen.dart';
import 'package:book_library/widgets/custom_search_view.dart';
import 'package:book_library/widgets/search_bar_view.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          toolbarHeight: 70,
          iconTheme: const IconThemeData(color: Colors.grey),
          titleSpacing: 0,
          title:Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children:  [
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
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                            hintText: "Search Play Books"
                        ),
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
              const Divider(thickness: 1,)
            ],
          )),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.show_chart,color: Colors.blue,),
            title: Text("Top Selling"),
          ),
          ListTile(
            leading: Icon(Icons.new_releases_outlined,color: Colors.blue,),
            title: Text("New releases",),
          ),
          ListTile(
            leading: Icon(Icons.store_outlined,color: Colors.blue,),
            title: Text("Bookshop"),
          )
        ],
      ),
    );
  }
}
