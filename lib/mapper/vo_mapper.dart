abstract class VOMapper<FROM,TO>{
  TO map(FROM object);
  List<TO> mapList(List<FROM> object ){
    return object.map((value) => map(value)).toList();
  }
}