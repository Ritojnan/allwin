// import 'package:flutter/material.dart';
// import 'package:flutter_three_dart/flutter_three_dart.dart';

// class CubeScene extends StatefulWidget {
//   @override
//   _CubeSceneState createState() => _CubeSceneState();
// }

// class _CubeSceneState extends State<CubeScene> {
//   Map<String, Color> _boxColors = {
//     "backStall1": Colors.pink,
//     "backStall2": Colors.pink,
//     "backStall3": Colors.pink,
//     "frontStall1": Colors.pink,
//     "frontStall2": Colors.pink,
//     "midStall1": Colors.pink,
//     "midStall2": Colors.pink,
//     "midStall3": Colors.pink,
//     "midStall4": Colors.pink,
//     "midStall5": Colors.pink,
//     "midStall6": Colors.pink,
//     "counter": Colors.pink,
//   };
//   String _currentBox = "";

//   void _handleBoxClick(String boxName) {
//     setState(() {
//       _boxColors[boxName] =
//           _boxColors[boxName] == Colors.pink ? Colors.red : Colors.pink;
//       _currentBox = boxName;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: Text("Shelf Number: $_currentBox"),
//           ),
//           if (_currentBox.isNotEmpty)
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 children: [
//                   for (var item in shelfData[_currentBox]!) Text(item),
//                 ],
//               ),
//             ),
//           Expanded(
//             child: ThreeDContainer(
//               scene: Scene(
//                 children: [
//                   Background(
//                     color: Color(0xFF000000),
//                   ),
//                   AmbientLight(color: Color(0xFFFFFFFF), intensity: 0.5),
//                   DirectionalLight(
//                     color: Color(0xFFFFFFFF),
//                     intensity: 0.5,
//                     position: Vector3(0, 10, 0),
//                   ),
//                   Mesh(
//                     geometry: BoxGeometry(Vector3(4, 0.1, 7)),
//                     material: Material(color: Color(0xFF0000FF)),
//                   ),
//                   Mesh(
//                     position: Vector3(0, 1, -3.5),
//                     geometry: BoxGeometry(Vector3(4, 2, 0.1)),
//                     material: Material(color: Color(0xFFFFA500)),
//                   ),
//                   // Add more walls and stalls here...
//                 ],
//               ),
//               interactive: true,
//               onClick: (String uuid) {
//                 if (_boxColors.containsKey(uuid)) {
//                   _handleBoxClick(uuid);
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
