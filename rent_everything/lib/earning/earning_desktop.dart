import 'package:flutter/material.dart';

import '../common_widgets/desktop_drawer.dart';

class EarningDesktop extends StatelessWidget {
  const EarningDesktop({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF111111);
  static const Color greyText = Color(0xFF737B8C);
  static const Color pageBackground = Color(0xFFF8FAFC);

  @override
  Widget build(BuildContext context) {
    return DesktopLayout(
      pageTitle: 'Payments',
      child: Container(
        color: pageBackground,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(44, 42, 45, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ------------------------------------------------
              // PAGE HEADER
              // ------------------------------------------------
              const Text(
                'Payments',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: darkText,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Manage transactions, refunds and payouts.',
                style: TextStyle(fontSize: 14, color: greyText),
              ),

              const SizedBox(height: 40),

              // ------------------------------------------------
              // STAT CARDS
              // ------------------------------------------------
              Row(
                children: const [
                  Expanded(
                    child: PaymentStatCard(
                      title: 'Total Revenue',
                      value: '₹2,45,800',
                    ),
                  ),
                  SizedBox(width: 35),
                  Expanded(
                    child: PaymentStatCard(title: 'Successful', value: '1,180'),
                  ),
                  SizedBox(width: 35),
                  Expanded(
                    child: PaymentStatCard(title: 'Pending', value: '₹18,500'),
                  ),
                  SizedBox(width: 35),
                  Expanded(
                    child: PaymentStatCard(title: 'Refunds', value: '₹12,400'),
                  ),
                ],
              ),

              const SizedBox(height: 42),

              // ------------------------------------------------
              // PAYMENT ACTIVITY
              // ------------------------------------------------
              const Text(
                'Payment Activity',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: darkText,
                ),
              ),

              const SizedBox(height: 30),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(child: PaymentStatusCard()),
                  SizedBox(width: 35),
                  Expanded(child: PaymentMethodsCard()),
                  SizedBox(width: 35),
                  Expanded(child: PayoutSummaryCard()),
                ],
              ),

              const SizedBox(height: 42),

              // ------------------------------------------------
              // RECENT TRANSACTIONS
              // ------------------------------------------------
              const Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: darkText,
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 380,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFD1D5DB)),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const TextField(
                      style: TextStyle(fontSize: 13),
                      decoration: InputDecoration(
                        hintText: 'Search transaction ID, user or booking...',
                        hintStyle: TextStyle(
                          color: Color(0xFFB8BCC5),
                          fontSize: 13,
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          size: 21,
                          color: Color(0xFF8A8F98),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),

                  Container(
                    height: 38,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'Filter',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        SizedBox(width: 18),
                        Icon(Icons.keyboard_arrow_down_rounded, size: 20),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 36),

              // ------------------------------------------------
              // TRANSACTION TABLE
              // ------------------------------------------------
              const TransactionTable(),
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

class PaymentStatCard extends StatelessWidget {
  final String title;
  final String value;

  const PaymentStatCard({super.key, required this.title, required this.value});

  static const Color primaryColor = Color(0xFF0674A1);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(8),
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
          const SizedBox(height: 14),
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
// COMMON ACTIVITY CARD
// ============================================================

class ActivityCard extends StatelessWidget {
  final String title;
  final Widget child;

  const ActivityCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 268,
      padding: const EdgeInsets.fromLTRB(34, 32, 34, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(child: child),
        ],
      ),
    );
  }
}

// ============================================================
// PAYMENT STATUS
// ============================================================

class PaymentStatusCard extends StatelessWidget {
  const PaymentStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ActivityCard(
      title: 'Payment Status',
      child: Column(
        children: const [
          StatusNumberRow(
            color: Color(0xFF16A34A),
            title: 'Successful',
            value: '1080',
          ),
          StatusNumberRow(
            color: Color(0xFFF59E0B),
            title: 'Pending',
            value: '43',
          ),
          StatusNumberRow(
            color: Color(0xFFEF2B2D),
            title: 'Failed',
            value: '33',
          ),
          StatusNumberRow(
            color: Color(0xFF3B82F6),
            title: 'Refunded',
            value: '56',
          ),
        ],
      ),
    );
  }
}

