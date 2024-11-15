# Alphabet Navigation

![](https://github.com/user-attachments/assets/f02d6c2b-c101-462e-afb4-befd0ce1761f)

[![License](https://img.shields.io/github/license/DeveloperKits/alphabet_navigation?style=flat-square)](https://github.com/DeveloperKits/alphabet_navigation?tab=MIT-1-ov-file)
[![GitHub Contributors](https://img.shields.io/github/contributors/DeveloperKits/alphabet_navigation)](https://github.com/DeveloperKits/alphabet_navigation/graphs/contributors)
[![Stars](https://img.shields.io/github/stars/DeveloperKits/alphabet_navigation?style=social)](https://pub.dev/packages/alphabet_navigation)
[![GitHub Closed Issues](https://img.shields.io/github/issues-closed-raw/DeveloperKits/alphabet_navigation)](https://github.com/DeveloperKits/alphabet_navigation/issues?q=is%3Aissue+is%3Aclosed)

`alphabet_navigation` is a Flutter package that provides a dynamic, scrollable list view with an alphabetical index. It’s perfect for apps that need a quick and intuitive way to navigate long lists by alphabet.

---

## Features

- [x] A vertical alphabetical navigation bar for quick access to sections.
- [x] Smooth scrolling to the desired section when an alphabet is selected.
- [x] Fully customizable list items and navigation styles.
- [x] Lightweight and easy to integrate into any Flutter project.
- [x] Compatible with both iOS and Android platforms.

---

## Installation

To use the `alphabet_navigation` package, follow these steps:

Run this on your project terminal:

```yaml
flutter pub add alphabet_navigation
```

or manually configure pubspec.yml file


1. Add the package to your `pubspec.yaml` file:
   ```yaml
   dependencies:
     alphabet_navigation: ^1.0.0
   ```

2. Run the following command to get the package:
   ```yaml
   flutter pub get
   ```

---

## Usage

Here’s how you can use the `AlphabetNavigation` widget in your app:
```dart
class AlphabetListViewExample extends StatelessWidget {
  const AlphabetListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    // A sample list of items to display
    List<String> stringList = [
      'Apple', 'Banana', 'Cherry', 'Date', 'Elderberry', 'Fig', 'Grape',
      'Honeydew', 'Iceberg Lettuce', 'Jackfruit', 'Kiwi', 'Lemon', 'Mango',
      'Nectarine', 'Orange', 'Papaya', 'Quince', 'Raspberry', 'Strawberry',
      'Tomato', 'Ugli Fruit', 'Vanilla Bean', 'Watermelon', 'Xigua', 'Yam', 'Zucchini'
    ];

    // The dynamic list (can be more complex, such as objects)
    List<dynamic> dynamicList = stringList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alphabet List View Example'),
        centerTitle: true,
      ),

      body: AlphabetNavigation(
        stringList: stringList, // Pass the string list for alphabet mapping
        dynamicList: dynamicList, // Pass the dynamic list for content
        itemBuilder: (context, index) {
          // Build the item widget
          return ListTile(
            dense: true,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(
              dynamicList[index],
              style: const TextStyle(fontSize: 18),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text(
                dynamicList[index][0],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          );
        },
      ),
    );
  }
}
```

### Parameters

| Parameter     | Type                        | Description                                 |
|---------------|-----------------------------|---------------------------------------------|
| `stringList`  | `List<String>`              | List of strings for alphabetical grouping.  |
| `dynamicList` | `List<dynamic>`             | Data list to be displayed.                  |
| `backgroundColor` | `Color` | Alphabet list Background color |
| `selectedColor` | `Color` | Selected alphabet color |
| `unselectedColor` | `Color` | Unselected alphabet color |
| `itemBuilder` | `Function(BuildContext, int)` | Function to build list items dynamically.   |

---
 
## Demo 
https://github.com/user-attachments/assets/8f61ac4c-4937-4c98-b86d-36bf86ac0acd


## Screenshot

|                                                            Drug by generic                                                             |                                                           Drug by class                                                            |                                                  Alphabet List Demo                                                                    |
|:-------------------------------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------:|
| <img src="https://github.com/user-attachments/assets/d789dfda-1937-450c-9521-714b0732790c" width = "250"> | <img src="https://github.com/user-attachments/assets/bcb6af54-c070-4f71-8568-50511f54e984" width = "250"> | <img src="https://github.com/user-attachments/assets/cae954e8-a6cc-4e45-87b9-301ab7d4eb5d" width = "250"> |

---

## Future Plans

Here are some planned features for future releases:

- **Search Functionality:** Built-in search bar for filtering items dynamically.
- **Theme Options:** Allow users to easily configure colors, fonts, and styles.
- **Accessibility Improvements:** Enhanced support for voice-over and screen readers.
- **Horizontal Navigation:** Add support for horizontal alphabetical navigation.
- **Custom Alphabet Set:** Support for custom navigation sets like ['A', 'B', 'C', '1', '2', '3'].
- **Multi-Language Support:** Enable alphabetical navigation for other languages.

---

## Contributing

We welcome contributions from the community! If you encounter any issues or have feature suggestions, feel free to open an issue or submit a pull request on our GitHub repository.

---

## Additional information

- [Alphabet Navigation (pub.dev)](https://pub.dev/packages/alphabet_navigation)
- [Alphabet Navigation (GitHub)](https://github.com/DeveloperKits/alphabet_navigation)

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### CONTRIBUTORS

[![Contributors](https://contrib.rocks/image?repo=DeveloperKits/alphabet_navigation)](https://github.com/DeveloperKits/alphabet_navigation/graphs/contributors)
<br/>
[**Akash Das**](https://github.com/DeveloperKits) 

### Happy Coding 👨‍💻

