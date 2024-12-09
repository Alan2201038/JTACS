import 'package:flutter/material.dart';

class NextOfKinScreen extends StatefulWidget {
  const NextOfKinScreen({Key? key}) : super(key: key);

  @override
  State<NextOfKinScreen> createState() => _NextOfKinScreenState();
}

class _NextOfKinScreenState extends State<NextOfKinScreen> {
  final List<Map<String, dynamic>> nextOfKinList = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool notifyEmergencyContact = false; // Checkbox state

  void addNextOfKin() {
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();

    if (name.isNotEmpty && phone.isNotEmpty) {
      setState(() {
        nextOfKinList.add({
          "name": name,
          "phone": phone,
          "notify": notifyEmergencyContact, // Save checkbox value
        });
      });

      nameController.clear();
      phoneController.clear();
      notifyEmergencyContact = false; // Reset checkbox state

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Next of Kin added!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill out all fields.")),
      );
    }
  }

  void removeNextOfKin(int index) {
    setState(() {
      nextOfKinList.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Next of Kin removed!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Next of Kin"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Add Next of Kin Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: notifyEmergencyContact,
                  onChanged: (value) {
                    setState(() {
                      notifyEmergencyContact = value!;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    "Do you wish for your emergency contact to receive notification of the potential scam call?",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: addNextOfKin,
              child: const Text("Save Next of Kin"),
            ),
            const SizedBox(height: 24),
            const Text(
              "Next of Kin List",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: nextOfKinList.length,
                itemBuilder: (context, index) {
                  final kin = nextOfKinList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(kin['name']!),
                      subtitle: Text("Phone: ${kin['phone']}\nNotify: ${kin['notify'] ? 'Yes' : 'No'}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => removeNextOfKin(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
