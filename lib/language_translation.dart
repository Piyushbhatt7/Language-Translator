import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslation extends StatefulWidget {
  const LanguageTranslation({super.key});

  @override
  State<LanguageTranslation> createState() => _LanguageTranslationState();
}

class _LanguageTranslationState extends State<LanguageTranslation> {
  final translator = GoogleTranslator();

  // ✅ 1. LANGUAGE LIST – Add or remove languages here
  final List<String> languages = ['Hindi', 'English', 'Marathi', 'Arabic'];

  // ✅ 2. These will hold the selected languages
  String? originLanguage;
  String? destinationLanguage;

  String output = "";
  TextEditingController languageController = TextEditingController();

  // ✅ 3. Language codes used for translation – You can add more here
  final Map<String, String> languageCodes = {
    'English': 'en',
    'Hindi': 'hi',
    'Marathi': 'mr',
    'Arabic': 'ar',
    // Add more like: 'Spanish': 'es',
  };

  // ✅ 4. Translation logic
  void translateText() async {
    if (originLanguage == null || destinationLanguage == null || languageController.text.isEmpty) {
      setState(() {
        output = "Please select languages and enter text.";
      });
      return;
    }

    try {
      var translation = await translator.translate(
        languageController.text,
        from: languageCodes[originLanguage]!,
        to: languageCodes[destinationLanguage]!,
      );

      setState(() {
        output = translation.text;
      });
    } catch (e) {
      setState(() {
        output = "Translation failed: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff10223d), // ✅ 5. Background color of the whole screen
      appBar: AppBar(
        title: Text("Language Translator", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff10223d),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.0),

              // ✅ 6. Language dropdowns
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // From Language
                  DropdownButton<String>(
                    dropdownColor: Colors.white,
                    hint: Text("From", style: TextStyle(color: Colors.white)), // White placeholder
                    value: originLanguage,
                    style: TextStyle(color: Colors.black), // ✅ FIXED: black text on white dropdown
                    iconEnabledColor: Colors.white,
                    items: languages.map((String language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        originLanguage = value;
                      });
                    },
                  ),

                  SizedBox(width: 20.0),
                  Icon(Icons.arrow_forward, color: Colors.white),
                  SizedBox(width: 20.0),

                  // To Language
                  DropdownButton<String>(
                    dropdownColor: Colors.white,
                    hint: Text("To", style: TextStyle(color: Colors.white)),
                    value: destinationLanguage,
                    style: TextStyle(color: Colors.black), // ✅ FIXED
                    iconEnabledColor: Colors.white,
                    items: languages.map((String language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        destinationLanguage = value;
                      });
                    },
                  ),
                ],
              ),

              SizedBox(height: 30.0),

              // ✅ 7. Input Text Field
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: languageController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Please Enter your text...',
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  cursorColor: Colors.white,
                ),
              ),

              // ✅ 8. Translate Button – always clickable
              ElevatedButton(
                onPressed: translateText,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // ✅ Change button color here
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text("Translate", style: TextStyle(fontSize: 16)),
              ),

              SizedBox(height: 30),

              // ✅ 9. Output Text – shown after translation
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  output,
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
