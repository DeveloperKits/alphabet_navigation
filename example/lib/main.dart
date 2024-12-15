import 'package:flutter/material.dart';
import 'package:alphabet_navigation/alphabet_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alphabet List Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AlphabetListViewExample(),
    );
  }
}

class AlphabetListViewExample extends StatelessWidget {
  const AlphabetListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    /// A sample list of items to display
    List<String> stringList = [
      'Apple', 'Banana', 'Cherry', 'Date', 'Elderberry', 'Fig', 'Grape',
      'Honeydew', 'Iceberg Lettuce', 'Jackfruit', 'Kiwi', 'Lemon', 'Mango',
      'Nectarine', 'Orange', 'Papaya', 'Quince', 'Raspberry', 'Strawberry',
      'Tomato', 'Ugli Fruit', 'Vanilla Bean', 'Watermelon', 'Xigua', 'Yam', 'Zucchini'
    ];

    /// The dynamic list (can be more complex, such as objects)
    List<dynamic> dynamicList = stringList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alphabet Navigator'),
        centerTitle: true,
      ),
      body: AlphabetNavigation(
        stringList: stringList,
        dynamicList: dynamicList,
        showSearchField: true,
        dynamicListHeight: 80,

        searchFieldHintText: "Search here...",
        searchFieldTextStyle: TextStyle(
          color: Colors.blue.shade800,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        searchFieldHintTextStyle: TextStyle(
          color: Colors.grey.shade300,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        searchFieldIcon: Icon(Icons.search, color: Colors.blue.shade800,),
        searchFieldEndIconColor: Colors.blue.shade800,

        listDirection: ListDirection.left,
        alphabetListBackgroundColor: Colors.tealAccent,
        selectedColor: Colors.white70,
        unselectedColor: Colors.black38,
        circleSelectedBackgroundColor: Colors.blue,
        circleSelectedLetter: true,
        circleBorderRadius: 10.0,

        scrollAnimationCurve: Curves.easeInCubic,

        itemBuilder: (context, index, dynamicList) {
          /// Build the item widget
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.tealAccent,
            ),
            child: ListTile(
              dense: true,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              title: Text(
                dynamicList[index],
                style: const TextStyle(fontSize: 18, color: Colors.black87,),
              ),
              leading: Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                  backgroundColor: const Color(0xFF56A3A6),
                  child: Text(
                    dynamicList[index][0],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black54,
              ),
            ),
          );
        },
      ),
    );
  }
}