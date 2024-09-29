import 'package:flutter/material.dart';

import '../constants/styles.dart';

AppBar customAppBar() {
  return AppBar(
    toolbarHeight: 75,
    elevation: 0.0,
    backgroundColor: const Color(0xffFAFAFA),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today',
          style: Styles.textStyle25.copyWith(
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    ' ${DateFormat.EEEE().format(DateTime.now())}, ${DateTime.now().day},${DateFormat.MMM().format(DateTime.now())} ${DateTime.now().year}',
                    style: Styles.textStyle22.copyWith(color: Colors.grey)),
                const SizedBox(width: 23),
                const Icon(Icons.calendar_today, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}