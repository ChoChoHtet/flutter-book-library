import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/data/vos/google_book_vo.dart';
import 'package:book_library/mapper/vo_mapper.dart';

class BookMapper extends VOMapper<GoogleBookVO, BookVO> {
  @override
  BookVO map(GoogleBookVO object) {
    return BookVO(
      title: object.volumeInfo?.title,
      description: object.volumeInfo?.description,
      author: object.volumeInfo?.authors?.join(","),
      publisher: object.volumeInfo?.publisher,
      createdDate: object.volumeInfo?.publishedDate,
      bookImage: object.volumeInfo?.imageLinks?.thumbnail,
      categories: object.volumeInfo?.categories,
    );
  }
}
