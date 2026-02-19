import 'package:flutter/material.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';

class UnderDevelopment extends StatelessWidget {
  final String pageName;
  const UnderDevelopment({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pageName)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction, size: 80, color: Colors.grey),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.pageUnderDevelopment,
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
