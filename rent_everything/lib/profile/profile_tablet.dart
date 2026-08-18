import 'package:flutter/material.dart';

class ProfileTablet extends StatelessWidget {
  const ProfileTablet({super.key});

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
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 620,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/images/profile.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jack Smith',
                              style: TextStyle(
                                color: darkText,
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '+91 98765 43210',
                              style: TextStyle(color: greyText, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Column(
                      children: [
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
