import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shop/main.dart';
import 'package:shop/screens/infoscam/info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // Trigger the notification after 1 second
    Timer(const Duration(seconds: 1), () {
      print("Timer");
      showNotification(
        "Your Next of Kin Uncle Lim may be getting scammed!",
        "Click on me to find out more.",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ScamShield AI"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Section
              const Text(
                "Stay Scam-Free",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Learn. Monitor. Protect.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 24),

              // Scam Info Hub Section
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Scam Info Hub",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Discover common scam tactics and terms frequently used by scammers. Stay informed and vigilant!",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _buildInfoChip(context, "Phishing"),
                          _buildInfoChip(context, "Urgency"),
                          _buildInfoChip(context, "One-Time Password (OTP)"),
                          _buildInfoChip(context, "Fake Loan Offers"),
                          _buildInfoChip(context, "Suspicious Links"),
                          _buildInfoChip(context, "Too Good to Be True"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Quick Tips Section
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Quick Scam Prevention Tips",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildTipRow(Icons.warning_amber_rounded,
                          "Never share your OTP with anyone."),
                      const SizedBox(height: 12),
                      _buildTipRow(
                          Icons.link_off, "Avoid clicking on unknown links."),
                      const SizedBox(height: 12),
                      _buildTipRow(Icons.call, "Verify unknown callers."),
                      const SizedBox(height: 12),
                      _buildTipRow(Icons.money_off,
                          "Beware of offers that seem too good to be true."),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoDetailScreen(title: text),
          ),
        );

        // Optionally trigger a notification when the chip is tapped
        Timer(const Duration(seconds: 1), () {
          showNotification(
            "Learn More About $text!",
            "Explore details on $text to stay scam-free.",
          );
        });
      },
      child: Chip(
        label: Text(text),
        avatar: const Icon(Icons.info_outline, size: 18),
        backgroundColor: Colors.blue[50],
        labelStyle: const TextStyle(color: Colors.blue),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
    );
  }

  Widget _buildTipRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.orange, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
