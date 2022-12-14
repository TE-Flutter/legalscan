import 'package:flutter/material.dart';
import 'package:flutter_app/file_reader.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/structured_file.dart';

const Answers = [
  HeaderDescription(header: "What features does this app have?", description: "LegalScan can scan your legal document and extract most important entities of the text."),
  HeaderDescription(header: "What types of documents can I scan?", description: "You can upload only Rent Apartment Contract, Hiring Document, and Sales Contract"),
  HeaderDescription(header: "What languages are supported?", description: "Currently, only Russian and English are supported"),
  HeaderDescription(header: "How do I upload a document?", description: "You can upload a document by clicking on the Upload button on the home screen"),
  HeaderDescription(header: "Is it a final version of app?", description: "No, it is a prototype. It is not intended for commercial use"),
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
                          SizedBox(height: 20),
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