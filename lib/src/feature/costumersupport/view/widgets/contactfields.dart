import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  ContactInfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.black, size: 24),
        const SizedBox(width: 10),
        Text(
          text,
          style: GoogleFonts.poppins(
              color: Colors.black
          ),
        ),
      ],
    );
  }
}

class ContactFormField extends StatelessWidget {
  final String label;
  final int maxLines;

  ContactFormField({required this.label, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: TextFormField(
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: 'Enter your $label',
                hintStyle: GoogleFonts.lato(fontSize: 16),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}