import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  String? _modelName;
  final String _apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';

  // Fungsi untuk mencari model yang aktif secara otomatis (Copy logika kawanmu)
  Future<void> _initModel() async {
    if (_modelName != null) return;
    
    final url = Uri.parse('https://generativelanguage.googleapis.com/v1/models?key=$_apiKey');
    
    try {
      final response = await http.get(url);
      final data = jsonDecode(response.body);

      for (final model in data['models']) {
        final methods = model['supportedGenerationMethods'] ?? [];
        if (methods.contains('generateContent')) {
          _modelName = model['name']; // Biasanya hasilnya "models/gemini-1.5-flash"
          break;
        }
      }
    } catch (e) {
      print("Gagal inisialisasi model: $e");
    }
  }

  Future<String> sendMessage(String prompt) async {
    if (_apiKey.isEmpty) return "API Key belum diatur.";

    try {
      // Pastikan model sudah terdeteksi
      await _initModel();

      if (_modelName == null) return "Tidak ada model AI yang tersedia.";

      // Gunakan URL dinamis seperti kawanmu
      final url = Uri.parse(
        'https://generativelanguage.googleapis.com/v1/$_modelName:generateContent?key=$_apiKey',
      );

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {
                  // Instruksi dimasukkan di sini agar tidak Error 400
                  "text": "Kamu adalah 'Hear Me', teman curhat yang empati. Jawablah curhatan ini dengan hangat: $prompt"
                }
              ]
            }
          ]
        }),
      );

      final data = jsonDecode(response.body);
      
      if (response.statusCode == 200) {
        return data['candidates'][0]['content']['parts'][0]['text'];
      } else {
        return "Google Error: ${data['error']['message']}";
      }
    } catch (e) {
      return "Koneksi bermasalah. Coba cek internetmu.";
    }
  }
}