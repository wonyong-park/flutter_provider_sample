import 'package:flutter/material.dart';
import 'package:flutter_provider_sample/src/provider/bottom_navigation_provider.dart';
import 'package:flutter_provider_sample/src/provider/count_provider.dart';
import 'package:flutter_provider_sample/src/ui/count_home_widget.dart';
import 'package:flutter_provider_sample/src/ui/movie_list_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  late CountProvider _countProvider;
  late BottomNavigationProvider _bottomNavigationProvider;

  Widget _navigationBody() {
    return _bottomNavigationProvider.currentPage == 0
        ? CountHomeWidget()
        : MovieListWidget();
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movie"),
      ],
      currentIndex: _bottomNavigationProvider.currentPage,
      selectedItemColor: Colors.red,
      onTap: (index) {
        _bottomNavigationProvider.updateCurrentPage(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Build Home!!");
    _countProvider = Provider.of<CountProvider>(context, listen: false);
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);
    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}

