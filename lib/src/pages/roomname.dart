// import 'package:flutter/material.dart';

// class Roomname extends StatefulWidget {
//   @override
//   _RoomnameState createState() => _RoomnameState();
// }

// class _RoomnameState extends State<Roomname> {
//   String room = "";
//   String meetingName = "";
//   String date = "";
//   String mode = "";
//   String forums = "";
//   String time = "";
//   bool modalVisible = false;
//   List<Map<String, String>> meetings = [];

//   List<String> forumTopics = [
//     "Budgeting and Saving",
//     "Wealth Building",
//     "Financial Planning",
//     "Estate Planning",
//     "Finance Education and Courses",
//     "Career Advice",
//     "Digital Banking",
//     "Economics and Global Finance",
//     "Payment Solutions",
//     "Trade and Commerce",
//   ];

//   List<String> colors = [
//     "#FFA726",
//     "#66BB6A",
//     "#42A5F5",
//     "#FF7043",
//     "#FFD54F",
//     "#FFC107",
//     "#26C6DA",
//     "#9575CD",
//     "#4DB6AC",
//     "pink",
//   ];

//   List<String> backgroundColors = [
//     "#F5FFFA",
//     "#E6F0FF",
//     "#D8BFD8",
//     "#DDA0DD",
//     "#FFB6C1",
//     "#FF7F50",
//     "#AFEEEE",
//     "#FFDAB9",
//     "#FFE4C4",
//   ];

//   void handleTopicPress(int topicIndex) {
//     setState(() {
//       room = forumTopics[topicIndex];
//     });
//   }

//   void handlePress() {
//     setState(() {
//       modalVisible = !modalVisible;
//       Map<String, String> newMeeting = {
//         "date": date,
//         "forums": forums,
//         "meetingName": meetingName,
//         "mode": mode,
//         "time": time,
//       };
//       meetings.add(newMeeting);
//       // Reset form fields
//       meetingName = "";
//       date = "";
//       mode = "";
//       forums = "";
//       time = "";
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: Text(
//                 'Chat',
//                 style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold),
//               ),
//             ),
//             room.isNotEmpty
//                 ? Container(
//                     color: Color(int.parse(
//                         colors[forumTopics.indexOf(room)].substring(1))),
//                     child: Text(
//                       'Chat room: $room',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   )
//                 : Column(
//                     children: [
//                       Wrap(
//                         children: [
//                           for (int index = 0;
//                               index < forumTopics.length;
//                               index++)
//                             GestureDetector(
//                               onTap: () => handleTopicPress(index),
//                               child: Container(
//                                 padding: EdgeInsets.all(10),
//                                 margin: EdgeInsets.symmetric(
//                                     vertical: 5, horizontal: 5),
//                                 decoration: BoxDecoration(
//                                   color: Color(
//                                       int.parse(colors[index].substring(1))),
//                                   borderRadius: BorderRadius.circular(88),
//                                 ),
//                                 child: Text(
//                                   '#${forumTopics[index]}',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(20),
//                         child: Text(
//                           'Meet',
//                           style: TextStyle(
//                               fontSize: 31, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: GestureDetector(
//                           onTap: () => setState(() => modalVisible = true),
//                           child: Container(
//                             width: double.infinity,
//                             height: 100,
//                             margin: EdgeInsets.only(bottom: 20),
//                             padding: EdgeInsets.all(20),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   spreadRadius: 5,
//                                   blurRadius: 7,
//                                   offset: Offset(0, 3),
//                                 ),
//                               ],
//                             ),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   '+',
//                                   style: TextStyle(
//                                       fontSize: 30, color: Colors.grey),
//                                 ),
//                                 SizedBox(width: 10),
//                                 Text(
//                                   'Tap to add a meet',
//                                   style: TextStyle(
//                                       fontSize: 20, color: Colors.grey),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             for (var meet in meetings)
//                               Container(
//                                 margin: EdgeInsets.only(right: 20),
//                                 width: 200,
//                                 height: 170,
//                                 decoration: BoxDecoration(
//                                   color: Color(int.parse(
//                                       backgroundColors[meetings.indexOf(meet)]
//                                           .substring(1))),
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.all(10),
//                                       child: Text(
//                                         meet['meetingName']!,
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 10, vertical: 5),
//                                       child: Row(
//                                         children: [
//                                           Image.asset(
//                                             'assets/profile-round-1342-svgrepo-com.png',
//                                             width: 15,
//                                             height: 15,
//                                           ),
//                                           SizedBox(width: 5),
//                                           Text('Shreyans Jain'),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 10, vertical: 5),
//                                       child: Row(
//                                         children: [
//                                           Image.asset(
//                                             'assets/hashtag-svgrepo-com.png',
//                                             width: 15,
//                                             height: 15,
//                                           ),
//                                           SizedBox(width: 5),
//                                           Text(meet['forums']!),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 10, vertical: 5),
//                                       child: Row(
//                                         children: [
//                                           Image.asset(
//                                             'assets/camera-svgrepo-com.png',
//                                             width: 15,
//                                             height: 15,
//                                           ),
//                                           SizedBox(width: 5),
//                                           Text(meet['mode']!),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 10, vertical: 5),
//                                       child: Row(
//                                         children: [
//                                           Image.asset(
//                                             'assets/clock-two-svgrepo-com.png',
//                                             width: 15,
//                                             height: 15,
//                                           ),
//                                           SizedBox(width: 5),
//                                           Text('${meet['date']}, ${meet['time']}'),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//             modalVisible
//                 ? GestureDetector(
//                     onTap: () => setState(() => modalVisible = false),
//                     child: Container(
//                       color: Colors.black.withOpacity(0.5),
//                       child: Center(
//                         child: GestureDetector(
//                           onTap: () {},
//                           child: Container(
//                             width: MediaQuery.of(context).size.width * 0.9,
//                             height: 300,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 TextFormField(
//                                   style: meetingName,
//                                   onChanged: (value) =>
//                                       setState(() = > meetingName = value),
//                                   decoration: InputDecoration(
//                                     hintText: 'Meeting Name',
//                                     border: OutlineInputBorder(),
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 TextFormField(
//                                   value: date,
//                                   onChanged: (value) =>
//                                       setState(() => date = value),
//                                   decoration: InputDecoration(
//                                     hintText: 'Date (DD/MM/YYYY)',
//                                     border: OutlineInputBorder(),
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 TextFormField(
//                                   value: mode,
//                                   onChanged: (value) =>
//                                       setState(() => mode = value),
//                                   decoration: InputDecoration(
//                                     hintText: 'Mode (Online/Offline)',
//                                     border: OutlineInputBorder(),
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 TextFormField(
//                                   value: forums,
//                                   onChanged: (value) =>
//                                       setState(() => forums = value),
//                                   decoration: InputDecoration(
//                                     hintText:
//                                         'Forums (#Wealth Building #Career Advice)',
//                                     border: OutlineInputBorder(),
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 TextFormField(
//                                   value: time,
//                                   onChanged: (value) =>
//                                       setState(() => time = value),
//                                   decoration: InputDecoration(
//                                     hintText: 'Time (eg. 12:00 AM)',
//                                     border: OutlineInputBorder(),
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 ElevatedButton(
//                                   onPressed: handlePress,
//                                   child: Text('Add'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 : SizedBox.shrink(),
//           ],
//         ),
//       ),
//     );
//   }
// }
