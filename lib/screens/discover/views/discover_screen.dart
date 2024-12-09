import 'package:flutter/material.dart';

class DetectionHistoryScreen extends StatelessWidget {
  const DetectionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detection History'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
            leading: Icon(Icons.warning, color: Colors.orange),
            title: Text('Scam detected: Fake loan offer'),
            subtitle: Text('Date: 9 Dec 2024, 10:30 AM'),
          ),
          ListTile(
            leading: Icon(Icons.warning, color: Colors.orange),
            title: Text('Scam detected: Phishing attempt'),
            subtitle: Text('Date: 8 Dec 2024, 5:45 PM'),
          ),
        ],
      ),
    );
  }
}
