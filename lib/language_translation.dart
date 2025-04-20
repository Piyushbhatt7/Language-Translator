import 'package:flutter/material.dart';

class LanguageTranslation extends StatefulWidget {
  const LanguageTranslation({super.key});

  @override
  State<LanguageTranslation> createState() => _LanguageTranslationState();
}

class _LanguageTranslationState extends State<LanguageTranslation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff10223d),
      appBar: AppBar(
        title: Text("Language Translator",), centerTitle: true,
        backgroundColor: Color(0xff10223d),
      ),
    );
  }
}