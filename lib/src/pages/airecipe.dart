import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AiCourse extends StatefulWidget {
  @override
  _AiCourseState createState() => _AiCourseState();
}

class _AiCourseState extends State<AiCourse> {
  final List<TextEditingController> _controllers = [TextEditingController()];
  final List<String> _videos = [];
  final List<String> _videoSummaries = [];

  final String _apiKey = "AIzaSyDJf-tQod2znecRpkrnQnoRi-SH8DEHLeA";
  final String _openaiApiKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMTZhZjY3NzUtNDM0ZC00YzhiLWE5OTMtMzg0YjdhODgyOGYxIiwidHlwZSI6ImFwaV90b2tlbiJ9.-5jwvonLSSasi9EnAzxU-pezBuKFXqBX5Ikbz6Ybo3Q";

  void _handleAddUnit() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  void _handleDeleteLastUnit() {
    if (_controllers.length > 1) {
      setState(() {
        _controllers.removeLast();
      });
    }
  }

  Future<void> _generateVideosAndSummaries() async {
    await _fetchVideosAndSummaries();
  }

  Future<void> _fetchVideosAndSummaries() async {
    final List<String> videosArray = [];
    final List<String> summariesArray = [];
    for (final controller in _controllers) {
      try {
        final response = await http.get(
          Uri.parse(
              'https://www.googleapis.com/youtube/v3/search?key=$_apiKey&q=${controller.text}+recipe+for+lactose+intolerant+people+in+english&videoDuration=medium&videoEmbeddable=true&type=video&maxResults=1'),
        );
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String videoId = responseData['items'][0]['id']['videoId'];
        videosArray.add('https://www.youtube.com/embed/$videoId');
        final String summary = await _summarizeVideo(controller.text);
        summariesArray.add(summary);
      } catch (error) {
        print('Error fetching YouTube data: $error');
      }
    }
    setState(() {
      _videos.clear();
      _videos.addAll(videosArray);
      _videoSummaries.clear();
      _videoSummaries.addAll(summariesArray);
    });
  }

  Future<String> _summarizeVideo(String title) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.edenai.run/v2/text/generation'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_openaiApiKey',
        },
        body: json.encode({
          'providers': 'google',
          'text':
              'Write a random paragraph about the YouTube video related to $title.',
          'temperature': 0.2,
          'max_tokens': 500,
          'fallback_providers': '',
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('HTTP error! Status: ${response.statusCode}');
      }

      final Map<String, dynamic> data = json.decode(response.body);

      return data['google']['generated_text'];
    } catch (error) {
      print('Error generating summary: $error');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _controllers.first,
                decoration: const InputDecoration(
                  hintText: 'Enter the subtopic topic of the course',
                ),
              ),
            ),
            ..._videos.asMap().entries.map(
              (entry) {
                final int index = entry.key;
                final String videoUrl = entry.value;
                final String summary = _videoSummaries[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: const SizedBox(
                        height:
                            300, // Adjust the height as per your requirement
                        // child: WebviewScaffold(
                        //   url: videoUrl,
                        // ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Summary',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(summary),
                    ),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _handleAddUnit,
                  child: const Row(
                    children: [
                      Text('Add'),
                      Icon(Icons.add_circle),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _handleDeleteLastUnit,
                  child: const Row(
                    children: [
                      Text('Delete'),
                      Icon(Icons.delete),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _generateVideosAndSummaries,
                  child: const Row(
                    children: [
                      Text('Generate'),
                      Icon(Icons.add_circle),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
