import 'package:flutter/material.dart';

class TranscriptScreen extends StatelessWidget {
  final List<Map<String, String>> transcriptData = [
    {"time": "10:00 AM", "speaker": "Caller", "message": "Hello, this is John from XYZ company."},
    {"time": "10:01 AM", "speaker": "You", "message": "Hi John, how can I help you?"},
    {"time": "10:02 AM", "speaker": "Caller", "message": "We are offering a limited-time investment opportunity."},
    {"time": "10:03 AM", "speaker": "You", "message": "I’m not interested, thank you."},
  ];

  const TranscriptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Transcript'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: transcriptData.length,
          itemBuilder: (context, index) {
            final entry = transcriptData[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${entry['time']} - ${entry['speaker']}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: entry['speaker'] == "You" ? Colors.blue : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    entry['message']!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
