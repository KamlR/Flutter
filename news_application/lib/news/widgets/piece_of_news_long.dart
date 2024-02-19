import 'package:flutter/material.dart';

class NewsDetailsLong extends StatelessWidget {
  final String labelText;
  final String valueText;

  const NewsDetailsLong({
    Key? key,
    required this.labelText,
    required this.valueText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$labelText: ',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Text(
          valueText,
          style: Theme.of(context).textTheme.bodyMedium
        ),
      ],
    ),
    );
  }
}
