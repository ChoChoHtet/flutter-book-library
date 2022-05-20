import 'package:book_library/bloc/home_bloc.dart';
import 'package:book_library/data/vos/overview_vo.dart';
import 'package:book_library/page/audio_book_page.dart';
import 'package:book_library/page/e_book_page.dart';
import 'package:book_library/page/search_page.dart';
import 'package:book_library/resource/dimen.dart';
import 'package:book_library/resource/string.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/vos/book_vo.dart';
import '../viewItems/play_book_item_view.dart';
import '../widgets/normal_text.dart';
import '../widgets/search_bar_view.dart';
import 'add_shelf_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // final List<String> booksList = [imgUrl, imgUrl, imgUrl];

  final List<String> tabList = ["Ebooks,Audiobooks"];
  HomeBloc? homeBloc;

  @override
  void initState() {
    homeBloc = HomeBloc();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    homeBloc?.clearDisposeNotify();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return ChangeNotifierProvider(
      create: (context) => homeBloc,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          toolbarHeight: 70,
          iconTheme: const IconThemeData(color: Colors.grey),
          title: InkWell(
            onTap: () {
              _navigateTSearchScreen(context);
            },
            child: const SearchBarView(),
          ),
        ),
        body: NestedScrollView(
          key: const Key("Home_Scroll"),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Selector<HomeBloc, List<BookVO>>(
                      selector: (context, bloc) => bloc.visitedBookList,
                      builder: (context, bookList, child) => Visibility(
                        visible: bookList.isNotEmpty,
                        child: CarouselSlider.builder(
                          itemCount: bookList.length,
                          itemBuilder: (context, itemIndex, pageViewIndex) =>
                              PlayBookItemView(
                            title: bookList[itemIndex].title ?? "",
                            imgPath: bookList[itemIndex].bookImage ?? "",
                            onTapMenu: () => _showMenuList(
                                context,
                                bookList[itemIndex].title ?? "",
                                bookList[itemIndex].bookImage ?? ""),
                          ),
                          options: CarouselOptions(
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              viewportFraction: 0.6,
                              initialPage: 0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
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
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(controller: _tabController, children: [
            Selector<HomeBloc, List<OverviewVO>>(
                selector: (context, bloc) => bloc.overviewList,
                builder: (context, overviewList, child) =>
                    overviewList.isNotEmpty
                        ? EBookPage(
                            overviewList: overviewList,
                            onTapMenu: (title, imgPath) =>
                                _showMenuList(context, title, imgPath),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          )),
            const AudioBookPage(),
          ]),
        ),
      ),
    );
  }

  void _navigateTSearchScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchPage()),
    );
  }

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

  void _showMenuList(BuildContext context, String title, String imgPath) {
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
                                const NormalText(text: "Writer"),
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
