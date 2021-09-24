import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive/config/style.dart';
import 'package:flutter_responsive/helpers/scale_helper.dart';
import 'package:flutter_responsive/models/choise.dart';

class ScalePage extends StatefulWidget {
  const ScalePage({Key? key}) : super(key: key);

  @override
  _ScalePageState createState() => _ScalePageState();
}

class _ScalePageState extends State<ScalePage> {
  static const List<Choice> choices = <Choice>[
    Choice(title: 'Home', icon: Icons.home),
    Choice(title: 'Contact', icon: Icons.contacts),
    Choice(title: 'Map', icon: Icons.map),
    Choice(title: 'Phone', icon: Icons.phone),
    Choice(title: 'Camera', icon: Icons.camera_alt),
    Choice(title: 'Setting', icon: Icons.settings),
    Choice(title: 'Album', icon: Icons.photo_album),
    Choice(title: 'WiFi', icon: Icons.wifi),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      ScaleHelper.init(context, const Size(1180, 820));
      return Scaffold(
          appBar: AppBar(
            title: const Text("Scale page"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.sw),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Hello word!!",
                      style: textPageTitle(context),
                      textScaleFactor: ScaleHelper.fontScale),
                  SizedBox(height: 16.sw),
                  const Text("Today is 24/9/2021."),
                  SizedBox(height: 16.sw),
                  SizedBox(
                    height: 150.sw,
                    child: ListView.builder(
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return _imageItem(index + 1);
                      },
                    ),
                  ),
                  SizedBox(height: 16.sw),
                  GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      crossAxisSpacing: 16.sw,
                      mainAxisSpacing: 16.sw,
                      children: List.generate(choices.length, (index) {
                        return SelectCard(choice: choices[index]);
                      }))
                ],
              ),
            ),
          ));
    });
  }

  Widget _imageItem(int imgName) {
    return SizedBox(
        width: 200.sw,
        child:
            Image.asset('assets/galleries/$imgName.jpeg', fit: BoxFit.cover));
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.orange,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Icon(choice.icon,
                        size: 50.sw, color: textCardTitle(context).color)),
                Padding(
                  padding: EdgeInsets.all(16.sw),
                  child: Text(choice.title,
                      style: textCardTitle(context),
                      textScaleFactor: ScaleHelper.fontScale),
                ),
              ]),
        ));
  }
}
