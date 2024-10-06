import 'package:flutter/material.dart';
import 'package:flutter_adaptive_example/l10n/l10n.dart';
import 'package:flutter_adaptive_example/presentation/event_screen/view/event_page.dart';
import 'package:flutter_adaptive_example/ui_kit/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: UIColors.bgColor,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('ru'),
      home: const EventPage(),
    );
  }
}
