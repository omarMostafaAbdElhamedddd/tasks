import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              // Profile Image Section
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.blue.shade100, width: 2),
                  ),
                  child: const Icon(Icons.person, size: 80, color: Colors.blue),
                ),
              ),
              const SizedBox(height: 15),
              // Name and Email Section
              const Text(
                "Mahmoud",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                "mahmoudelshawy2010@gmail.com",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              
              // Settings Card Section
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Username Row
                    ListTile(
                      leading: const Icon(Icons.alternate_email, color: Colors.blue),
                      title: const Text("Username"),
                      subtitle: const Text("mahmoud_dev"),
                      trailing: TextButton(
                        onPressed: () {},
                        child: const Text("change your username"),
                      ),
                    ),
                    const Divider(height: 1),
                    // Password Row
                    ListTile(
                      leading: const Icon(Icons.lock_outline, color: Colors.redAccent),
                      title: const Text("Password"),
                      subtitle: const Text("••••••••"),
                      trailing: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "change password",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}