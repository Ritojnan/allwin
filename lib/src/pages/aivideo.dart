// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart';

// class Aivideo extends StatefulWidget {
//   @override
//   _AivideoState createState() => _AivideoState();
// }

// class _AivideoState extends State<Aivideo> {
//   File _image;
//   List<dynamic> _labels = [];

//   Future<void> _pickImage() async {
//     final pickedFile =
//         await ImagePicker().getImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _analyzeImage() async {
//     try {
//       if (_image == null) {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text('Error'),
//             content: Text('Please select an image.'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child: Text('OK'),
//               ),
//             ],
//           ),
//         );
//         return;
//       }

//       final apikey = "AIzaSyC9gD-ijFbCVFSDMurXYb1rSw8q6JGx_6M";
//       final apiURL =
//           "https://vision.googleapis.com/v1/images:annotate?key=$apikey";
//       final base64Image = base64Encode(await _image.readAsBytes());

//       final requestData = jsonEncode({
//         "requests": [
//           {
//             "image": {
//               "content": base64Image,
//             },
//             "features": [
//               {"type": "LABEL_DETECTION", "maxResults": 5}
//             ]
//           }
//         ]
//       });

//       final response = await http.post(
//         Uri.parse(apiURL),
//         headers: {
//           "Content-Type": "application/json",
//         },
//         body: requestData,
//       );

//       final data = jsonDecode(response.body);
//       setState(() {
//         _labels = data['responses'][0]['labelAnnotations'];
//       });
//     } catch (e) {
//       print(e);
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Error'),
//           content: Text('Something went wrong.'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('OK'),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('AI Video'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             GestureDetector(
//               onTap: _pickImage,
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 width: 150,
//                 height: 150,
//                 margin: EdgeInsets.only(top: 20),
//                 child: _image != null
//                     ? Image.file(
//                         _image,
//                         width: 150,
//                         height: 150,
//                         fit: BoxFit.cover,
//                       )
//                     : Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             'assets/pizza.png',
//                             width: 150,
//                             height: 100,
//                             fit: BoxFit.contain,
//                           ),
//                           Text(
//                             'Check Food',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//               ),
//             ),
//             _labels.isNotEmpty
//                 ? Column(
//                     children: [
//                       Text('Labels'),
//                       ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: _labels.length,
//                         itemBuilder: (context, index) {
//                           return ListTile(
//                             title: Text(_labels[index]['description']),
//                           );
//                         },
//                       ),
//                     ],
//                   )
//                 : SizedBox(),
//             ElevatedButton(
//               onPressed: _analyzeImage,
//               child: Text('Scan Food'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
