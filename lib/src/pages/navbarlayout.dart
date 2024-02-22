import 'package:allwin/src/pages/profile.dart';
import 'package:flutter/material.dart';
import '../settings/settings_view.dart';
import './scanner.dart';
import 'airecipe.dart';

/// Displays a list of SampleItems.

class NavBarLayout extends StatefulWidget {
  const NavBarLayout({super.key});
  static const routeName = '/';

  @override
  State<NavBarLayout> createState() => _NavBarLayoutState();
}

class _NavBarLayoutState extends State<NavBarLayout> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllWin'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.food_bank),
            icon: Icon(Icons.food_bank_outlined),
            label: 'Recipe',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.barcode_reader),
            icon: Icon(Icons.barcode_reader),
            label: 'Scan',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.groups),
            icon: Badge(child: Icon(Icons.groups_outlined)),
            label: 'Community',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.person_outline_sharp),
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Home',
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
        ),

        AiCourse(),
        BarcodeScannerComponent(),

        /// Messages page
        ListView.builder(
          reverse: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hello',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Hi!',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            );
          },
        ),

        ProfileScreen(),
      ][currentPageIndex],
    );
  }
}
