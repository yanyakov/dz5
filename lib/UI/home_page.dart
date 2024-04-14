import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isEditing = false;
  String name = '';
  String city = '';
  String age = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile').tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
            ),
            SizedBox(height: 20),
            buildProfileField('name').tr(args: ['#Name']),
            buildProfileField('city').tr(args: ['#City']),
            buildProfileField('age').tr(args: ['#Age']),
            SizedBox(height: 20),
            isEditing
                ? ElevatedButton(
                    onPressed: () {
                      // Добавить логику сохранения данных
                      setState(() {
                        isEditing = false;
                      });
                    },
                    child: Text('save').tr())
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEditing = true;
                      });
                    },
                    child: Text('edit').tr()),
          ],
        ),
      ),
    );
  }

  Widget buildProfileField(String label) {
    String hintText = 'enter_$label'.tr();
    return Row(
      children: [
        Text(label.tr(), style: TextStyle(fontSize: 18)),
        SizedBox(width: 10),
        Expanded(
          child: isEditing
              ? TextField(
                  onChanged: (newValue) {
                    // Добавить логику обновления данных
                    setState(() {
                      if (label == 'name') {
                        name = newValue;
                      } else if (label == 'city') {
                        city = newValue;
                      } else if (label == 'age') {
                        age = newValue;
                      }
                    });
                  },
                  decoration: InputDecoration(
                    hintText: hintText,
                  ),
                )
              : Text('#$label', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
