import 'package:book_library/viewItems/item_book_library_view.dart';
import 'package:flutter/material.dart';

class YourBookPage extends StatelessWidget {
  const YourBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left:16,right: 16,top: 20),
      child: Column(
        children: [
          
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
    );
  }
}
