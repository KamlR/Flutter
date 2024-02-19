import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/theme/theme.dart';
import 'package:test_project/theme/theme_provider.dart';

enum SingingCharacter {lightMode, darkMode}

class ChooseTheme extends StatefulWidget {
  const ChooseTheme({super.key});

  @override
  State<ChooseTheme> createState() => _ChooseThemeState();
}

class _ChooseThemeState extends State<ChooseTheme> {
  SingingCharacter? _character;
  @override
  void initState() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    _character = themeProvider.getThemeData == lightMode
        ? SingingCharacter.lightMode
        : SingingCharacter.darkMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Светлая тема'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.lightMode,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
                Provider.of<ThemeProvider>(context, listen: false).changeTheme();
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Тёмная тема'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.darkMode,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
                Provider.of<ThemeProvider>(context, listen: false).changeTheme();
              });
            },
          ),
        ),
      ],
    );
  }
}