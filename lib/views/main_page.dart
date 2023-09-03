import 'package:flutter/material.dart';
import 'package:rick_morty/themes/colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  final String _title = "Characters";
  final double _notchedValue = 30;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text(_title),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.search_outlined),
          onPressed: () {},
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5.0,
          child: _myTabView(),
        ),
      ),
    );
  }

  TabBar _myTabView() {
    return TabBar(
        labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        labelColor: RickAndMortyAppColors.white,
        indicatorColor: Colors.white,
        padding: EdgeInsets.zero,
        onTap: (int index) {},
        //  controller: _tabController,
        tabs: _MyTabViews.values
            .map((e) => Tab(text: e.name.toUpperCase()))
            .toList());
  }
}

enum _MyTabViews { home, settings }
