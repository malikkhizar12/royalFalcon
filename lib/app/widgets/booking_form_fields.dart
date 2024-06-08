import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import DateFormat for date formatting

class CustomFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;

  const CustomFormField({Key? key, required this.label, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (label == 'Booking Date') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 5)
            ,
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 45,
            child: GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF22272B),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFCF9D2C)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    suffixIcon: Image.asset('images/calender_icon.png',
                      color: Color(0xFFCF9D2C),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 45,
            child: TextFormField(
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF22272B),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFCF9D2C)),
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller?.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }
}
