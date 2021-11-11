import 'package:flutter/material.dart';
import 'package:keep_note_clone/colors.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: bgColor,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sync',style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),),
                Transform.scale(
                  scale: 1.3,
                  child: Switch.adaptive(value: value, onChanged: (switchvalue) {
                    setState(() {
                      this.value = switchvalue;
                    });
                  },
                  inactiveTrackColor: Colors.white38,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
