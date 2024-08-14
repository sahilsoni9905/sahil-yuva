import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YearTextWidget extends StatelessWidget {
  const YearTextWidget({
    super.key,
    required this.text,
    required this.size,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final double size;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? Border.all(color: Color(0xFF41733D), width: 2)
              : null,
        ),
        padding: EdgeInsets.all(4),
        child: Text(
          text,
          style: GoogleFonts.josefinSans(
              color: Color(0xFF41733D),
              fontSize: size,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
