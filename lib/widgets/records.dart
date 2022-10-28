import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mhh/models.dart';

class RecordItem extends StatelessWidget {
  final BloodPressureRecord record;
  const RecordItem({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat.yMd().format(record.date);
    final h6 = Theme.of(context).textTheme.titleLarge;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(dateStr, style: h6),
        const SizedBox(height: 4),
        Text(record.timeOfDay.value, style: h6),
      ],
    );
  }
}
