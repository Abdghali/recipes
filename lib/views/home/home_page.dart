import 'package:flutter/material.dart';
import 'package:recipes/views/home/recipes_grid_view.dart';

import '../../models/app_bar_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    RecipesGridView(
      myRecipeList: recipeList,
    ),
    FavoriteScreen(
      favoriteRecipes: recipeList,
    ),
    HistoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Update app bar title based on selected navigation
    switch (index) {
      case 0:
        AppBarHelper.setTitle('Recipes');
        break;
      case 1:
        AppBarHelper.setTitle('Favorites');
        break;
      case 2:
        AppBarHelper.setTitle('History');
        break;
    }
  }

  void _onSearchPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool showSearchIcon = _selectedIndex == 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('${AppBarHelper._title}'),
        backgroundColor: Colors.green,
        actions: showSearchIcon
            ? [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _onSearchPressed,
                ),
              ]
            : [],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 200, 230, 201),
              Color.fromARGB(255, 165, 214, 167),
              Color.fromARGB(255, 129, 199, 132),
              Color.fromARGB(255, 102, 187, 106),
              Color.fromARGB(255, 76, 175, 80),
            ],
          ),
        ),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.brown,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
