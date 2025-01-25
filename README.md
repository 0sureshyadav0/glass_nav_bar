# 📱 GlassNavBar

A customizable navigation bar for Flutter apps with a frosted glass effect. The navigation bar allows you to set custom icons, labels, and colors for both selected and unselected states. It uses the `BackdropFilter` widget to create the glass effect with a blur.

## ✨ Features 

- **Frosted Glass Effect**: Achieved using `BackdropFilter` and `Container` for a smooth, modern UI.
- **Customizable Colors**: Set your preferred icon and text colors for both active and inactive states.
- **Flexible Item Configuration**: Accepts a list of `NavBarItem` objects to define navigation items.

## Preview
<img src='https://github.com/0sureshyadav0/glass_nav_bar/blob/master/navBar.jpg?raw=true' width="30%" height="30%">


## 🚀 Installation 

### 1. Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  glass_nav_bar: ^0.0.4
```
### 2.Install the package:
```
flutter pub get
```
## 💡 Usage
To use the GlassNavBar in your app, follow these steps:

### 1. Define the NavBarItem objects
- Create a list of NavBarItem objects. Each item will have a label and an icon.

```
final List<NavBarItem> items = [
  NavBarItem(label: 'Home', icon: Icons.home),
  NavBarItem(label: 'Search', icon: Icons.search),
  NavBarItem(label: 'Profile', icon: Icons.account_circle),
];
```
### 2. Add GlassNavBar to your Widget Tree
- Use the GlassNavBar widget inside your screen and pass the necessary parameters.

```
GlassNavBar(
  selectedIndex: 0, // The index of the selected item
  onItemTapped: (index) {
    // Handle the tap event here
  },
  textColor: Colors.white, // Color for unselected text
  iconColor: Colors.white60, // Color for unselected icons
  activeTextColor: Colors.blue, // Color for selected text
  activeIconColor: Colors.blue, // Color for selected icons
  items: items, // The list of items for the nav bar
)
```
## ✏️ Parameters:
- **selectedIndex**: The index of the currently selected navigation item.
- **onItemTapped**: A callback function that gets called when an item is tapped, passing the index of the tapped item.
- **textColor**: Color for the text of unselected items.
- **activeTextColor**: Color for the text of the selected item.
iconColor: Color for the icon of unselected items.
- **activeIconColor**: Color for the icon of the selected item.
- **items**: A list of NavBarItem objects that define the labels and icons for each navigation item.
## </> Example
```
import 'package:flutter/material.dart';
import 'package:glass_nav_bar/glass_nav_bar.dart';
import 'package:glass_nav_bar/nav_bar_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Glass Nav Bar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Glass Nav Bar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: GlassNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: (newIndex) {
            setState(() {
              _selectedIndex = newIndex;
            });
          },
          textColor: Colors.black,
          iconColor: Colors.black54,
          activeTextColor: Colors.pink,
          activeIconColor: Colors.pink,
          items: [
            NavBarItem(icon: Icons.home, label: "Home"),
            NavBarItem(icon: Icons.notifications, label: "Notifications"),
            NavBarItem(icon: Icons.settings, label: "Settings"),
            NavBarItem(icon: Icons.person, label: "Profile"),
          ]),
    );
  }

  int _selectedIndex = 0;
}

```
## 🔧 Customization
- The GlassNavBar widget allows for customization of the appearance of the nav bar by adjusting the colors of icons and text based on the selected index.
- You can also adjust the shape of the nav bar by modifying the borderRadius in the ClipRRect.
  
## 🧑‍💻 Developer

- 🙋‍♂️ **Suresh Yadav**
- 🌐 [sureshyadav.info.np](http://sureshyadav.info.np)
- 📧 [Contact](mailto:hi@sureshyadav.info.np)

## 🌏 License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/0sureshyadav0/glass_nav_bar/blob/master/LICENSE 'MIT License') file for details.
## 🤝 Contributions
If you'd like to contribute to this project, feel free to fork the repository, create a new branch, and submit a pull request [here](https://github.com/0sureshyadav0/glass_nav_bar 'GitHub Repo'). Any improvements or fixes are welcome!







