import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/custom_page_view.dart';

class Home1PageView extends StatefulWidget {
  const Home1PageView({Key? key}) : super(key: key);

  @override
  State<Home1PageView> createState() => _Home1PageViewState();
}

class _Home1PageViewState extends State<Home1PageView> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        controller: _controller,
      ),
      body: CustomPageView(controller: _controller),
    );
  }
}
