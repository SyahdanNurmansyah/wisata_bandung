import 'package:flutter/material.dart';

class ExpandedFlexibleWidget extends StatelessWidget {
  const ExpandedFlexibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ContainerWidget(
                    text: 'Expanded',
                    color: Colors.cyanAccent,
                  ),
                ),
                Flexible(
                  child: ContainerWidget(
                    text: 'Flexible',
                    color: Colors.tealAccent,
                  ),
                ),
                ContainerWidget(text: 'Container', color: Colors.pinkAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final String text;
  final Color color;
  const ContainerWidget({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(text, style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
