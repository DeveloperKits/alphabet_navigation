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
- [x] Built-in search bar for filtering items dynamically.
- [x] Search field is optional & can be customized.
- [x] Dynamic list height is optional & can be customized.
- [x] Alphabetic list direction is configurable.
- [x] Allow users to easily configure colors, fonts, and styles.
- [x] Lightweight and easy to integrate into any Flutter project.
- [x] Compatible with all platforms.
- [x] Clear documentation.

---

## Demo

<p align="center">
  <img src="https://github.com/user-attachments/assets/00b77224-694e-4901-9375-793663d23aa6" alt="Demo GIF" height="500" width="300" style="border-radius: 10px">
</p>

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
     alphabet_navigation: ^2.1.0 // replace with latest version
   ```

2. Run the following command to get the package:
   ```yaml
   flutter pub get
   ```

---

## Usage

Here’s how you can use the `AlphabetNavigation` widget in your app:

#### Example 1:
```dart
AlphabetNavigation(
  stringList: stringList, // Pass the string list for alphabet mapping
  dynamicList: dynamicList, // Pass the dynamic list for content
  dynamicListHeight: 80, // Dynamic list height (optional)
  showSearchField: true, // Toggle for search field (optional)
  circleSelectedLetter: true, // Is circle apply for the selected letter (optional)
  itemBuilder: (context, index, searchFilterList) {}, // Item builder
)
```

#### Example 2:
```dart
AlphabetNavigation(
  stringList: stringList, // Pass the string list for alphabet mapping
  dynamicList: dynamicList, // Pass the dynamic list for content
  searchFieldHintText: "Search here...", // Search field hint text
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
  searchFieldIcon: Icon(Icons.search, color: Colors.blue.shade800,), // Search field icon
  searchFieldEndIconColor: Colors.blue.shade800, // Search field clear icon color
  listDirection: ListDirection.left, // Direction of the list. If [ListDirection.left], the list will be from right to left (optional)
  showSearchField: true, // Toggle for search field (optional)
  circleSelectedLetter: true, // Is circle apply for the selected letter (optional)
  itemBuilder: (context, index, searchFilterList) {}, // Item builder
)
```

#### Example 3:
```dart
AlphabetNavigation(
  stringList: stringList, // Pass the string list for alphabet mapping
  dynamicList: dynamicList, // Pass the dynamic list for content
  showSearchField: true, // Toggle for search field (optional)
  alphabetListBackgroundColor: Colors.tealAccent, // Alphabet list background color
  selectedColor: Colors.white70, // Selected color for the alphabet
  unselectedColor: Colors.black38, // Unselected color for the alphabet
  circleSelectedLetter: true, // Is circle apply for the selected letter (optional)
  circleSelectedBackgroundColor: Colors.blue, // Selected circle background color
  itemBuilder: (context, index, searchFilterList) {}, // Item builder
)
```

#### Example 4:
```dart
AlphabetNavigation(
  stringList: stringList, // Pass the string list for alphabet mapping
  dynamicList: dynamicList, // Pass the dynamic list for content
  showSearchField: false, // Toggle for search field (optional)
  circleSelectedLetter: false, // Is circle apply for the selected letter (optional)
  itemBuilder: (context, index, searchFilterList) {}, // Item builder
)
```

#### Example 4:
```dart
AlphabetNavigation(
  stringList: stringList, // Pass the string list for alphabet mapping
  dynamicList: dynamicList, // Pass the dynamic list for content
  circleSelectedLetter: false, // Is circle apply for the selected letter (optional)
  itemBuilder: (context, index, searchFilterList) {}, // Item builder
)
```

#### Example 5:
```dart
AlphabetNavigation(
  stringList: stringList, // Pass the string list for alphabet mapping
  dynamicList: dynamicList, // Pass the dynamic list for content
  circleSelectedLetter: false, // Is circle apply for the selected letter (optional)
  alphabetListBackgroundColor: Colors.transparent, // Alphabet list background color
  selectedColor: Colors.blue, // Selected color for the alphabet
  unselectedColor: Colors.grey.shade600, // Unselected color for the alphabet
  itemBuilder: (context, index, searchFilterList) {}, // Item builder
)
```

#### Example 6:
```dart
AlphabetNavigation(
  stringList: stringList, // Pass the string list for alphabet mapping
  dynamicList: dynamicList, // Pass the dynamic list for content
  showSearchField: true, // Toggle for search field (optional)
  circleSelectedLetter: true, // Is circle apply for the selected letter (optional)
  circleBorderRadius: 50.0, // Border radius for the selected letter circle and alphabet list border
  scrollAnimationCurve: Curves.easeInCubic, // Scroll animation curve
  itemBuilder: (context, index, searchFilterList) {}, // Item builder
)
```


|                                                        Example 1                                                         |                                                        Example 2                                                         |                                                        Example 3                                                         |
|:------------------------------------------------------------------------------------------------------------------------:|:------------------------------------------------------------------------------------------------------------------------:|:------------------------------------------------------------------------------------------------------------------------:|
| <img src="https://github.com/user-attachments/assets/e95d1516-4596-4756-b275-8111e65b13de" width = "250" height = "450"> | <img src="https://github.com/user-attachments/assets/19bdce32-36ce-4d60-8598-f04d4e2e5b06" width = "250" height = "450"> | <img src="https://github.com/user-attachments/assets/1e4aad9c-5c15-4cf5-a0a4-b038af5a4058" width = "250" height = "450"> |



|                                                        Example 4                                                         |                                                        Example 5                                                         |                                                        Example 6                                                         |
|:------------------------------------------------------------------------------------------------------------------------:|:------------------------------------------------------------------------------------------------------------------------:|:------------------------------------------------------------------------------------------------------------------------:|
| <img src="https://github.com/user-attachments/assets/9185002f-1c0e-4631-b0bd-5d22916bbdca" width = "250" height = "450"> | <img src="https://github.com/user-attachments/assets/6a59e2cb-56ae-414d-b069-928d8f863360" width = "250" height = "450"> | <img src="https://github.com/user-attachments/assets/703bafc6-379c-4ec7-afb6-35fa94974341" width = "250" height = "450"> |



### Parameters

| Parameter     | Type                             | Description                                   |
|---------------|----------------------------------|-----------------------------------------------|
| `stringList`  | `List<String>`                   | List of strings for alphabetical grouping.    |
| `dynamicList` | `List<dynamic>`                  | Data list to be displayed.                    |
| `dynamicListHeight` | `double`                         | Dynamic list height.                          |
| `listDirection` | `ListDirection`                  | Direction of the list.                        |
| `showSearchField` | `bool`                           | Toggle for search field.                      |
| `searchFieldTextStyle` | `TextStyle`                      | Search field text style.                      |
| `searchFieldHintText` | `String`                         | Search field hint text.                       |
| `searchFieldHintTextStyle` | `TextStyle`                      | Search field hint style.                      |
| `searchFieldIcon` | `Icon`                           | Search field icon.                            |
| `searchFieldBackgroundColor` | `Color`                          | Search field background color.                |
| `searchFieldEndIconColor` | `Color`                          | Search field icon color.                      |
| `alphabetListBackgroundColor` | `Color`                          | Alphabet list background color.               |
| `selectedColor` | `Color`                          | Selected alphabet color                       |
| `unselectedColor` | `Color`                          | Unselected alphabet color                     |
| `circleSelectedLetter` | `bool`                           | Is circle apply for the selected letter.      |
| `circleSelectedBackgroundColor` | `Color`                          | Circle background color for the selected letter. |
| `circleBorderRadius` | `double`                         | Border radius for the selected letter circle  |
| `scrollAnimationCurve` | `Curve`                          | Scroll animation curve.                       |
| `itemBuilder` | `Function(BuildContext, int, dynamic)` | Function to build list items dynamically.     |

---

## Screenshot

|                 Mac               |               Web
|:---------------------------------:|:----------------------------------------:|
|<img src="https://github.com/user-attachments/assets/fd8b0a5b-14d4-49dc-974a-237eb7cbfdc5" width = "400" height = "350">|<img src="https://github.com/user-attachments/assets/28e8b241-ea39-4576-bacd-34fb22d76805" width = "450" height = "350">|


---

## Future Plans

Here are some planned features for future releases:

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

