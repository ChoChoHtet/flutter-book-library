import 'package:book_library/page/detail_see_more_page.dart';
import 'package:book_library/resource/dimen.dart';
import 'package:book_library/widgets/horizontal_book_view.dart';
import 'package:book_library/widgets/normal_text.dart';
import 'package:book_library/widgets/title_text.dart';
import 'package:book_library/widgets/title_with_see_more_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../resource/string.dart';
import '../widgets/custom_vertical_divider.dart';

class DetailBookPage extends StatelessWidget {
  const DetailBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            floating: true,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                size: normalIconSize,
                color: Colors.black54,
              ),
            ),
            actions: const [
              Icon(
                Icons.search_sharp,
                size: normalIconSize,
                color: Colors.black54,
              ),
              Padding(
                padding: EdgeInsets.only(left: margin1X),
                child: Icon(
                  Icons.bookmark_add,
                  size: normalIconSize,
                  color: Colors.black54,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: margin1X),
                child: Icon(
                  Icons.more_vert,
                  size: normalIconSize,
                  color: Colors.black54,
                ),
              )
            ],
          )
        ],
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: paddingNormal),
          child: ListView(
            children: [
              const BookCoverAndTitleSection(),
              const SizedBox(height: margin1X),
              const BookRatingAndHourSection(),
              const SizedBox(height: margin1X),
              const PreviewAndBuyButtonView(),
              const SizedBox(height: margin1X),
              const SwitchToEbookButton(),
              const Divider(thickness: 1),
              const SizedBox(height: margin1X),
              const AboutThisBookSection(),
              const SizedBox(height: margin1X),
              const RatingAndReviewSection(),
              const SizedBox(height: margin1X),
              /*HorizontalBookView(
                title: "Continue the series",
                imgPath: imgUrl3,
                description: "Shadow Rider",
                author: "John san",
                onTapSeeMore: ()=> _navigateTSeeMoreScreen(context,"Continue the series"),
                onTapBook: () => _navigateToBookDetailScreen(context),
              ),
              const SizedBox(height: margin1X),
              HorizontalBookView(
                title: "More by Christine Feehan",
                imgPath: imgUrl3,
                description: "Shadow Rider",
                author: "John san",
                onTapSeeMore: ()=> _navigateTSeeMoreScreen(context,"More by Christine Feehan"),
                onTapBook: () => _navigateToBookDetailScreen(context),
              ),*/
              const SizedBox(height: margin1X),
              const WriteReviewSection(),
              const SizedBox(height: margin1X),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateTSeeMoreScreen(
      BuildContext context, String title, String date, int offset) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailSeeMorePage(
                title: title,
                date: date,
                offset: offset,
              )),
    );
  }

  void _navigateToBookDetailScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DetailBookPage()),
    );
  }
}

class WriteReviewSection extends StatelessWidget {
  const WriteReviewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(title: "Rate this eBook"),
        const SizedBox(height: 8),
        const NormalText(
          text: "Tell other what you think",
          color: Colors.black54,
        ),
        const SizedBox(height: margin1X),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              RatingBarIndicator(
                rating: 0,
                itemCount: 5,
                itemSize: 40,
                itemPadding: const EdgeInsets.symmetric(horizontal: 5),
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                ),
              ),
              const SizedBox(height: paddingNormal),
              OutlinedButton(
                onPressed: () => debugPrint("Write a review"),
                child: const Text("Write a review"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RatingAndReviewSection extends StatelessWidget {
  const RatingAndReviewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWithSeeMore(
          title: "Ratings and reviews",
          onTapSeeMore: () => debugPrint("onTap see more"),
        ),
        const SizedBox(height: margin1X),
        const RatingView(),
        const SizedBox(height: margin2X),
        const ReviewView(
          username: "Google User 1",
          profileUrl: imgUrl2,
          date: "4 May 2022",
          rating: 4.0,
        ),
        const ReviewView(
          username: "Elizabeth H",
          profileUrl: imgUrl3,
          date: "4 May 2022",
          rating: 2.0,
        ),
        const ReviewView(
          username: "Google user 2",
          profileUrl: imgUrl,
          date: "4 May 2022",
          rating: 5.0,
        )
      ],
    );
  }
}

class ReviewView extends StatelessWidget {
  const ReviewView(
      {Key? key,
      required this.username,
      required this.profileUrl,
      required this.date,
      required this.rating})
      : super(key: key);
  final String username;
  final String profileUrl;
  final String date;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(profileUrl),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.only(left: paddingNormal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NormalText(text: username),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: rating,
                    itemCount: 5,
                    itemSize: 18,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  NormalText(text: date),
                ],
              ),
              const SizedBox(height: 10),
              const TextWithMaxLineView(
                  text:
                      "You'll reflect, smile and feel the rollercoaster of emotions she has become known for bringing to life in the characters she plays."),
              const SizedBox(height: paddingNormal),
              const NormalText(text: "Was this review helpful ?"),
              const SizedBox(height: paddingNormal),
            ],
          ),
        )
      ],
    );
  }
}

