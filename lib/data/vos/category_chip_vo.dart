class CategoryChipVO {
  String? name;
  bool? isSelected = false;

  CategoryChipVO({
    this.name,
    this.isSelected,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryChipVO &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          isSelected == other.isSelected;

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode;

  @override
  String toString() {
    return 'CategoryChipVO{name: $name, isSelected: $isSelected}';
  }
}
