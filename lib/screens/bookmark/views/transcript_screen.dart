import 'package:flutter/material.dart';

class TranscriptScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transcripts = [
    {
      "callId": "9119230",
      "time": "Dec 9, 2024",
      "entries": [
        {"time": "10:00 AM", "speaker": "Caller", "message": "Hello, this is John from XYZ company."},
        {"time": "10:01 AM", "speaker": "You", "message": "Hi John, how can I help you?"},
        {"time": "10:02 AM", "speaker": "Caller", "message": "We are offering a limited-time investment opportunity."},
        {"time": "10:03 AM", "speaker": "You", "message": "I’m not interested, thank you."},
      ]
    },
    {
      "callId": "9112340",
      "time": "Dec 8, 2024",
      "entries": [
        {"time": "2:00 PM", "speaker": "Caller", "message": "Hi, we are offering a free vacation!"},
        {"time": "2:01 PM", "speaker": "You", "message": "Sounds too good to be true."},
        {"time": "2:02 PM", "speaker": "Caller", "message": "No, it’s absolutely real! Just share your credit card details."},
        {"time": "2:03 PM", "speaker": "You", "message": "No thanks, goodbye."},
      ]
    },
  ];

  TranscriptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Transcripts'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: transcripts.length,
        itemBuilder: (context, index) {
          final transcript = transcripts[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 0,
              child: ExpansionTile(
                title: Text(
                  transcript['callId'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(transcript['time']),
                children: [
                  ...transcript['entries'].map<Widget>((entry) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                entry['speaker'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: entry['speaker'] == "You" ? Colors.blue : Colors.black,
                                ),
                              ),
                              Text(
                                entry['time'],
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            entry['message'],
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Divider(thickness: 1),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
