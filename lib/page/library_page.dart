
import 'package:book_library/page/your_book_page.dart';
import 'package:book_library/page/your_shelves_page.dart';
import 'package:book_library/resource/string.dart';
import 'package:flutter/material.dart';

import '../resource/dimen.dart';
import '../widgets/search_bar_view.dart';

class LibraryPage extends StatelessWidget{
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 70,
        iconTheme: const IconThemeData(color: Colors.grey),
        title: const SearchBarView(),
      ),
      body: const LibraryTabSection(),
    );
  }
}
class LibraryTabSection extends StatefulWidget {
  const LibraryTabSection({
    Key? key,
  }) : super(key: key);

  @override
  State<LibraryTabSection> createState() => _LibraryTabSectionState();
}

class _LibraryTabSectionState extends State<LibraryTabSection>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return ListView(
      children: [
        TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.black87,
          labelColor: Colors.blueAccent,
          labelPadding: const EdgeInsets.symmetric(vertical: 10),
          indicatorWeight: 4,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: const [
            Text(
              libraryTab1,
              style: TextStyle(fontSize: normalTextSize),
            ),
            Text(
              libraryTab2,
              style: TextStyle(fontSize: normalTextSize),
            ),
          ],
        ),
        const Divider(height: 1,thickness: 1,),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: TabBarView(
            controller: _tabController,
            children: const [
              YourBookPage(),
              YourShelvesPage(),
            ],
          ),
        )
      ],
    );
  }
}