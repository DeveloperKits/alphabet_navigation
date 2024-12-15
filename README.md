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
- [x] Compatible with all platforms.

---


## Screenshot

|                                                            Circular Selected Item                                                             |                                                           Drug by class                                                            |                                                  List Direction Left                                                                    |
|:-------------------------------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------:|
| <img src="https://github.com/user-attachments/assets/d789dfda-1937-450c-9521-714b0732790c" width = "250" height = "450"> | <img src="https://github.com/user-attachments/assets/58fef2b1-30d5-46a5-9b39-dfcd383e5229" width = "250" height = "450"> | <img src="https://github.com/user-attachments/assets/243c432c-cfe2-44c0-87b7-3dd60220d56d" width = "250" height = "450"> |

|                 Mac               |               Web
|:---------------------------------:|:----------------------------------------:|
|<img src="https://github.com/user-attachments/assets/fd8b0a5b-14d4-49dc-974a-237eb7cbfdc5" width = "400" height = "300">|<img src="https://github.com/user-attachments/assets/28e8b241-ea39-4576-bacd-34fb22d76805" width = "400" height = "300">|


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
AlphabetNavigation(
  stringList: stringList, // Pass the string list for alphabet mapping
  dynamicList: dynamicList, // Pass the dynamic list for content
  dynamicListHeight: 80, // Dynamic list height (optional)
  listDirection: ListDirection.left, // Direction of the list (optional)
  showSearchField: true, // Toggle for search field (optional)
  circleSelectedLetter: true, // Is circle apply for the selected letter (optional)
  itemBuilder: (context, index, searchFilterList) {}, // Item builder
)
```

### Parameters

| Parameter     | Type                        | Description                                      |
|---------------|-----------------------------|--------------------------------------------------|
| `stringList`  | `List<String>`              | List of strings for alphabetical grouping.       |
| `dynamicList` | `List<dynamic>`             | Data list to be displayed.                       |
| `listDirection` | `ListDirection` | Direction of the list.                           |
| `dynamicListHeight` | `double` | Dynamic list height.                             |
| `circleSelectedLetter` | `bool` | Is circle apply for the selected letter.                |
| `circleSelectedBackgroundColor` | `Color` | Circle background color for the selected letter. |
| `circleBorderRadius` | `double` | Border radius for the selected letter circle.    |
| `backgroundColor` | `Color` | Alphabet list Background color                   |
| `selectedColor` | `Color` | Selected alphabet color                          |
| `unselectedColor` | `Color` | Unselected alphabet color                        |
| `itemBuilder` | `Function(BuildContext, int)` | Function to build list items dynamically.        |

---
 
## Demo 
https://github.com/user-attachments/assets/8f61ac4c-4937-4c98-b86d-36bf86ac0acd

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

