import 'package:flutter/material.dart';
import 'package:flutter_responsive/config/style.dart';
import 'package:flutter_responsive/layouts/default_layout.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      pageName: "About page",
      appBar: AppBar(
        title: const Text("About us"),
      ),
      body: _cardContent(),
    );
  }

  _cardContent() {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Title",
              style: textCardTitle(context),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Start creating your amazing application!"),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Footer"),
          ),
        ],
      ),
    );
  }
}
