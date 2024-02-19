import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsShort extends StatelessWidget {
  final String labelText;
  final String valueText;

  const NewsDetailsShort({
    super.key,
    required this.labelText,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '$labelText: ',
             style: Theme.of(context).textTheme.labelMedium,
        
        ),
        Flexible(
          child: valueText.contains("https")
          ?GestureDetector(
            onTap: () {
              final Uri url = Uri.parse(valueText);
              launchUrl(url);
            },
            child: Text(
              valueText,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          )
          : Flexible(
              child: Text(
              valueText,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ),
          
        ],
      ),
    );
  }
}
