import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class FilePickerTest extends StatelessWidget {
  const FilePickerTest({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String fileType = 'All';
  var fileTypeList = ['All', 'Image', 'Document'];
  FilePickerResult? result;
  PlatformFile? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Selected File Type:  ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                DropdownButton(
                  value: fileType,
                  items: fileTypeList.map((String type) {
                    return DropdownMenuItem(
                        value: type,
                        child: Text(
                          type,
                          style: TextStyle(fontSize: 20),
                        ));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      fileType = value!;
                      file = null;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                pickFiles(fileType);
              },
              child: Text('Pick file'),
            ),
            if (file != null) fileDetails(file!),
            if (file != null)
              ElevatedButton(
                onPressed: () {
                  viewFile(file!);
                },
                child: Text('View Selected File'),
              )
          ],
        ),
      ),
    );
  }

  Widget fileDetails(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('File Name: ${file.name}'),
          Text('File Size: $size'),
          Text('File Extension: ${file.extension}'),
          Text('File Path: ${file.path}'),
        ],
      ),
    );
  }

  void pickFiles(String? filetype) async {
    switch (filetype) {
      case 'Image':
        result = await FilePicker.platform.pickFiles(type: FileType.image);
        if (result == null) return;
        file = result!.files.first;
        setState(() {});
        break;
      case 'All':
        result = await FilePicker.platform.pickFiles();
        if (result == null) return;
        file = result!.files.first;
        setState(() {});
        break;
      case 'Document':
        result = await FilePicker.platform.pickFiles(type: FileType.any);
        if (result == null) return;
        file = result!.files.first;
        setState(() {});
        break;
    }
  }

  // open the picked file
  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}
