import 'package:flutter/material.dart';
import 'package:minapharm_task/network/api_state.dart';
import 'package:minapharm_task/widgets/movies_grid.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';

class HomePageScreen extends StatefulWidget {
  static const routeName = 'home_page_screen';

  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<AppState>(context, listen: false).fetchMovies();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<AppState>(context).fetchMovies().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final movieData = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('movies task'),
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const MoviesGrid(),
    );
  }
}
