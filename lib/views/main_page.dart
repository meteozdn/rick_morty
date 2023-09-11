import 'package:flutter/material.dart';
import 'package:rick_morty/constants/paddings.dart';
import 'package:rick_morty/themes/colors.dart';
import 'package:rick_morty/views/MainPageViews/home_page.dart';
import 'package:rick_morty/views/seafrch_page.dart';

import 'MainPageViews/discover_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  final String _title = "Characters";
  late final TabController _tabController;
  int _page = 0;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          actions: [
            Padding(
                padding: RnMPaddings.buttonsPadding,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                ))
          ],
          title: Text(_title),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.search_outlined),
          onPressed: () {
            setState(() {
              _page = 3;
            });
          },
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          //  notchMargin: 5.0,
          child: _myTabView(),
        ),
        body: _page == 3 ? SearchPage() : _tabbarView(),
      ),
    );
  }

  TabBar _myTabView() {
    return TabBar(
        controller: _tabController,
        labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        labelColor: RnMColors.white,
        indicatorColor: RnMColors.white,
        padding: EdgeInsets.zero,
        onTap: (int index) {
          setState(() {
            _page = index + 1;
          });
        },
        //  controller: _tabController,
        tabs: _MyTabViews.values
            .map((e) => Tab(text: e.name.toUpperCase()))
            .toList());
  }

  TabBarView _tabbarView() {
    return TabBarView(
        //  physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [HomePage(), DiscoverPage()]);
  }
}

enum _MyTabViews { home, discover }
