// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../common_widgets/desktop_drawer.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF111111);
  static const Color greyText = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return DesktopLayout(
      pageTitle: 'Dashboard',
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(48, 42, 48, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ============================================
            // TITLE
            // ============================================
            const Text(
              'Dashboard',
              style: TextStyle(
                color: darkText,
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Overview of RentEverything',
              style: TextStyle(
                color: greyText,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 34),

            // ============================================
            // STAT CARDS
            // ============================================
            Row(
              children: const [
                Expanded(
                  child: DashboardStatCard(
                    title: 'Total Users',
                    value: '5,240',
                  ),
                ),
                SizedBox(width: 36),
                Expanded(
                  child: DashboardStatCard(
                    title: 'Total Products',
                    value: '1,856',
                  ),
                ),
                SizedBox(width: 36),
                Expanded(
                  child: DashboardStatCard(
                    title: 'Total Bookings',
                    value: '1,248',
                  ),
                ),
                SizedBox(width: 36),
                Expanded(
                  child: DashboardStatCard(
                    title: 'Revenue',
                    value: '₹2,45,000',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 44),

            // ============================================
            // REVENUE + BOOKING OVERVIEW
            // ============================================
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // REVENUE
                Expanded(flex: 6, child: _RevenueSection()),

                const SizedBox(width: 42),

                // VERTICAL LINE
                Container(
                  width: 1,
                  height: 320,
                  color: const Color(0xFFD1D5DB),
                ),

                const SizedBox(width: 88),

                // BOOKING OVERVIEW
                const Expanded(flex: 4, child: _BookingOverview()),
              ],
            ),

            const SizedBox(height: 38),

            // ============================================
            // RECENT BOOKINGS TITLE
            // ============================================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Bookings',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),

                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text(
                        'View All',
                        style: TextStyle(color: primaryColor, fontSize: 14),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 18,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // ============================================
            // BOOKINGS TABLE
            // ============================================
            const RecentBookingsTable(),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// STAT CARD
// ============================================================

class DashboardStatCard extends StatelessWidget {
  final String title;
  final String value;

  const DashboardStatCard({
    super.key,
    required this.title,
    required this.value,
  });

  static const Color primaryColor = Color(0xFF0674A1);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
          const SizedBox(height: 12),
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
// REVENUE SECTION
// ============================================================

class _RevenueSection extends StatelessWidget {
  const _RevenueSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Revenue Overview',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
            ),

            const SizedBox(width: 14),

            Container(
              height: 37,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Text('Last 6 months', style: TextStyle(fontSize: 14)),
                  SizedBox(width: 24),
                  Icon(Icons.keyboard_arrow_down_rounded, size: 18),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 26),

        SizedBox(
          height: 280,
          child: CustomPaint(
            painter: RevenueChartPainter(),
            child: const SizedBox.expand(),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// REVENUE CHART
// ============================================================

class RevenueChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final chartLeft = 58.0;
    final chartRight = size.width - 10;
    final chartTop = 20.0;
    final chartBottom = size.height - 40;

    final axisPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.2;

    canvas.drawLine(
      Offset(chartLeft, chartTop),
      Offset(chartLeft, chartBottom),
      axisPaint,
    );

    canvas.drawLine(
      Offset(chartLeft, chartBottom),
      Offset(chartRight, chartBottom),
      axisPaint,
    );

    // Y-axis labels
    const labels = ['₹50K', '₹40K', '₹30K', '₹20K', '₹10K'];

    for (int i = 0; i < labels.length; i++) {
      final y = chartTop + (i * 42);

      final textPainter = TextPainter(
        text: TextSpan(
          text: labels[i],
          style: const TextStyle(color: Colors.black, fontSize: 11),
        ),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      textPainter.paint(
        canvas,
        Offset(chartLeft - textPainter.width - 8, y - 7),
      );
    }

    // Curve
    final path = Path();

    final points = [
      Offset(chartLeft, chartBottom - 8),
      Offset(chartLeft + 55, chartBottom - 42),
      Offset(chartLeft + 115, chartBottom - 20),
      Offset(chartLeft + 155, chartBottom - 12),
      Offset(chartLeft + 160, chartBottom - 90),
      Offset(chartLeft + 190, chartBottom - 105),
      Offset(chartLeft + 225, chartBottom - 50),
      Offset(chartLeft + 260, chartBottom - 28),
      Offset(chartLeft + 275, chartBottom - 115),
      Offset(chartLeft + 315, chartBottom - 135),
      Offset(chartLeft + 350, chartBottom - 88),
      Offset(chartLeft + 385, chartBottom - 42),
      Offset(chartRight - 12, chartBottom - 190),
    ];

    path.moveTo(points.first.dx, points.first.dy);

    for (int i = 1; i < points.length; i++) {
      final previous = points[i - 1];
      final current = points[i];

      final control1 = Offset(
        previous.dx + (current.dx - previous.dx) / 2,
        previous.dy,
      );

      final control2 = Offset(
        previous.dx + (current.dx - previous.dx) / 2,
        current.dy,
      );

      path.cubicTo(
        control1.dx,
        control1.dy,
        control2.dx,
        control2.dy,
        current.dx,
        current.dy,
      );
    }

    final fillPath = Path.from(path)
      ..lineTo(chartRight - 12, chartBottom)
      ..lineTo(chartLeft, chartBottom)
      ..close();

    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        const Color(0xFF0674A1).withOpacity(.9),
        const Color(0xFF0674A1).withOpacity(.05),
      ],
    );

    final fillPaint = Paint()
      ..shader = gradient.createShader(
        Rect.fromLTWH(
          chartLeft,
          chartTop,
          chartRight - chartLeft,
          chartBottom - chartTop,
        ),
      );

    canvas.drawPath(fillPath, fillPaint);

    // X labels
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];

    for (int i = 0; i < months.length; i++) {
      final x = chartLeft + ((chartRight - chartLeft) / 5) * i;

      final textPainter = TextPainter(
        text: TextSpan(
          text: months[i],
          style: const TextStyle(color: Colors.black, fontSize: 11),
        ),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, chartBottom + 14),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// ============================================================
// BOOKING OVERVIEW
// ============================================================

class _BookingOverview extends StatelessWidget {
  const _BookingOverview();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Booking Overview',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 40),
        BookingStatusRow(
          color: Color(0xFFFFA000),
          title: 'Pending',
          value: '13',
        ),
        SizedBox(height: 18),
        BookingStatusRow(
          color: Color(0xFF4285F4),
          title: 'Confirmed',
          value: '463',
        ),
        SizedBox(height: 18),
        BookingStatusRow(
          color: Color(0xFF8756F5),
          title: 'Active',
          value: '243',
        ),
        SizedBox(height: 18),
        BookingStatusRow(
          color: Color(0xFF16A34A),
          title: 'Completed',
          value: '873',
        ),
        SizedBox(height: 18),
        BookingStatusRow(
          color: Color(0xFFDC2626),
          title: 'Cancelled',
          value: '98',
        ),
      ],
    );
  }
}

class BookingStatusRow extends StatelessWidget {
  final Color color;
  final String title;
  final String value;

  const BookingStatusRow({
    super.key,
    required this.color,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Text(value, style: const TextStyle(fontSize: 16, color: Colors.black)),
      ],
    );
  }
}

// ============================================================
// RECENT BOOKINGS TABLE
// ============================================================

class RecentBookingsTable extends StatelessWidget {
  const RecentBookingsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(28, 22, 28, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const _TableHeader(),

          const Divider(height: 20, color: Color(0xFFD1D5DB)),

          _BookingTableRow(
            id: '#BK1024',
            product: 'Innova',
            lender: 'John',
            amount: '₹2,500',
            status: 'Active',
            statusColor: Color(0xFF8756F5),
          ),

          const Divider(height: 1, color: Color(0xFFD1D5DB)),

          _BookingTableRow(
            id: '#BK1029',
            product: 'Camera',
            lender: 'Ravi',
            amount: '₹800',
            status: 'Confirmed',
            statusColor: Color(0xFF4285F4),
          ),

          const Divider(height: 1, color: Color(0xFFD1D5DB)),

          _BookingTableRow(
            id: '#BK1026',
            product: 'MacBook',
            lender: 'May',
            amount: '₹3,000',
            status: 'Pending',
            statusColor: Color(0xFFFFA000),
          ),

          const Divider(height: 1, color: Color(0xFFD1D5DB)),

          _BookingTableRow(
            id: '#BK1022',
            product: 'Bike',
            lender: 'Jai',
            amount: '₹600',
            status: 'Cancelled',
            statusColor: Color(0xFFDC2626),
          ),
        ],
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text(
            'Booking ID',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Text(
            'Product',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Text(
            'Lender',
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
            'Status',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class _BookingTableRow extends StatelessWidget {
  final String id;
  final String product;
  final String lender;
  final String amount;
  final String status;
  final Color statusColor;

  const _BookingTableRow({
    required this.id,
    required this.product,
    required this.lender,
    required this.amount,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(child: Text(id, style: const TextStyle(fontSize: 14))),
          Expanded(child: Text(product, style: const TextStyle(fontSize: 14))),
          Expanded(child: Text(lender, style: const TextStyle(fontSize: 14))),
          Expanded(child: Text(amount, style: const TextStyle(fontSize: 14))),
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
                const SizedBox(width: 12),
                Text(status, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
