import 'package:book_library/resource/dimen.dart';
import 'package:book_library/resource/string.dart';
import 'package:book_library/widgets/normal_text.dart';
import 'package:flutter/material.dart';

class ItemShelveView extends StatelessWidget {
  const ItemShelveView({
    Key? key,
    required this.shelfName,
    required this.bookNo,
    required this.imgPath,
    required this.imgPath2,
  }) : super(key: key);
  final String shelfName;
  final int bookNo;
  final String imgPath;
  final String imgPath2;

  @override
  Widget build(BuildContext context) {
    debugPrint("1:$imgPath,2:$imgPath2");
    return Container(
      height: 90,
      margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 93,
            child: Stack(
              children: [
                Visibility(
                  visible: imgPath2.isNotEmpty,
                  child: Positioned(
                    top: 15,
                    right: 2,
                    left: 2,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: SizedBox(
                          width: 80,
                          height: 90,
                          child: Image.network(
                            imgPath,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: SizedBox(
                    width: 80,
                    height: 90,
                    child:  imgPath.isNotEmpty || imgPath2.isNotEmpty? Image.network(
                      imgPath2.isNotEmpty ? imgPath2 : imgPath,
                      fit: BoxFit.cover,
                    ):Image.asset("assets/empty.png"),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: 200,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      shelfName,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "$bookNo book(s)",
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: normalIconSize,
          ),
        ],
      ),
    );
  }
}
