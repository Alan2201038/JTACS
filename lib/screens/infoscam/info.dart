import 'package:flutter/material.dart';

class InfoDetailScreen extends StatelessWidget {
  final String title;

  const InfoDetailScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Text to display based on the title
    final String detailsText = title == "Phishing"
        ? '''
Phishing is a type of scam where attackers impersonate trusted entities to steal sensitive information like passwords, credit card details, or personal information.

Common phishing tactics include:
- Email phishing: Fraudulent emails appearing from legitimate sources.
- Voice phishing (Vishing): Calls pretending to be from trusted organizations.
- Text phishing (Smishing): SMS messages with malicious links or fake offers.

Protect yourself by:
1. Avoiding links from unknown sources.
2. Verifying sender information.
3. Using multi-factor authentication.

Stay cautious and protect your data.
'''
        : 'Details about $title';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Textbox-like Card
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    detailsText,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
