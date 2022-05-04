import 'package:book_library/resource/dimen.dart';
import 'package:book_library/widgets/normal_text.dart';
import 'package:flutter/material.dart';

class CreateShelvesPage extends StatelessWidget {
   CreateShelvesPage({Key? key}) : super(key: key);
  final   _shelfName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 200,
        child: Card(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                InkWell(
                  onTap: () {
                   if(_shelfName.text.isNotEmpty){
                     Navigator.pop(context);
                   }else {
                     showModalBottomSheet(
                         context: context,
                         builder: (context) => SizedBox(
                           height: MediaQuery.of(context).size.height *0.3,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               const Padding(
                                 padding:   EdgeInsets.all(16),
                                 child: Text(
                                   "Couldn't create this shelf",
                                   style: TextStyle(
                                       fontSize: 20,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.black),
                                 ),
                               ),
                               const Divider(),
                               const Padding(
                                 padding:  EdgeInsets.all(16),
                                 child: NormalText(text: "Enter a shelf name"),
                               ),
                               Container(
                                 width: double.infinity,
                                 padding:  const EdgeInsets.all(16),
                                 child: ElevatedButton(
                                     onPressed: () => Navigator.pop(context),
                                     child: const Text("OK")),
                               )
                             ],
                           ),
                         ));
                   }
                  },
                  child: const Icon(
                    Icons.done,
                    size: normalIconSize,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 TextField(
                  controller: _shelfName,
                  decoration: const InputDecoration(
                      labelText: "Shelf name",
                      labelStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
