import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/providers/theme_provider.dart';
import 'package:test_project/theme/theme.dart';

void main(){
  testWidgets('Theme value must change', (WidgetTester tester) async { 
    await tester.runAsync(() async {
      ThemeData expectedTheme;
      ThemeProvider themeProvider = ThemeProvider();
      ThemeData lastThemeData = themeProvider.getThemeData;
      themeProvider.changeTheme();
      if(lastThemeData == lightMode){
        expectedTheme = darkMode;
      }
      else{
        expectedTheme = lightMode;
      }
      await tester.pump();
      expect(themeProvider.getThemeData, expectedTheme);

      lastThemeData = themeProvider.getThemeData;
      themeProvider.changeTheme();
      if(lastThemeData == lightMode){
        expectedTheme = darkMode;
      }
      else{
        expectedTheme = lightMode;
      }
      await tester.pump();
      expect(themeProvider.getThemeData, expectedTheme);
    });
  });
}