import 'package:flutter/material.dart';

class LanguageTranslation extends StatefulWidget {
  const LanguageTranslation({super.key});

  @override
  State<LanguageTranslation> createState() => _LanguageTranslationState();
}

class _LanguageTranslationState extends State<LanguageTranslation> {

  var languages = [
    'Hindi',
    'English',
    'Marthi',
  ];

var originLanguage = "From";
var destinationLanguage = "To";
var output = "";
TextEditingController languageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff10223d),
      appBar: AppBar(
        title: Text("Language Translator",), centerTitle: true,
        backgroundColor: Color(0xff10223d),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    items: items, 
                    onChanged: onChanged
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}