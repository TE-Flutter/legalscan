import 'package:flutter/material.dart';
import 'package:flutter_app/doctypes_search.dart';
import 'package:flutter_app/spinner.dart';
import 'package:flutter_app/structured_file.dart';

@immutable
class FileReader extends StatefulWidget {
  @override
  FileReaderState createState() => FileReaderState();
}

class FileReaderState extends State<FileReader> {
  var language = "RU";
  var mock_docs = {
    "RU": [
      HeaderDescription(header: "Cекция 1", description: "Описание 1"),
      HeaderDescription(header: "Cекция 2", description: "Описание 2"),
      HeaderDescription(header: "Cекция 3", description: "Описание 3"),
    ],
    "EN": [
      HeaderDescription(header: "Section 1", description: "Description 1"),
      HeaderDescription(header: "Section 2", description: "Description 2"),
      HeaderDescription(header: "Section 3", description: "Description 3"),
    ],
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Upload new document',
              style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              DoctypesSearch(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Choose document\'s language'),
                  SizedBox(width: 5),
              DropdownButton<String>(
              value: language,
              items: [
                DropdownMenuItem(
                  value: "RU",
                  child: Text("Russian"),
                ),
                DropdownMenuItem(
                  value: "EN",
                  child: Text("English"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  this.language = value!;
                 });
                print(value);
                
              },
            ),
                ],
              ),
              
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoadingView(nextView: 
                    HeaderDescriptionView(headerDescriptions: mock_docs[language]!))));
                },
                child: Text('Upload'),
              ),
            ],
          ),
    ));
  }
}