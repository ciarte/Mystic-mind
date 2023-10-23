import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const HeadingWidget({
    super.key,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (title != null)
            Text(
              title!,
              style: GoogleFonts.macondo(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: GoogleFonts.krub(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
