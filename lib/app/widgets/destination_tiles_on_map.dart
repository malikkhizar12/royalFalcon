import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DestinationTile extends StatelessWidget {
  final String title;
  final Function(String) onSelected;

  const DestinationTile({required this.title, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(title),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Icon(Icons.circle, color: Colors.grey, size: 16),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
