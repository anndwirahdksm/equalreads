// import 'package:flutter/material.dart';
//
// class SidebarView extends StatelessWidget {
//   const SidebarView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Dropdown Menu in AppBar',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dropdown Menu in AppBar'),
//         actions: [
//           PopupMenuButton(
//             itemBuilder: (BuildContext context) => <PopupMenuEntry>[
//               PopupMenuItem(
//                 value: 1,
//                 child: Text('Option 1'),
//               ),
//               PopupMenuItem(
//                 value: 2,
//                 child: Text('Option 2'),
//               ),
//               PopupMenuItem(
//                 value: 3,
//                 child: Text('Option 3'),
//               ),
//             ],
//             onSelected: (value) {
//               switch (value) {
//                 case 1:
//                   break;
//                 case 2:
//                 // Tindakan yang sesuai untuk Option 2
//                   break;
//                 case 3:
//                 // Tindakan yang sesuai untuk Option 3
//                   break;
//               }
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Text('Contoh Dropdown Menu in AppBar'),
//       ),
//     );
//   }
// }
//
//
//
//





import 'package:flutter/material.dart';

import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../../riwayat/views/riwayat_view.dart';

class SidebarView extends StatefulWidget {
  const SidebarView({Key? key}) : super(key: key);

  @override
  _SidebarViewState createState() => _SidebarViewState();
}

class _SidebarViewState extends State<SidebarView> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeView(),
    ProfileView(),
    RiwayatView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Sidebar Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                _navigateTo(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                _navigateTo(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Riwayat'),
              onTap: () {
                _navigateTo(2);
              },
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: _pages[_currentIndex],
          ),
        ],
      ),
    );
  }

  void _navigateTo(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.of(context).pop(); // Close drawer after navigation
    });
  }
}
