import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'NextofKinScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Profile Card
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    "https://i.imgur.com/IXnwbLk.png",
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Sepide",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "theflutterway@gmail.com",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),

          // Next of Kin Section
          ListTile(
            leading: SvgPicture.asset(
              "assets/icons/Order.svg",
              height: 24,
              width: 24,
              colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
            ),
            title: const Text("Next of Kin"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NextOfKinScreen()),
              );
            },
          ),

          const Divider(),

          // Other Profile Options
          // ListTile(
          //   leading: SvgPicture.asset(
          //     "assets/icons/Return.svg",
          //     height: 24,
          //     width: 24,
          //     colorFilter:
          //     const ColorFilter.mode(Colors.green, BlendMode.srcIn),
          //   ),
          //   title: const Text("Returns"),
          //   trailing: const Icon(Icons.arrow_forward_ios),
          //   onTap: () {},
          // ),
          // ListTile(
          //   leading: SvgPicture.asset(
          //     "assets/icons/Wishlist.svg",
          //     height: 24,
          //     width: 24,
          //     colorFilter: const ColorFilter.mode(Colors.pink, BlendMode.srcIn),
          //   ),
          //   title: const Text("Wishlist"),
          //   trailing: const Icon(Icons.arrow_forward_ios),
          //   onTap: () {},
          // ),
          const Divider(),

          // Log Out Button
          ListTile(
            leading: SvgPicture.asset(
              "assets/icons/Logout.svg",
              height: 24,
              width: 24,
              colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
            ),
            title: const Text(
              "Log Out",
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              // Log out logic here
            },
          ),
        ],
      ),
    );
  }
}
