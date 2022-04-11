import 'package:flutter/material.dart';
import 'package:minapharm_task/screens/home_page_screen.dart';
import 'package:minapharm_task/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/DashBoard';

  @override
  Widget build(BuildContext context) {
    final userEmail = Provider.of<Auth>(context).emailUser;
    return Scaffold(
        appBar: AppBar(
          title: const Text('DashBord'),
        ),
        drawer: AppDrawer(),
        body: Container(
          height: 100,
          margin: const EdgeInsets.only(top: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  'hello ${userEmail ?? ''} ',
                  style: const TextStyle(fontSize: 25, fontFamily: 'Anton'),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HomePageScreen.routeName);
                },
                icon: const Icon(Icons.movie_sharp),
                label: const Text('Explore Movies'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.logout),
          label: const Text('Log out'),
          backgroundColor: const Color.fromARGB(255, 248, 73, 73),
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
            Provider.of<Auth>(context, listen: false).logOut();
          },
        ));
  }
}
