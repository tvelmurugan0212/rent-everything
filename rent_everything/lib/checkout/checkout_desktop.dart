import 'package:flutter/material.dart';

class CheckoutDesktop extends StatefulWidget {
  const CheckoutDesktop({super.key});

  @override
  State<CheckoutDesktop> createState() => _CheckoutDesktopState();
}

class _CheckoutDesktopState extends State<CheckoutDesktop> {
  String selectedPaymentMethod = 'credit_card';
  final promoController = TextEditingController();
  bool promoApplied = false;

  @override
  void dispose() {
    promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Color(0xFF0674A1),
        elevation: 0,
        title: Text(
          'Checkout',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 1200,
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Column - Booking Summary & Promo
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Booking Summary Card
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Color(0xFFE8E8E8)),
                          ),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Booking Summary',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF202938),
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF0674A1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      Icons.directions_car,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Toyota Fortuner 2023',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF202938),
                                          ),
                                        ),
                                        Text(
                                          '5 Days • ₹15,000',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF5F5F5F),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24),

                        // Promo Code Section
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Color(0xFFE8E8E8)),
                          ),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Apply Promo Code',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF202938),
                                ),
                              ),
                              SizedBox(height: 14),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: promoController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter promo code',
                                        hintStyle: TextStyle(
                                          color: Color(0xFF5F5F5F),
                                          fontSize: 14,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE8E8E8),
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        promoApplied = true;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF0674A1),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 14,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      'Apply',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (promoApplied)
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    '✓ Promo code applied successfully',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 32),

                  // Right Column - Payment & Price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Payment Method Section
                        Text(
                          'Payment Method',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF202938),
                          ),
                        ),
                        SizedBox(height: 14),
                        _buildPaymentOption(
                          'credit_card',
                          'Credit Card',
                          Icons.credit_card,
                        ),
                        _buildPaymentOption(
                          'debit_card',
                          'Debit Card',
                          Icons.payment,
                        ),
                        _buildPaymentOption(
                          'wallet',
                          'Digital Wallet',
                          Icons.account_balance_wallet,
                        ),
                        _buildPaymentOption('upi', 'UPI', Icons.qr_code),
                        SizedBox(height: 24),

                        // Price Breakdown
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Color(0xFFE8E8E8)),
                          ),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              _priceRow('Daily Rate (5 days)', '₹3,000 x 5'),
                              _priceRow('Delivery Charges', '₹500'),
                              _priceRow('Insurance', '₹750'),
                              if (promoApplied)
                                _priceRow(
                                  'Discount (Promo)',
                                  '-₹500',
                                  isDiscount: true,
                                ),
                              Divider(color: Color(0xFFE8E8E8), height: 20),
                              _priceRow(
                                'Total Amount',
                                promoApplied ? '₹14,750' : '₹15,250',
                                isBold: true,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24),

                        // Pay Now Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Processing payment...'),
                                  backgroundColor: Color(0xFF0674A1),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0674A1),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Pay Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),

                        // Security Notice
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Color(0xFFE8E8E8)),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Icon(
                                Icons.lock,
                                color: Color(0xFF0674A1),
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Your payment is secured with 256-bit encryption',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF5F5F5F),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

  Widget _buildPaymentOption(String value, String label, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = value;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selectedPaymentMethod == value
                ? Color(0xFF0674A1)
                : Color(0xFFE8E8E8),
            width: selectedPaymentMethod == value ? 2 : 1,
          ),
        ),
        padding: EdgeInsets.all(14),
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Icon(
              icon,
              color: selectedPaymentMethod == value
                  ? Color(0xFF0674A1)
                  : Color(0xFF5F5F5F),
            ),
            SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF202938),
              ),
            ),
            Spacer(),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selectedPaymentMethod == value
                      ? Color(0xFF0674A1)
                      : Color(0xFFE8E8E8),
                  width: 2,
                ),
              ),
              child: selectedPaymentMethod == value
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0674A1),
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceRow(
    String label,
    String value, {
    bool isBold = false,
    bool isDiscount = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isBold ? 16 : 14,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
              color: isDiscount ? Colors.green : Color(0xFF5F5F5F),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isBold ? 16 : 14,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
              color: isDiscount ? Colors.green : Color(0xFF202938),
            ),
          ),
        ],
      ),
    );
  }
}
