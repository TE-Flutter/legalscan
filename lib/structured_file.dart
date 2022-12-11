import 'package:flutter/material.dart';
import 'package:flutter_app/file_reader.dart';

// Define a class that represents a single header and description
class HeaderDescription {
  final String header;
  final String description;

  HeaderDescription({required this.header, required this.description});
}

// Define the main Flutter widget that will display the headers and descriptions
class HeaderDescriptionView extends StatelessWidget {
  final List<HeaderDescription> headerDescriptions;

  HeaderDescriptionView({required this.headerDescriptions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
            child: Stack(
              children:[
                  ListView.builder(
                  itemCount: headerDescriptions.length,
                  itemBuilder: (context, index) {
                    return Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            headerDescriptions[index].header,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
                          ),
                          Text(
                            headerDescriptions[index].description,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 20),

                            ),
                            Divider(color: Colors.black),
                        ],
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    width: double.infinity,
                    child: 
                    
                      ElevatedButton(child: Text('Upload another file'), onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FileReader())
                        );
                      },)
                    )
                  
                  )
              ]),
),
        );
  }
}