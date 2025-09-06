import 'package:flutter/material.dart';

class OpenOptions extends StatefulWidget {
  const OpenOptions({super.key});

  @override
  State<OpenOptions> createState() => _OpenOptions();
}

class _OpenOptions extends State<OpenOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Options Page'),
    );
  }
}