library alphabet_navigation;


import 'package:flutter/material.dart';

/// Alphabet list direction enum for more customization.
/// If left, the list will be from right to left.
/// If right, the list will be from left to right.
enum ListDirection { left, right }

/// A Flutter package that provides a dynamic, scrollable list view with an alphabetical index.
///
/// #### Params: required
/// * [stringList] List of strings (for mapping alphabet positions)
/// * [dynamicList] List of dynamic data (actual data to be displayed)
/// * [itemBuilder] Item builder function that builds the dynamic list items.
class AlphabetNavigation extends StatefulWidget {
  final List<String> stringList;
  final List<dynamic> dynamicList;
  /// Height of the dynamic list
  final double dynamicListHeight;

  /// Direction of the list. If [ListDirection.left], the list will be from right to left.
  /// If [ListDirection.right], the list will be from left to right.
  final ListDirection listDirection;

  /// Toggle for search field
  final bool showSearchField;
  /// Search field text style
  final TextStyle searchFieldTextStyle;
  /// Search field hint text
  final String searchFieldHintText;
  ///  search field hint style
  final TextStyle searchFieldHintTextStyle;
  /// Search field icon
  final Icon searchFieldIcon;
  /// Search field background color
  final Color searchFieldBackgroundColor;
  /// Search field icon color
  final Color searchFieldIconColor;

  /// Background color for alphabet list
  final Color backgroundColor;
  /// Background color for selected alphabet in the alphabet list
  final Color selectedColor;
  /// Background color for unselected alphabet in the alphabet list
  final Color unselectedColor;

  /// Circle for the selected letter in the alphabet list
  final bool circleSelectedLetter;
  /// Background color for the selected letter in the alphabet list
  final Color circleSelectedBackgroundColor;
  /// Border radius for the selected letter circle
  final double circleBorderRadius;

  /// Item builder for dynamic list which returns a [Widget] for each item
  /// if [showSearchField] is true, the list will be filtered based on the search query
  final Function(BuildContext, int, dynamic) itemBuilder;

  /// A Flutter package that provides a dynamic, scrollable list view with an alphabetical index.
  ///
  /// #### Params:
  /// * [stringList] List of strings (for mapping alphabet positions)
  /// * [dynamicList] List of dynamic data (actual data to be displayed)
  /// * [dynamicListHeight] Height of the dynamic list (optional)
  /// * [listDirection] Direction of the list. If [ListDirection.left], the list will be from right to left (optional)
  /// * [showSearchField] Toggle for search field (optional)
  /// * [backgroundColor] Background color (optional)
  /// * [selectedColor] Selected alphabet color (optional)
  /// * [unselectedColor] Unselected alphabet color (optional)
  /// * [circleSelectedLetter] Circle for the selected letter (optional)
  /// * [circleSelectedBackgroundColor] Background color for the selected letter (optional)
  /// * [circleBorderRadius] Border radius for the selected letter circle (optional)
  /// * [itemBuilder] Item builder for dynamic list which returns a [Widget] for each item
  const AlphabetNavigation({
    Key? key,
    required this.stringList,
    required this.dynamicList,
    this.dynamicListHeight = 70.0,
    this.listDirection = ListDirection.right,
    this.showSearchField = false, /// Default to no search field
    this.searchFieldTextStyle = const TextStyle(color: Colors.black54, fontSize: 16,),
    this.searchFieldHintText = 'Search',
    this.searchFieldHintTextStyle = const TextStyle(color: Colors.grey, fontSize: 16,),
    this.searchFieldIcon = const Icon(Icons.search, color: Colors.grey,),
    this.searchFieldBackgroundColor = Colors.white,
    this.searchFieldIconColor = Colors.grey,
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
  /// Scrolls to the selected alphabet letter when an alphabet is selected.
  late ScrollController _scrollController;
  /// Search field controller
  late TextEditingController _searchController;
  /// Maps alphabet to list index for faster lookup
  final Map<String, int> _alphabetMap = {};
  /// Default selected alphabet
  String _selectedAlphabet = 'A';
  /// Filtered alphabet list based on search
  List<dynamic> _filteredList = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _searchController = TextEditingController();
    _filteredList = widget.dynamicList; /// Initialize with full list
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

    /// Set default selected alphabet to the first alphabet
    setState(() {
      _selectedAlphabet = _alphabetMap.keys.first;
    });
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
      /// Scroll to the selected letter in the list base on [dynamicListHeight]
      double targetOffset = index * widget.dynamicListHeight;
      /// Get current offset
      double currentOffset = _scrollController.offset;

      /// Adjust duration based on distance, with smaller scaling
      double distance = (targetOffset - currentOffset).abs();
      int duration = (distance / 800).clamp(50, 200).toInt();

      _scrollController.animateTo(
        targetOffset,
        duration: Duration(milliseconds: duration),

        /// Constant speed
        curve: Curves.easeInQuint,
      );
    }
  }

  /// Filters the dynamic list based on the search query and updates the filtered list.
  /// If the query is empty, the filtered list is set to the full dynamic list.
  void _filterList(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredList = widget.dynamicList;
      } else {
        _filteredList = widget.dynamicList
            .where((item) => item.toString().toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// Show search field if `showSearchField` is true
        if(widget.showSearchField)
          _showSearchField(),

        Expanded(
          child: widget.listDirection == ListDirection.left
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
                ),
        ),
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
        itemCount: _filteredList.length,
        itemExtent: widget.dynamicListHeight,
        itemBuilder: (context, index) {
          /// Build the item widget based on the `itemBuilder` property,
          /// the index and the filtered list base on search
          return widget.itemBuilder(context, index, _filteredList);
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


  /// search field where user can type in the search bar to filter the list
  /// and scroll to the selected letter when an alphabet is selected
  Widget _showSearchField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: widget.searchFieldBackgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 2,
            offset: const Offset(1, 2.5), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (query) {
          _filterList(query);
        },
        style: widget.searchFieldTextStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.searchFieldHintText,
          hintStyle: widget.searchFieldHintTextStyle,
          icon: widget.searchFieldIcon,
          suffix: GestureDetector(
            onTap: _clearSearch,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: Icon(Icons.clear, color: widget.searchFieldIconColor,),
            ),
          ),
        ),
      ),
    );
  }

  void _clearSearch() {
    _searchController.clear();
    _filterList('');
  }

  @override
  void dispose() {
    /// Dispose of the scroll controller when the widget is disposed to avoid memory leaks
    _scrollController.dispose();
    _searchController.dispose(); /// Dispose the search controller
    super.dispose();
  }

}
