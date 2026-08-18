// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

Widget paymentCard() {
  return Container(
    padding: const EdgeInsets.fromLTRB(0, 18, 12, 14),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Payment Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(height: 8),

        const Divider(height: 1, color: Color(0xFFE0E0E0)),

        const SizedBox(height: 15),

        _priceRow('Rental Charge', '₹2,300'),

        const SizedBox(height: 15),

        _priceRow('Service Fee', '₹100'),

        const SizedBox(height: 15),

        _priceRow('Security Deposit', '₹5,000'),

        const SizedBox(height: 16),

        const Divider(height: 1, color: Color(0xFFE0E0E0)),

        const SizedBox(height: 14),

        _priceRow('Total Amount', '₹6,900', bold: true),
      ],
    ),
  );
}

Widget _priceRow(String title, String value, {bool bold = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: bold ? 16 : 14,
          fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
          color: Colors.black,
        ),
      ),
      Text(
        value,
        style: TextStyle(
          fontSize: bold ? 16 : 14,
          fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
          color: Colors.black,
        ),
      ),
    ],
  );
}
