library alphabet_navigation;

import 'package:flutter/material.dart';

class AlphabetNavigation extends StatefulWidget {
  final List<String> stringList; // List of strings (for mapping alphabet positions)
  final List<dynamic> dynamicList; // The actual data (genericList, classList, etc.)
  final Color backgroundColor; // alphabet list Background color
  final Color selectedColor; // Selected alphabet color
  final Color unselectedColor; // Unselected alphabet color
  final Function(BuildContext, int) itemBuilder; // Item builder for dynamic list

  const AlphabetNavigation({
    super.key,
    required this.stringList,
    required this.dynamicList,
    this.backgroundColor = const Color(0xFF56A3A6),
    this.selectedColor = const Color(0xFF014D41),
    this.unselectedColor = const Color(0xFFF6FDFF),
    required this.itemBuilder,
  });

  @override
  _AlphabetNavigationState createState() => _AlphabetNavigationState();
}

class _AlphabetNavigationState extends State<AlphabetNavigation> {
  late ScrollController _scrollController;
  final Map<String, int> _alphabetMap = {}; // Maps alphabet to list index
  String _selectedAlphabet = 'A'; // Default selected alphabet

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _generateAlphabetMap();
  }

  void _generateAlphabetMap() {
    List<String> sortedList = widget.stringList.map((e) => e.toUpperCase()).toList();
    sortedList.sort(); // Sort by alphabet to ensure correct mapping

    for (int i = 0; i < sortedList.length; i++) {
      String firstLetter = sortedList[i][0];
      if (!_alphabetMap.containsKey(firstLetter)) {
        _alphabetMap[firstLetter] = i;
      }
    }
  }

  void _scrollToLetter(String letter) {
    setState(() {
      _selectedAlphabet = letter; // Update selected alphabet
    });

    int? index = _alphabetMap[letter];
    if (index != null) {
      double targetOffset = index * 60.0;
      double currentOffset = _scrollController.offset;

      // Adjust duration based on distance, with smaller scaling
      double distance = (targetOffset - currentOffset).abs();
      int duration = (distance / 800).clamp(50, 200).toInt(); // Faster scaling

      _scrollController.animateTo(
        targetOffset,
        duration: Duration(milliseconds: duration),
        curve: Curves.linear, // Constant speed
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dynamic List View
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: widget.dynamicList.length,
            itemExtent: 60,
            itemBuilder: (context, index) {
              return widget.itemBuilder(context, index);
            },
          ),
        ),

        // Alphabet Navigation Bar
        Container(
          margin: const EdgeInsets.only(right: 2, top: 10, bottom: 10),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                    child: Text(
                      letter,
                      style: TextStyle(
                        fontSize: 16,
                        color: _selectedAlphabet == letter
                            ? widget.selectedColor
                            : widget.unselectedColor,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

