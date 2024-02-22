// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Scan extends StatefulWidget {
//   @override
//   _ScanState createState() => _ScanState();
// }

// class _ScanState extends State<Scan> {
//   File _image;
//   List<String> _labels = [];
//   bool _modalVisible = false;
//   List<String> _barcodeData = [];

//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().getImage(source: source);

//     setState(() {
//       _image = File(pickedFile.path);
//     });
//   }

//   Future<void> _analyzeImage() async {
//     // Implement image analysis logic here
//   }

//   Future<void> _handleQuestionSubmit() async {
//     // Implement API request logic here
//   }

//   void _addNewGoal() {
//     setState(() {
//       _modalVisible = !_modalVisible;
//       _barcodeData = [];
//     });
//   }

//   bool _compareAllergies(List<String> allergies) {
//     // Implement allergy comparison logic here
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         color: Color(0xFFE6ECF5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               height: 250,
//               decoration: BoxDecoration(
//                 color: Colors.lightBlue,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(40),
//                   bottomRight: Radius.circular(40),
//                 ),
//               ),
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Positioned(
//                     bottom: 0,
//                     child: Image.asset(
//                       'assets/scan.png',
//                       width: MediaQuery.of(context).size.width * 0.9,
//                       height: MediaQuery.of(context).size.height * 0.9,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Scan Ingredients',
//                     style: TextStyle(
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.darkBlue),
//                   ),
//                   SizedBox(height: 20),
//                   _image != null
//                       ? Pressable(
//                           onPressed: () => _pickImage(ImageSource.gallery),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.file(_image,
//                                   width: 100, height: 100, fit: BoxFit.cover),
//                               SizedBox(width: 20),
//                               Text('Choose another Image'),
//                             ],
//                           ),
//                         )
//                       : GestureDetector(
//                           onTap: () => _pickImage(ImageSource.gallery),
//                           child: Container(
//                             width: 150,
//                             height: 150,
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.grey, width: 2),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset('assets/dropbox.png',
//                                     width: 100, height: 100),
//                                 Text('Pick Image',
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold)),
//                               ],
//                             ),
//                           ),
//                         ),
//                   SizedBox(height: 20),
//                   GestureDetector(
//                     onTap: () => _pickImage(ImageSource.camera),
//                     child: Container(
//                       width: 150,
//                       height: 150,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey, width: 2),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset('assets/camera3.png',
//                               width: 100, height: 100, fit: BoxFit.cover),
//                           Text('Open Camera',
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _analyzeImage,
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       padding:
//                           EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                     ),
//                     child: Text('Analyze Image',
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold)),
//                   ),
//                   SizedBox(height: 20),
//                   if (_labels.isNotEmpty) Text('Labels'),
//                   // Display labels here
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
