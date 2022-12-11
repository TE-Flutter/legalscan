import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/file_reader.dart';

@immutable
class LoadingView extends StatefulWidget {
  StatelessWidget nextView;
  LoadingView({required this.nextView});
  @override
  LoadingViewState createState() => LoadingViewState(nextView: this.nextView);
}

class LoadingViewState extends State<LoadingView> {
  StatelessWidget nextView;
  LoadingViewState({required this.nextView});
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.push(context,
        MaterialPageRoute(builder: (context) => nextView)
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading'),
          ],
        ),
      ),
    );
  }
}
