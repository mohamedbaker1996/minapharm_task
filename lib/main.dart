import 'package:flutter/material.dart';
import 'package:minapharm_task/models/movie_res.dart';
import 'package:minapharm_task/screens/dashcoard_screen.dart';
import 'package:minapharm_task/screens/home_page_screen.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import './screens/auth_screen.dart';
import './helpers/custom_route.dart';
import './screens/splash_screen.dart';
import 'network/api_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider<AppState>(create: (context) => AppState()),
        ChangeNotifierProvider(
          create: (ctx) =>
              MovieResult(id: null, originalTitle: '', posterPath: ''),
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'MoviesTask',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.android: CustomePageTransitionBuilder(),
              TargetPlatform.iOS: CustomePageTransitionBuilder(),
            }),
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.purple,
            ).copyWith(secondary: Colors.deepOrange),
            fontFamily: 'Lato',
          ),
          home: auth.isAuth
              ? DashboardScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen()),
          routes: {
            DashboardScreen.routeName: (ctx) => DashboardScreen(),
            HomePageScreen.routeName: (ctx) => const HomePageScreen(),
          },
        ),
      ),
    );
  }
}