class StatusNumberRow extends StatelessWidget {
  final Color color;
  final String title;
  final String value;

  const StatusNumberRow({
    super.key,
    required this.color,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PAYMENT METHODS
// ============================================================

class PaymentMethodsCard extends StatelessWidget {
  const PaymentMethodsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ActivityCard(
      title: 'Payment Methods',
      child: Column(
        children: const [
          PaymentMethodRow(title: 'UPI', value: '345'),
          PaymentMethodRow(title: 'Credit/Debit Card', value: '443'),
          PaymentMethodRow(title: 'Google Pay', value: '343'),
          PaymentMethodRow(title: 'PhonePe', value: '56'),
        ],
      ),
    );
  }
}

class PaymentMethodRow extends StatelessWidget {
  final String title;
  final String value;

  const PaymentMethodRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PAYOUT SUMMARY
// ============================================================

class PayoutSummaryCard extends StatelessWidget {
  const PayoutSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ActivityCard(
      title: 'Payout Summary',
      child: Column(
        children: const [
          PayoutRow(title: 'Total', value: '₹1,85,000'),
          PayoutRow(title: 'Completed', value: '₹1,66,500'),
          PayoutRow(title: 'Pending', value: '₹18,500'),
          PayoutRow(title: 'Failed', value: '₹2,000'),
        ],
      ),
    );
  }
}

class PayoutRow extends StatelessWidget {
  final String title;
  final String value;

  const PayoutRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// TRANSACTION TABLE
// ============================================================

class TransactionTable extends StatelessWidget {
  const TransactionTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(32, 20, 32, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Column(
        children: [
          TransactionHeader(),

          Divider(height: 20, color: Color(0xFFD1D5DB)),

          TransactionRow(
            id: '#PAY1024',
            user: 'Ravi',
            booking: 'Innova',
            amount: '₹2,500',
            method: 'UPI',
            status: 'Active',
            statusColor: Color(0xFF8756F5),
          ),

          TransactionRow(
            id: '#PAY1023',
            user: 'Rahul',
            booking: 'Camera',
            amount: '₹800',
            method: 'Google Pay',
            status: 'Confirmed',
            statusColor: Color(0xFF3B82F6),
          ),

          TransactionRow(
            id: '#PAY1025',
            user: 'May',
            booking: 'MacBook',
            amount: '₹3,000',
            method: 'UPI',
            status: 'Pending',
            statusColor: Color(0xFFF59E0B),
          ),

          TransactionRow(
            id: '#PAY1021',
            user: 'Jai',
            booking: 'Bike',
            amount: '₹600',
            method: 'Google Pay',
            status: 'Cancelled',
            statusColor: Color(0xFFEF2B2D),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// TABLE HEADER
// ============================================================

class TransactionHeader extends StatelessWidget {
  const TransactionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            'Transaction ID',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Text(
            'User',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Text(
            'Booking',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Text(
            'Amount',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Text(
            'Method',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Text(
            'Status',
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

class TransactionRow extends StatelessWidget {
  final String id;
  final String user;
  final String booking;
  final String amount;
  final String method;
  final String status;
  final Color statusColor;

  const TransactionRow({
    super.key,
    required this.id,
    required this.user,
    required this.booking,
    required this.amount,
    required this.method,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFD1D5DB))),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(id, style: const TextStyle(fontSize: 14)),
          ),
          Expanded(child: Text(user, style: const TextStyle(fontSize: 14))),
          Expanded(child: Text(booking, style: const TextStyle(fontSize: 14))),
          Expanded(child: Text(amount, style: const TextStyle(fontSize: 14))),
          Expanded(child: Text(method, style: const TextStyle(fontSize: 14))),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 14),
                Text(status, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
