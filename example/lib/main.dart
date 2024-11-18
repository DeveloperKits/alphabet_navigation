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
        title: const Text('Alphabet List View Example'),
        centerTitle: true,
      ),
      body: AlphabetNavigation(
        stringList: stringList, /// Pass the string list for alphabet mapping
        dynamicList: dynamicList, /// Pass the dynamic list for content
        backgroundColor: Colors.blue, /// Background color for alphabet list
        selectedColor: Colors.white, /// Selected alphabet color
        circleSelectedLetter: true, /// Circle background color for the selected letter
        listDirectionLeft: true, /// Direction of the list. If true, the list will be from right to left
        circleBorderRadius: 8, /// Border radius for the selected letter circle
        itemBuilder: (context, index) {
          /// Build the item widget
          return Container(
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
                style: const TextStyle(fontSize: 18, color: Colors.black54,),
              ),
              leading: Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
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