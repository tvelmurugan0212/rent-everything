import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF000000);
  static const Color greyText = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // =====================================================
                      // LOGO
                      // =====================================================
                      const SizedBox(height: 45),

                      Image.asset(
                        'assets/images/logo.png',
                        width: 123,
                        height: 98,
                        fit: BoxFit.contain,
                      ),
                      const Text(
                        'Rent Everything',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: darkText,
                          // fontStyle: FontStyle.italic,
                        ),
                      ),
                      // =====================================================
                      // WELCOME BACK
                      // =====================================================
                      const SizedBox(height: 33),

                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: darkText,
                          height: 1.2,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Sign in to continue.',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: greyText,
                          height: 1.2,
                        ),
                      ),

                      // =====================================================
                      // MOBILE NUMBER
                      // =====================================================
                      const SizedBox(height: 37),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Mobile Number',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            height: 1.2,
                          ),
                        ),
                      ),

                      const SizedBox(height: 11),

                      TextField(
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter Mobile Number',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF888888),
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 13,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: const BorderSide(
                              color: Color(0xFFE1E1E1),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: const BorderSide(
                              color: Color(0xFFE1E1E1),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: const BorderSide(
                              color: primaryColor,
                              width: 1,
                            ),
                          ),
                        ),
                      ),

                      // =====================================================
                      // CONTINUE BUTTON
                      // =====================================================
                      const SizedBox(height: 35),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/otp');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),

                      // =====================================================
                      // OR
                      // =====================================================
                      const SizedBox(height: 28),

                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: Color(0xFF999999),
                              thickness: 1,
                            ),
                          ),

                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Text(
                              'or',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          const Expanded(
                            child: Divider(
                              color: Color(0xFF999999),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),

                      // =====================================================
                      // GOOGLE BUTTON
                      // =====================================================
                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 51,
                        child: OutlinedButton(
                          onPressed: () {
                            Get.toNamed('/home');
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            side: const BorderSide(
                              color: primaryColor,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Actual Google image
                              Image.asset(
                                'assets/images/google-logo.png',
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                              ),

                              const SizedBox(width: 13),

                              const Text(
                                'Continue with Google',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // =====================================================
                      // SIGN UP
                      // =====================================================
                      const SizedBox(height: 26),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),

                          TextButton(
                            onPressed: () {
                              Get.toNamed('/register');
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14,
                                color: primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // =====================================================
                      // TERMS & PRIVACY
                      // =====================================================
                      const SizedBox(height: 26),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 14,
                              color: greyText,
                              height: 1.55,
                            ),
                            children: [
                              TextSpan(
                                text: 'By continuing, you agree to our ',
                              ),

                              TextSpan(
                                text: 'Terms & Conditions',
                                style: TextStyle(
                                  color: primaryColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: primaryColor,
                                ),
                              ),

                              TextSpan(text: '\nand '),

                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: primaryColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
