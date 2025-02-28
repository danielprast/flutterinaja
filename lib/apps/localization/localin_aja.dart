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

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: Locale(localeId),
      child: Builder(
        builder: (ctx) {
          final localization = AppLocalizations.of(ctx)!;
          return Scaffold(
            appBar: AppBar(
              title: Text(localization.flutterinaja_hello),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (localeId == 'en') {
                              localeId = 'id';
                            } else {
                              localeId = 'en';
                            }
                          });
                        },
                        child: Text('${localization.toggle_it}!'),
                      ),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
