import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final class LocalizationApp extends StatelessWidget {
  //
  const LocalizationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Localin Aja',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('id'),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const RoostFormPage(),
      home: const LocalizeWidget(),
    );
  }
}

class LocalizeWidget extends StatefulWidget {
  //
  const LocalizeWidget({super.key});

  @override
  State<LocalizeWidget> createState() => _LocalizeWidgetState();
}

class _LocalizeWidgetState extends State<LocalizeWidget> {
  //
  String localeId = 'en';
  bool useSystemLocale = false;

  @override
  Widget build(BuildContext context) {
    if (useSystemLocale) {
      return _LocalePage(context);
    }
    return Localizations.override(
      context: context,
      locale: Locale(localeId),
      child: Builder(
        builder: (ctx) {
          return _LocalePage(ctx);
        },
      ),
    );
  }

  Widget _LocalePage(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localization.flutterinaja_hello),
      ),
      body: SafeArea(
        child: Column(
          spacing: 16,
          children: [
            Spacer(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  useSystemLocale = true;
                });
              },
              child: const Text('System Locale'),
            ),
            Row(
              spacing: 16,
              children: [
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      useSystemLocale = false;
                      localeId = 'id';
                    });
                  },
                  child: const Text('Bahasa'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      useSystemLocale = false;
                      localeId = 'en';
                    });
                  },
                  child: const Text('English'),
                ),
                Spacer(),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
