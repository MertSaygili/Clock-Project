import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _setController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _setController() {
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageView(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  PageView _pageView() {
    return PageView(
      controller: _controller,
      onPageChanged: _setNewPage,
      children: const [
        Text('sad'),
        Text('sad'),
      ],
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.save), label: ''),
      ],
    );
  }

  void _setNewPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTap(int newIndex) {
    _controller.animateToPage(
      newIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
