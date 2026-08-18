import 'package:flutter/material.dart';

class ProfileDesktop extends StatelessWidget {
  const ProfileDesktop({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF000000);
  static const Color greyText = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: darkText,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 1100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(28),
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/images/profile.png',
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 24),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jack Smith',
                              style: TextStyle(
                                color: darkText,
                                fontSize: 34,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '+91 98765 43210',
                              style: TextStyle(color: greyText, fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 28,
                      right: 28,
                      bottom: 28,
                    ),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: const [
                        ProfileTile(
                          title: 'Edit Profile',
                          icon: Icons.person_outline,
                        ),
                        ProfileTile(
                          title: 'My Rentals',
                          icon: Icons.car_rental,
                        ),
                        ProfileTile(
                          title: 'Saved Items',
                          icon: Icons.favorite_border,
                        ),
                        ProfileTile(
                          title: 'Notifications',
                          icon: Icons.notifications_none,
                        ),
                        ProfileTile(
                          title: 'Help & Support',
                          icon: Icons.help_outline,
                        ),
                        SizedBox(height: 10),
                        LogoutButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String title;
  final IconData icon;

  const ProfileTile({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF0674A1), size: 28),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF111827),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      onTap: () {},
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0674A1),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Logout',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
