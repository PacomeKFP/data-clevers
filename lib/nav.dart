import 'package:flutter/material.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({Key? key}) : super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(children: [
             SizedBox(
              width: 60,
               child: NavigationBar(
                     onDestinationSelected: (int index) {
                       setState(() {
                currentPageIndex = index;
                       });
                     },
                     selectedIndex: currentPageIndex,
                     destinations: const <Widget>[
                       NavigationDestination(
                icon: Icon(Icons.explore),
                label: 'Explore',
                       ),
                       NavigationDestination(
                icon: Icon(Icons.commute),
                label: 'Commute',
                       ),
                       NavigationDestination(
                selectedIcon: Icon(Icons.bookmark),
                icon: Icon(Icons.bookmark_border),
                label: 'Saved',
                       ),
                     ],
                   ),
             ),
            
      Expanded(
        child: <Widget>[
            Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text('Page 1'),
            ),
            Container(
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text('Page 2'),
            ),
            Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text('Page 3'),
            ),
        ][currentPageIndex],
      ),
    ]),
        ));
  }
}
