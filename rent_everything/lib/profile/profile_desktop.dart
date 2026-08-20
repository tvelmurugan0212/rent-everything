import 'package:flutter/material.dart';
import '../common_widgets/desktop_drawer.dart';

class ProfileDesktop extends StatelessWidget {
  const ProfileDesktop({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF111111);
  static const Color greyText = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return DesktopLayout(
      pageTitle: 'Users',
      child: Container(
        color: const Color(0xFFF8FAFC),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(55, 46, 55, 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =========================
              // TITLE
              // =========================
              const Text(
                'Users',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: darkText,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Manage renters and lenders',
                style: TextStyle(fontSize: 14, color: greyText),
              ),

              const SizedBox(height: 40),

              // =========================
              // STAT CARDS
              // =========================
              Row(
                children: const [
                  Expanded(
                    child: UserStatCard(title: 'Total Users', value: '1,248'),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: UserStatCard(title: 'Renters', value: '320'),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: UserStatCard(title: 'Lenders', value: '850'),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: UserStatCard(title: 'Suspended', value: '78'),
                  ),
                ],
              ),

              const SizedBox(height: 46),

              // =========================
              // ALL USERS
              // =========================
              const Text(
                'All Users',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: darkText,
                ),
              ),

              const SizedBox(height: 30),

              // =========================
              // SEARCH + FILTER
              // =========================
              Row(
                children: [
                  Container(
                    width: 410,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFD1D5DB)),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const TextField(
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Search by name or email',
                        hintStyle: TextStyle(
                          color: Color(0xFFB5B5B5),
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          size: 22,
                          color: Color(0xFF8B8B8B),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 11),
                      ),
                    ),
                  ),

                  const Spacer(),

                  Container(
                    height: 41,
                    width: 106,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Filter',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        SizedBox(width: 15),
                        Icon(Icons.keyboard_arrow_down_rounded, size: 20),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // =========================
              // USERS TABLE
              // =========================
              const UsersTable(),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// STAT CARD
// ============================================================

class UserStatCard extends StatelessWidget {
  final String title;
  final String value;

  const UserStatCard({super.key, required this.title, required this.value});

  static const Color primaryColor = Color(0xFF0674A1);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// USERS TABLE
// ============================================================

class UsersTable extends StatelessWidget {
  const UsersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(28, 24, 28, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const _UserTableHeader(),

          const Divider(height: 22, color: Color(0xFFD1D5DB)),

          const UserTableRow(
            name: 'Rahul Kumar',
            email: 'rahul@email.com',
            role: 'Renter',
            joined: 'Aug 08',
            status: 'Active',
            statusColor: Color(0xFF8756F5),
          ),

          const UserTableRow(
            name: 'Amith Kumar',
            email: 'amith@email.com',
            role: 'Lender',
            joined: 'Aug 08',
            status: 'Confirmed',
            statusColor: Color(0xFF4285F4),
          ),

          const UserTableRow(
            name: 'Priya Sharma',
            email: 'priya@email.com',
            role: 'Renter',
            joined: 'Aug 07',
            status: 'Pending',
            statusColor: Color(0xFFFFA000),
          ),

          const UserTableRow(
            name: 'Arun Kumar',
            email: 'arun@email.com',
            role: 'Lender',
            joined: 'Aug 06',
            status: 'Cancelled',
            statusColor: Color(0xFFDC2626),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// TABLE HEADER
// ============================================================

class _UserTableHeader extends StatelessWidget {
  const _UserTableHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text(
            'User',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Text(
            'Email',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Text(
            'Role',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Text(
            'Joined',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Text(
            'Status',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          width: 55,
          child: Text(
            'Action',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// TABLE ROW
// ============================================================

class UserTableRow extends StatelessWidget {
  final String name;
  final String email;
  final String role;
  final String joined;
  final String status;
  final Color statusColor;

  const UserTableRow({
    super.key,
    required this.name,
    required this.email,
    required this.role,
    required this.joined,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFD1D5DB))),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),

          Expanded(
            child: Text(
              email,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),

          Expanded(
            child: Text(
              role,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),

          Expanded(
            child: Text(
              joined,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 14),
                Text(
                  status,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),

          SizedBox(
            width: 55,
            child: PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.more_vert_rounded,
                size: 22,
                color: Colors.black,
              ),
              onSelected: (value) {},
              itemBuilder: (context) => const [
                PopupMenuItem(value: 'view', child: Text('View')),
                PopupMenuItem(value: 'edit', child: Text('Edit')),
                PopupMenuItem(value: 'delete', child: Text('Delete')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
