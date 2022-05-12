// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookVOAdapter extends TypeAdapter<BookVO> {
  @override
  final int typeId = 1;

  @override
  BookVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookVO(
      title: fields[0] as String?,
      author: fields[1] as String?,
      description: fields[2] as String?,
      publisher: fields[3] as String?,
      contributor: fields[4] as String?,
      bookImage: fields[5] as String?,
      bookWidth: fields[6] as int?,
      bookHeight: fields[7] as int?,
      createdDate: fields[8] as String?,
      updatedDate: fields[9] as String?,
      rank: fields[10] as int?,
      categories: fields[11] as String?,
      visitedDateTime: fields[12] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, BookVO obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.publisher)
      ..writeByte(4)
      ..write(obj.contributor)
      ..writeByte(5)
      ..write(obj.bookImage)
      ..writeByte(6)
      ..write(obj.bookWidth)
      ..writeByte(7)
      ..write(obj.bookHeight)
      ..writeByte(8)
      ..write(obj.createdDate)
      ..writeByte(9)
      ..write(obj.updatedDate)
      ..writeByte(10)
      ..write(obj.rank)
      ..writeByte(11)
      ..write(obj.categories)
      ..writeByte(12)
      ..write(obj.visitedDateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookVO _$BookVOFromJson(Map<String, dynamic> json) => BookVO(
      title: json['title'] as String?,
      author: json['author'] as String?,
      description: json['description'] as String?,
      publisher: json['publisher'] as String?,
      contributor: json['contributor'] as String?,
      bookImage: json['book_image'] as String?,
      bookWidth: json['book_image_width'] as int?,
      bookHeight: json['book_image_height'] as int?,
      createdDate: json['created_date'] as String?,
      updatedDate: json['updated_date'] as String?,
      rank: json['rank'] as int?,
      categories: json['categories'] as String?,
      visitedDateTime: json['visitedDateTime'] as int?,
    );

Map<String, dynamic> _$BookVOToJson(BookVO instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'publisher': instance.publisher,
      'contributor': instance.contributor,
      'book_image': instance.bookImage,
      'book_image_width': instance.bookWidth,
      'book_image_height': instance.bookHeight,
      'created_date': instance.createdDate,
      'updated_date': instance.updatedDate,
      'rank': instance.rank,
      'categories': instance.categories,
      'visitedDateTime': instance.visitedDateTime,
    };