class RatingView extends StatelessWidget {
  const RatingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const NormalText(
              text: "5.0",
              textSize: 50,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: smallPadding),
            RatingBarIndicator(
              rating: 5.0,
              itemCount: 5,
              itemSize: 18,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: smallPadding),
            const NormalText(
              text: "28 total",
              textSize: smallTextSize,
            )
          ],
        ),
        Column(
          children: const [
            RatingProgressBarView(
              ratingLevel: "5",
              percent: 0.9,
            ),
            SizedBox(
              height: 4,
            ),
            RatingProgressBarView(
              ratingLevel: "4",
              percent: 0.2,
            ),
            SizedBox(
              height: 4,
            ),
            RatingProgressBarView(
              ratingLevel: "3",
              percent: 0,
            ),
            SizedBox(
              height: 4,
            ),
            RatingProgressBarView(
              ratingLevel: "2",
              percent: 0,
            ),
            SizedBox(
              height: 4,
            ),
            RatingProgressBarView(
              ratingLevel: "1",
              percent: 0,
            )
          ],
        )
      ],
    );
  }
}

class AboutThisBookSection extends StatelessWidget {
  const AboutThisBookSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWithSeeMore(
          title: "About this ebook",
          onTapSeeMore: () => debugPrint("onTap see more"),
        ),
        const SizedBox(height: margin1X),
        const TextWithMaxLineView(
          text:
              "it’s clear from the first page that Davis is going to serve a more intimate, unpolished account than is typical of the average (often ghost-written) celebrity memoir; Finding Me reads like Davis is sitting you down for a one-on-one conversation about her life, warts and all.Enjoy a great reading experience when you buy the Kindle edition of this book. Learn more about Great on Kindle, available in select categories.",
        ),
      ],
    );
  }
}

class TextWithMaxLineView extends StatelessWidget {
  const TextWithMaxLineView({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: normalTextSize,
      ),
    );
  }
}

class RatingProgressBarView extends StatelessWidget {
  const RatingProgressBarView(
      {Key? key, required this.ratingLevel, required this.percent})
      : super(key: key);
  final String ratingLevel;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NormalText(text: ratingLevel),
        const SizedBox(
          width: 5,
        ),
        LinearPercentIndicator(
          width: MediaQuery.of(context).size.width * 0.6,
          lineHeight: 10,
          percent: percent,
          progressColor: Colors.blue,
          backgroundColor: Colors.grey[300],
          barRadius: const Radius.circular(10),
        ),
      ],
    );
  }
}

class SwitchToEbookButton extends StatelessWidget {
  const SwitchToEbookButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: TextButton(
          onPressed: () => debugPrint("On Tap switch book"),
          child: const Text(
            "Switch to the ebook",
            style: TextStyle(fontSize: normalTextSize),
          )),
    );
  }
}

class PreviewAndBuyButtonView extends StatelessWidget {
  const PreviewAndBuyButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => debugPrint("On Tap Preview"),
            icon: const Icon(Icons.play_arrow_outlined),
            label: const Text("Preview"),
          ),
        ),
        const SizedBox(
          width: marginSmall,
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () => debugPrint("On Tap Preview"),
            child: const Text("Buy \$16.19"),
          ),
        )
      ],
    );
  }
}

class BookRatingAndHourSection extends StatelessWidget {
  const BookRatingAndHourSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        RatingAndReviewView(),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
          child: CustomVerticalDivider(
            height: 30,
            color: Colors.black54,
          ),
        ),
        AudioBookView(),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 5),
          child: CustomVerticalDivider(
            height: 30,
            color: Colors.black54,
          ),
        ),
        BookHourView()
      ],
    );
  }
}

class BookHourView extends StatelessWidget {
  const BookHourView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        NormalText(
          text: "9 hr 15min",
          textSize: titleTextSize,
          color: Colors.black54,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: smallPadding,
        ),
        NormalText(
          text: "Unabridged",
          textSize: smallTextSize,
        ),
      ],
    );
  }
}

class AudioBookView extends StatelessWidget {
  const AudioBookView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(
          Icons.headset_outlined,
          color: Colors.black54,
          size: normalIconSize,
        ),
        SizedBox(
          height: smallPadding,
        ),
        NormalText(
          text: "28 reviews",
          textSize: smallTextSize,
        )
      ],
    );
  }
}

class RatingAndReviewView extends StatelessWidget {
  const RatingAndReviewView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text.rich(
          TextSpan(
              text: "5.0",
              style: TextStyle(
                  fontSize: titleTextSize,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
              children: [
                WidgetSpan(
                    child: SizedBox(
                  width: 8,
                )),
                WidgetSpan(
                  child: Icon(
                    Icons.star,
                    color: Colors.black54,
                  ),
                ),
              ]),
        ),
        SizedBox(
          height: smallPadding,
        ),
        NormalText(
          text: "28 reviews",
          textSize: smallTextSize,
        )
      ],
    );
  }
}

class BookCoverAndTitleSection extends StatelessWidget {
  const BookCoverAndTitleSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.13,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              imgUrl2,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: SizedBox(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Finding me: A Memoir",
                    style: TextStyle(
                      fontSize: largeTextSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  NormalText(text: "Viola Davis"),
                  NormalText(text: "Narrated by Viola Davis"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
