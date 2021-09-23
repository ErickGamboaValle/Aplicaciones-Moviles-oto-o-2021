
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Primera app'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.grey[600],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Colors.grey[200],
                    ),
                    Text("Like"),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.thumb_down,
                      color: Colors.grey[200],
                    ),
                    Text("Dislike"),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Colors.grey[200],
                    ),
                    Text("Share"),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Colors.grey[200],
                    ),
                    Text("Save"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
