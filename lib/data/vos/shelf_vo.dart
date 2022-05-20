import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/persistence/hive_constant.dart';
import 'package:hive_flutter/adapters.dart';
part 'shelf_vo.g.dart';

@HiveType(typeId: kHiveShelfID, adapterName: "ShelfVOAdapter")
class ShelfVO {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  int? bookNo;

  @HiveField(3)
  List<BookVO>? books;

  @HiveField(4)
  int? createdDateTime;

  ShelfVO({
    this.id,
    this.name,
    this.bookNo,
    this.books,
    this.createdDateTime,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShelfVO &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          bookNo == other.bookNo &&
          books == other.books &&
          createdDateTime == other.createdDateTime;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      bookNo.hashCode ^
      books.hashCode ^
      createdDateTime.hashCode;
}
