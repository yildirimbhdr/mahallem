import 'package:flutter/material.dart';

class PrivaryText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 32.0,
      child: Container(
        alignment: Alignment.center,
        child: Text.rich(
          TextSpan(
            style: TextStyle(
              fontFamily: 'Circular',
              fontSize: 13.0,
              color: const Color(0xFF242126),
              letterSpacing: 0.176,
            ),
            children: [
              TextSpan(
                text:
                    'By signing in, creating an account, or checking out as a Guest, you are agreeing to our',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              TextSpan(
                text: ' ',
                style: TextStyle(
                  color: const Color(0xFF00D6D8),
                  fontWeight: FontWeight.w300,
                ),
              ),
              TextSpan(
                text: 'Terms of Use',
                style: TextStyle(
                  color: const Color(0xFF242126),
                  fontWeight: FontWeight.w300,
                ),
              ),
              TextSpan(
                text: ' and our ',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              TextSpan(
                text: 'Privacy Policy',
                style: TextStyle(
                  color: const Color(0xFF242126),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
