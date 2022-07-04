import 'package:flutter/material.dart';
import 'package:kaspertechtask/providers/auth.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context);
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          GestureDetector(
            onTap: authProvider.logout,
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.07,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 182, 29),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              child: const Text(
                'Log out',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
