import 'package:book_library/resource/string.dart';
import 'package:book_library/widgets/custom_icon_view.dart';
import 'package:flutter/material.dart';


class PlayBookItemView extends StatelessWidget {
  const PlayBookItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Container(
          width: 350,
          height: 300,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: NetworkImage(imgUrl), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomIconView(image: "assets/earphone.png"),
                        CustomIconView(image: "assets/done.png")
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const LinearProgressIndicator(
                      backgroundColor: Colors.black87,
                      valueColor:  AlwaysStoppedAnimation<Color>(Colors.white),
                      value: 0.1,
                    )
                  ],
                ),
              ),

            ],
          )),
    );
  }
}


