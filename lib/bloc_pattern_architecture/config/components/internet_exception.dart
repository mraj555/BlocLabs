import 'package:flutter/material.dart';

class InternetException extends StatelessWidget {
  final VoidCallback onPressed;

  const InternetException({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
        const Icon(Icons.cloud_off_rounded, color: Colors.red, size: 50),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text(
            "We're unable to show results.\nPlease check your data\nconnection.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20),
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
        ElevatedButton(
          onPressed: onPressed,
          child: Center(child: Text('RETRY', style: Theme.of(context).textTheme.bodySmall)),
        ),
      ],
    );
  }
}
