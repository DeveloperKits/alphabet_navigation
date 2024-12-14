import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alphabet_navigation/alphabet_navigation.dart';

void main() {
  test('adds one to input values', () {
    final alphabetNavigation = AlphabetNavigation(
      stringList: ['Akash', 'Ajoy', 'Bijoy', 'Chijoy', 'Dijoy'],
      dynamicList: [1, 2, 3, 4, 5],
      backgroundColor: const Color(0xFF56A3A6),
      selectedColor: const Color(0xFF014D41),
      unselectedColor: const Color(0xFFF6FDFF),
      itemBuilder: (context, index, dynamicList) {
        return Text('Item ${index + 1}');
      },
    );

    expect(alphabetNavigation, isNotNull);
  });
}
