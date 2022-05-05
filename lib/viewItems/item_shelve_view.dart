import 'package:book_library/resource/dimen.dart';
import 'package:book_library/resource/string.dart';
import 'package:book_library/widgets/normal_text.dart';
import 'package:flutter/material.dart';

class ItemShelveView extends StatelessWidget {
  const ItemShelveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Positioned(
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
                        imgUrl,
                        fit: BoxFit.cover,
                      ),
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
                      child: Image.network(
                        imgUrl2,
                        fit: BoxFit.cover,
                      )),
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
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "10 International Design Books to Read",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "3 books",
                      style: TextStyle(
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
