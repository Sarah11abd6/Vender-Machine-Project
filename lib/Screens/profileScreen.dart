

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:vender_machine/providers/auth.dart';

class ProfileScrean extends StatelessWidget {
  // final Future<void> Function() logoutAction;
  // final UserProfile? user;

  const ProfileScrean({final Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storage=GetStorage();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 4),
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/human.png'),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Name: ${storage.read('email')}'),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: ()  {
                Provider.of<Auth>(context,listen: false).logOut();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
