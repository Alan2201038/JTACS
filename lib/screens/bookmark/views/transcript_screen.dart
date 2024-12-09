import 'package:flutter/material.dart';

class TranscriptScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transcripts = [
  {
    "callId": "91192308",
    "time": "Dec 9, 2024",
    "entries": [
      {"time": "10:00 AM", "speaker": "Caller", "message": "Hello, this is Alex from ABC Bank’s fraud detection team. We’ve detected suspicious activity on your account."},
      {"time": "10:01 AM", "speaker": "You", "message": "Oh no, what kind of activity?"},
      {"time": "10:02 AM", "speaker": "Caller", "message": "There was an unauthorized transfer of 1,200 attempted to an international account. To secure your funds, we need to verify your identity immediately."},
      {"time": "10:03 AM", "speaker": "You", "message": "That’s strange. What do I need to do?"},
      {"time": "10:04 AM", "speaker": "Caller", "message": "I’ve just sent a One-Time Password (OTP) to your registered mobile number. Please read it out to me so I can authenticate and block the transaction."},
      {"time": "10:05 AM", "speaker": "You", "message": "Wait, how do I know this is actually from ABC Bank?"},
      {"time": "10:06 AM", "speaker": "Caller", "message": "I completely understand your concern. You can verify our fraud department’s number on the back of your bank card. But please act fast, as this transfer is pending and could go through any minute."},
      {"time": "10:07 AM", "speaker": "You", "message": "Let me check my account first."},
      {"time": "10:08 AM", "speaker": "Caller", "message": "If you don’t provide the OTP now, we won’t be able to block the transfer in time, and your money could be lost. This is urgent for your account’s safety."},
      {"time": "10:09 AM", "speaker": "You", "message": "I’ll call the bank directly, thank you."},
    ]
  },
  {
    "callId": "9112340",
    "time": "Dec 8, 2024",
    "entries": [
      {"time": "3:00 PM", "speaker": "Caller", "message": "Hi, this is Rachel from XYZ Bank. We’re reaching out because your account has been compromised."},
      {"time": "3:01 PM", "speaker": "You", "message": "Compromised? What happened?"},
      {"time": "3:02 PM", "speaker": "Caller", "message": "Someone attempted to log in to your account from an unrecognized device in a foreign country. For your protection, we need to reset your account access."},
      {"time": "3:03 PM", "speaker": "You", "message": "That’s concerning. What do I need to do?"},
      {"time": "3:04 PM", "speaker": "Caller", "message": "I’m sending you a secure OTP via SMS. Please share it with me so I can lock your account and prevent further access."},
      {"time": "3:05 PM", "speaker": "You", "message": "Shouldn’t I just reset my password instead?"},
      {"time": "3:06 PM", "speaker": "Caller", "message": "That’s part of the process, but I need the OTP first to initiate the security lock. This is standard protocol to ensure your safety."},
      {"time": "3:07 PM", "speaker": "You", "message": "Alright, let me check my messages first."},
      {"time": "3:08 PM", "speaker": "Caller", "message": "Please don’t delay. Time is critical here. If the hacker completes their login, your funds could be at risk."},
      {"time": "3:09 PM", "speaker": "You", "message": "I’ll contact the bank directly, thank you."},
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
                          const Divider(thickness: 0.1),
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
