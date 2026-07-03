
import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  static Future<String> sendMessage(String message) async {
    const apiKey = "PUT_YOUR_API_KEY";

    final response = await http.post(
      Uri.parse("https://api.openai.com/v1/chat/completions"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey"
      },
      body: jsonEncode({
        "model": "gpt-4o-mini",
        "messages": [
          {
            "role": "system",
            "content":
                "You are a German teacher. Reply in German then Arabic explanation. Correct mistakes."
          },
          {"role": "user", "content": message}
        ]
      }),
    );

    final data = jsonDecode(response.body);
    return data["choices"][0]["message"]["content"];
  }
}
