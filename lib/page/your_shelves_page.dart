

import 'package:book_library/page/create_shelves_page.dart';
import 'package:book_library/resource/dimen.dart';
import 'package:book_library/viewItems/item_shelve_view.dart';
import 'package:book_library/widgets/normal_text.dart';
import 'package:flutter/material.dart';

class YourShelvesPage extends StatelessWidget {
  const YourShelvesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Column(
                      children: const [
                        ItemShelveView(),
                        Divider(height: 2,color: Colors.black87,),
                      ],
                    )),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CreateNewButton(
                onTapCreate: () {
                  debugPrint("On Tap Create");
                  _navigateCreateShelveScreen(context);
                },
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
