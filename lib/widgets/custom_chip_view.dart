import 'package:flutter/material.dart';

class CustomChipView extends StatefulWidget {
  final String text;
  final bool isSelected;
  final int index;
  final Function(bool) onSelected;
  const CustomChipView({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.index,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<CustomChipView> createState() => _CustomChipViewState();
}

class _CustomChipViewState extends State<CustomChipView> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(widget.text),
      selected: widget.isSelected,
      onSelected: (selected) => widget.onSelected(selected)
    );
  }
}
