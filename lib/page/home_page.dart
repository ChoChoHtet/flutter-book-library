import 'package:book_library/page/audio_book_page.dart';
import 'package:book_library/page/e_book_page.dart';
import 'package:book_library/resource/dimen.dart';
import 'package:book_library/resource/string.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../viewItems/play_book_item_view.dart';
import '../widgets/search_bar_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<String> booksList = [imgUrl, imgUrl, imgUrl];
  final List<String> tabList = ["Ebooks,Audiobooks"];

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
      body: ListView(
        children: [
         const SizedBox(height: 30,),
          CarouselSlider.builder(
            itemCount: booksList.length,
            itemBuilder: (context, itemIndex, pageViewIndex) =>
                const PlayBookItemView(),
            options: CarouselOptions(
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.6,
                initialPage: 0),
          ),
          const SizedBox(
            height: 30,
          ),
          BookTabSection(tabList: tabList)
        ],
      ),
    );
  }
}

class BookTabSection extends StatefulWidget {
  const BookTabSection({
    Key? key,
    required this.tabList,
  }) : super(key: key);

  final List<String> tabList;

  @override
  State<BookTabSection> createState() => _BookTabSectionState();
}

class _BookTabSectionState extends State<BookTabSection>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Column(
      children: [
        TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.blueAccent,
            labelPadding: const EdgeInsets.symmetric(vertical: 10),
            indicatorWeight: 4,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const [
              Text(
                "Ebooks",
                style: TextStyle(fontSize: mediumTextSize),
              ),
              Text(
                "Audiobooks",
                style: TextStyle(fontSize: mediumTextSize),
              ),
            ]),
        const Divider(height: 1,thickness: 1,),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
              controller: _tabController,
              children: const [EBookPage(), AudioBookPage()]),
        ),
      ],
    );
  }
}
