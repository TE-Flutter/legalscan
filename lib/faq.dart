import 'package:flutter/material.dart';
import 'package:flutter_app/file_reader.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/structured_file.dart';

const Answers = [
  HeaderDescription(header: "What is the meaning of life?", description: "42"),
  HeaderDescription(header: "How do I learn flutter?", description: "It's impossible")
];

// Define the main Flutter widget that will display the headers and descriptions
class FAQView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
            child: Stack(
              children:[
                  ListView.builder(
                  itemCount: Answers.length,
                  itemBuilder: (context, index) {
                    return Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Answers[index].header,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
                          ),
                          Text(
                            Answers[index].description,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 20),

                            ),
                            Divider(color: Colors.black),
                        ],
                    );
                  },
                ),
              ]),
),
        );
  }
}