import 'package:flutter/material.dart';
import 'package:flutter_app/faq.dart';
import 'package:flutter_app/file_reader.dart';
import 'package:flutter_app/user_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.document_scanner)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.question_answer)),
            ],
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            FileReader(),
            UserScreen(),
            FAQView()
          ],
        ),
      ),
    );
  }
}


