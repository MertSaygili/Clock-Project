// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final TabController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: TabBarItems.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final _colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: _colorScheme.surface,
        selectedItemColor: _colorScheme.onSurface,
        unselectedItemColor: _colorScheme.onSurface.withOpacity(.60),
        selectedLabelStyle: _textTheme.caption,
        unselectedLabelStyle: _textTheme.caption,
        onTap: (value) {
          setState(() => _currentIndex = value);
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'Music',
            icon: Icon(Icons.music_note),
          ),
          BottomNavigationBarItem(
            label: 'Places',
            icon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            label: 'News',
            icon: Icon(Icons.library_books),
          ),
        ],
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          Text('asdas'),
          Text('asdas'),
          Text('asdas'),
          Text('asdas'),
        ],
      ),
    );
  }
}

enum TabBarItems { Alarm, DunyaSaati, Kronometre, Zamanlayici }

extension TabBarExtension on TabBarItems {}
