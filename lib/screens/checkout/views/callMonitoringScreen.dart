import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class CallMonitoringScreen extends StatefulWidget {
  const CallMonitoringScreen({Key? key}) : super(key: key);

  @override
  State<CallMonitoringScreen> createState() => _CallMonitoringScreenState();
}

class _CallMonitoringScreenState extends State<CallMonitoringScreen> {
  bool isScamDetected = false;

  // Simulate scam detection
  void detectScam() async {
    setState(() {
      isScamDetected = true;
    });

    // Trigger vibration if supported
    if (await Vibrate.canVibrate) {
      Vibrate.vibrate();
    }

    // Show scam alert modal
    _showScamAlertModal();
  }

  // Show scam alert as a modal bottom sheet
  void _showScamAlertModal() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24.0),
          decoration: const BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Possible Scam Alert!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "This call has been flagged as a possible scam. Proceed with caution and do not share your personal information!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24.0),
                ),
                onPressed: () {
                  Navigator.pop(context); // Dismiss the modal
                  setState(() {
                    isScamDetected = false;
                  });
                },
                child: const Text("Dismiss"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Call Monitoring"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Call Monitoring",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "Monitoring your ongoing call for potential scams...",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
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
                      "Scam Detection Status",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: detectScam,
                      child: const Text("Simulate Scam Detection"),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      isScamDetected
                          ? "⚠️ Scam Detected! Modal Triggered."
                          : "No scams detected during the call.",
                      style: TextStyle(
                        fontSize: 16,
                        color: isScamDetected ? Colors.red : Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
