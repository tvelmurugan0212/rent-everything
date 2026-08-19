import 'package:flutter/material.dart';
import 'booking_conform_mobile.dart';

class BookingConformDesktop extends StatelessWidget {
  const BookingConformDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Booking Confirmation'),
        backgroundColor: const Color(0xFF0674A1),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: SizedBox(
          width: 1200,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: BookingConformMobile.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Booking Confirmed!',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your rental has been booked successfully.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 36),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _vehicleCard()),
                    const SizedBox(width: 28),
                    Expanded(child: _detailsCard()),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 360,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.receipt_long_outlined),
                    label: const Text('View My Bookings'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: BookingConformMobile.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(color: BookingConformMobile.primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _vehicleCard() => Container(
    padding: const EdgeInsets.all(24),
    decoration: _boxDecoration(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Rental Details',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 22),
        Row(
          children: [
            const SizedBox(
              width: 100,
              height: 100,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: BookingConformMobile.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Icon(
                  Icons.directions_car,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(width: 18),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Toyota Fortuner 2023',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 8),
                Text('Booking ID: RE-20481', style: TextStyle(fontSize: 14)),
                SizedBox(height: 5),
                Text('5 days rental', style: TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
      ],
    ),
  );

  Widget _detailsCard() => Container(
    padding: const EdgeInsets.all(24),
    decoration: _boxDecoration(),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Confirmation Details',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 22),
        _DesktopInfoRow(
          icon: Icons.calendar_today_rounded,
          title: 'Rental Period',
          value: '24 Aug - 29 Aug 2026',
        ),
        Divider(height: 28),
        _DesktopInfoRow(
          icon: Icons.location_on_outlined,
          title: 'Pickup Location',
          value: 'Chennai, Tamil Nadu',
        ),
        Divider(height: 28),
        _DesktopInfoRow(
          icon: Icons.payments_outlined,
          title: 'Amount Paid',
          value: '₹14,750',
        ),
      ],
    ),
  );

  BoxDecoration _boxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: const Color(0xFFE5E7EB)),
  );
}

class _DesktopInfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  const _DesktopInfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(icon, color: BookingConformMobile.primaryColor, size: 23),
      const SizedBox(width: 14),
      Expanded(child: Text(title, style: const TextStyle(fontSize: 14))),
      Text(
        value,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    ],
  );
}
