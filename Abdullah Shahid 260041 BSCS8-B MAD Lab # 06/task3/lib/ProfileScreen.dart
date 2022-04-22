import 'package:flutter/material.dart';
import './TopNavigationScreen.dart';
import './ProfileArguments.dart';
import './ProfileItem.dart';
import './BottomNavigationScreen.dart';

class ProfileScreen extends StatelessWidget {
  static const route = '/profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileInfo =
        ModalRoute.of(context)?.settings.arguments as ProfileArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 150,
              height: 150,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              profileInfo.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Profileitem(
                icon: Icons.phone, label: 'Phone', text: profileInfo.phone),
            Profileitem(
                icon: Icons.mail, label: 'Email', text: profileInfo.email),
            Profileitem(
                icon: Icons.attractions,
                label: 'Biometric',
                isSwitch: true,
                switchVal: profileInfo.biometric),
            Profileitem(
                icon: Icons.location_pin,
                label: 'Address',
                text: profileInfo.address),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(TopNavigationScreen.route),
              child: const Text('Top Tab Navigation'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(BottomNavigationScreen.route),
              child: const Text('Bottom Tab Navigation'),
            ),
          ],
        ),
      ),
    );
  }
}
