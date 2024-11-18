library alphabet_navigation;

import 'package:flutter/material.dart';

class AlphabetNavigation extends StatefulWidget {
  final List<String> stringList;
  final List<dynamic> dynamicList;

  final bool listDirectionLeft;

  final Color backgroundColor;
  final Color selectedColor;
  final Color unselectedColor;

  final bool circleSelectedLetter;
  final Color circleSelectedBackgroundColor;
  final double circleBorderRadius;

  final Function(BuildContext, int) itemBuilder;

  /// A Flutter package that provides a dynamic, scrollable list view with an alphabetical index.
  ///
  /// #### Params:
  /// * [stringList] List of strings (for mapping alphabet positions)
  /// * [dynamicList] List of dynamic data (actual data to be displayed)
  /// * [listDirectionLeft] Direction of the list. If true, the list will be from right to left (optional)
  /// * [backgroundColor] Background color (optional)
  /// * [selectedColor] Selected alphabet color (optional)
  /// * [unselectedColor] Unselected alphabet color (optional)
  /// * [circleSelectedLetter] Circle the selected letter (optional)
  /// * [circleSelectedBackgroundColor] Background color for the selected letter (optional)
  /// * [circleBorderRadius] Border radius for the selected letter circle (optional)
  /// * [itemBuilder] Item builder for dynamic list which returns a [Widget] for each item
  const AlphabetNavigation({
    Key? key,
    required this.stringList,
    required this.dynamicList,
    this.listDirectionLeft = false,
    this.backgroundColor = const Color(0xFF56A3A6),
    this.selectedColor = const Color(0xFF014D41),
    this.unselectedColor = const Color(0xFFF6FDFF),
    this.circleSelectedLetter = false,
    this.circleSelectedBackgroundColor = Colors.amberAccent,
    this.circleBorderRadius = 8,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  _AlphabetNavigationState createState() => _AlphabetNavigationState();
}

class _AlphabetNavigationState extends State<AlphabetNavigation> {
  late ScrollController _scrollController;
  final Map<String, int> _alphabetMap = {}; // Maps alphabet to list index
  String _selectedAlphabet = 'B'; // Default selected alphabet

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _generateAlphabetMap();
  }

  /// Generates a map of alphabet to list index for faster lookup
  /// during scrolling to an alphabet letter.
  void _generateAlphabetMap() {
    List<String> sortedList =
        widget.stringList.map((e) => e.toUpperCase()).toList();

    /// Sort by alphabet to ensure correct mapping
    sortedList.sort();

    for (int i = 0; i < sortedList.length; i++) {
      String firstLetter = sortedList[i][0];
      if (!_alphabetMap.containsKey(firstLetter)) {
        _alphabetMap[firstLetter] = i;
      }
    }

    _selectedAlphabet = sortedList[0];
  }

  /// Scrolls to the selected alphabet letter when an alphabet is selected.
  /// If the letter is not found in the alphabet map, no action is taken.
  void _scrollToLetter(String letter) {
    setState(() {
      /// Update selected alphabet
      _selectedAlphabet = letter;
    });

    int? index = _alphabetMap[letter];
    if (index != null) {
      double targetOffset = index * 60.0;
      double currentOffset = _scrollController.offset;

      /// Adjust duration based on distance, with smaller scaling
      double distance = (targetOffset - currentOffset).abs();
      int duration = (distance / 800).clamp(50, 200).toInt();

      _scrollController.animateTo(
        targetOffset,
        duration: Duration(milliseconds: duration),

        /// Constant speed
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.listDirectionLeft
        ? Row(
            children: [
              _alphabetList(leftMargin: 3, rightMargin: 0),
              _dynamicList(),
            ],
          )
        : Row(
            children: [
              _dynamicList(),
              _alphabetList(leftMargin: 0, rightMargin: 3),
            ],
          );
  }

  /// Builds the dynamic list view based on the widget's `dynamicList` property.
  /// This list is scrollable and the list items are generated using the
  /// `itemBuilder` property.
  Widget _dynamicList() {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.dynamicList.length,
        itemExtent: 60,
        itemBuilder: (context, index) {
          return widget.itemBuilder(context, index);
        },
      ),
    );
  }

  /// Builds the alphabet list view using the `backgroundColor`,
  /// `circleSelectedLetter`, and `circleSelectedBackgroundColor` properties.
  /// This list is scrollable and the list items are generated using the
  /// `normalAlphaList` and `circleAlphaList` functions.
  Widget _alphabetList(
      {required double leftMargin, required double rightMargin}) {
    return Container(
      margin: EdgeInsets.only(
        left: leftMargin,
        right: rightMargin,
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _alphabetMap.keys.map((letter) {
            return GestureDetector(
              onTap: () => _scrollToLetter(letter),
              child: widget.circleSelectedLetter
                  ? _circleAlphaList(letter)
                  : _normalAlphaList(letter),
            );
          }).toList(),
        ),
      ),
    );
  }

  /// Builds the circle alpha list view using the `circleSelectedBackgroundColor`,
  /// `circleBorderRadius`, and `selectedColor` properties.
  /// This list is scrollable and the list items are generated using the
  /// `Text` widget.
  Widget _circleAlphaList(String letter) {
    return Container(
      height: 30,
      width: 30,
      margin: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      decoration: BoxDecoration(
        color: _selectedAlphabet == letter
            ? widget.circleSelectedBackgroundColor
            : Colors.transparent,
        borderRadius: BorderRadius.circular(widget.circleBorderRadius),
      ),
      child: Text(
        letter,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: _selectedAlphabet == letter
              ? widget.selectedColor
              : widget.unselectedColor,
        ),
      ),
    );
  }

  /// Builds the normal alpha list view using the `unselectedColor` property.
  /// This list is scrollable and the list items are generated using the
  /// `Text` widget.
  Widget _normalAlphaList(String letter) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 6.0),
      child: Text(
        letter,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: _selectedAlphabet == letter
              ? widget.selectedColor
              : widget.unselectedColor,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
