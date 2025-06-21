import 'package:expenz_flutter/services/user_data_services.dart';
import 'package:flutter/material.dart';
import 'package:expenz_flutter/widgets/home_page_widgets/home_header_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "";
  @override
  void initState() {
    UserDataServices.getUserNameAndEmail().then((value) {
      if (value['username'] != null) {
        setState(() {
          username = value['username']!;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [HomeHeaderCard(username: username)]),
        ),
      ),
    );
  }
}
