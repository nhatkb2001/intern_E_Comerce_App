import 'package:flutter/cupertino.dart';

class atDashboardScreen extends StatefulWidget {
  const atDashboardScreen({Key? key}) : super(key: key);

  @override
  State<atDashboardScreen> createState() => _atDashboardScreenState();
}

class _atDashboardScreenState extends State<atDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Dashboard',
        style: TextStyle(fontSize: 100),
      ),
    );
  }
}
