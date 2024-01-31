import 'package:flutter/material.dart';
import 'package:chat_de_voz/consts.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ToSpeech extends StatefulWidget {
  const ToSpeech({Key? key}) : super(key: key);

  @override
  _ToSpeechState createState() => _ToSpeechState();
}

class _ToSpeechState extends State<ToSpeech> {
  FlutterTts _flutterTts = FlutterTts();
  String _spokenText = "";

  int? _currentWordStart, _currentWordEnd;

  @override
  void initState() {
    super.initState();
    initTTS();
  }

  void initTTS() async {
    await _flutterTts.setLanguage("es-ES"); // Establece el idioma a español
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _speak(TTS_INPUT); // Llama al método _speak con el texto deseado
        },
        child: const Icon(Icons.speaker_phone),
      ),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _spokenText, // Muestra el texto que se está leyendo
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Future<void> _speak(String text) async {
    setState(() {
      _spokenText = text; // Actualiza el texto que se está leyendo
    });
    await _flutterTts
        .speak(text); // Hace que el Text to Speech lea el texto proporcionado
  }

  /*Widget _speakerSelector() {
    return DropdownButton(
      value: _currentVoice,
      items: _voices
          .map(
            (_voice) => DropdownMenuItem(
              value: _voice,
              child: Text(
                _voice["name"],
              ),
            ),
          )
          .toList(),
      onChanged: (value) {},
    );
  } */
}
