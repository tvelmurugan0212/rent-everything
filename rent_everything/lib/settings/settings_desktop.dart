import 'package:flutter/material.dart';

class SettingsDesktop extends StatelessWidget {
  const SettingsDesktop({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF202938);
  static const Color greyText = Color(0xFF5F5F5F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Settings',
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
            width: 1000,
            child: ListView(
              padding: const EdgeInsets.all(28),
              children: [
                // Account Section
                const SettingsSectionTitle(title: 'Account'),
                const SizedBox(height: 16),
                const SettingsItemTile(
                  icon: Icons.person_outline,
                  title: 'Edit Profile',
                  subtitle: 'Update your profile information',
                ),
                const SizedBox(height: 14),
                const SettingsItemTile(
                  icon: Icons.lock_outline,
                  title: 'Change Password',
                  subtitle: 'Update your password',
                ),
                const SizedBox(height: 28),
                // Preferences Section
                const SettingsSectionTitle(title: 'Preferences'),
                const SizedBox(height: 16),
                const SettingsToggleTile(
                  icon: Icons.notifications_outlined,
                  title: 'Push Notifications',
                  subtitle: 'Receive rental updates and offers',
                ),
                const SizedBox(height: 14),
                const SettingsToggleTile(
                  icon: Icons.mail_outline,
                  title: 'Email Notifications',
                  subtitle: 'Receive emails about bookings',
                ),
                const SizedBox(height: 28),
                // Support Section
                const SettingsSectionTitle(title: 'Support'),
                const SizedBox(height: 16),
                const SettingsItemTile(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  subtitle: 'Contact our support team',
                ),
                const SizedBox(height: 14),
                const SettingsItemTile(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy Policy',
                  subtitle: 'Read our privacy guidelines',
                ),
                const SizedBox(height: 14),
                const SettingsItemTile(
                  icon: Icons.description_outlined,
                  title: 'Terms & Conditions',
                  subtitle: 'Review our terms',
                ),
                const SizedBox(height: 28),
                // App Section
                const SettingsSectionTitle(title: 'About'),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'App Version',
                        style: TextStyle(
                          color: darkText,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'v1.0.0',
                        style: TextStyle(
                          color: greyText,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                // Logout Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade50,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsSectionTitle extends StatelessWidget {
  final String title;

  const SettingsSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF202938),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class SettingsItemTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SettingsItemTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFE0F2FE),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFF0674A1), size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF202938),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF5F5F5F),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 20,
            color: Color(0xFF9CA3AF),
          ),
        ],
      ),
    );
  }
}

class SettingsToggleTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SettingsToggleTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  State<SettingsToggleTile> createState() => _SettingsToggleTileState();
}

class _SettingsToggleTileState extends State<SettingsToggleTile> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFE0F2FE),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(widget.icon, color: const Color(0xFF0674A1), size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Color(0xFF202938),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.subtitle,
                  style: const TextStyle(
                    color: Color(0xFF5F5F5F),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: isEnabled,
            onChanged: (value) {
              setState(() {
                isEnabled = value;
              });
            },
            activeThumbColor: const Color(0xFF0674A1),
          ),
        ],
      ),
    );
  }
}
