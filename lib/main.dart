import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'screens/home_screen.dart';
import 'screens/roster_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final List<Map<String, String>> appPages = [
    {'title': 'Home', 'url': '/home', 'icon': 'home'},
    {'title': 'Roster', 'url': '/roster', 'icon': 'list'},
    {'title': 'Settings', 'url': '/settings', 'icon': 'settings'},
  ];

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/roster',
          builder: (context, state) => RosterScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => SettingsScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}

const defaultKey = Key('appShell');

class AppPage {
  String title;
  String url;
  IconData icon;

  AppPage({required this.title, required this.url, required this.icon});
}

class AppShell extends StatefulWidget {
  final Widget child;
  final bool showDrawer;
  final Key key;
  final List<AppPage> appPages = [
    AppPage(title: 'Home', url: '/home', icon: Icons.home),
    AppPage(title: 'Roster', url: '/roster', icon: Icons.list),
    AppPage(title: 'Settings', url: '/settings', icon: Icons.settings),
  ];

  AppShell(
      {required this.child, this.showDrawer = false, this.key = defaultKey});

  @override
  _AppShellState createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  bool isLoggedIn = true;

  void logout() {
    setState(() {
      isLoggedIn = false;
    });
    // Add your logout logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      drawer: widget.showDrawer
          ? Drawer(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: Text('Menu'),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  for (var page in widget.appPages)
                    ListTile(
                      title: Text(page.title),
                      leading: Icon(page.icon),
                      onTap: () {
                        context.go(page.url);
                      },
                    ),
                  Divider(),
                  ListTile(
                    title: Text('Logout'),
                    leading: Icon(Icons.logout),
                    onTap: isLoggedIn ? logout : null,
                  ),
                ],
              ),
            )
          : null,
      body: widget.child,
    );
  }
}
