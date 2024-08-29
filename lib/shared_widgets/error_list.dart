import 'package:flutter/widgets.dart';

class ErrorList extends StatelessWidget {
  const ErrorList({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
