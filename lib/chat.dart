
import 'package:flutter/material.dart';
import '../services/ai_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();
  List<String> messages = [];
  bool loading = false;

  void send() async {
    final text = controller.text;
    if (text.isEmpty) return;

    setState(() {
      messages.add("You: $text");
      loading = true;
    });

    controller.clear();

    final response = await AIService.sendMessage(text);

    setState(() {
      messages.add("AI: $response");
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Chat 🤖")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: messages.map((e) => ListTile(title: Text(e))).toList(),
            ),
          ),
          if (loading) const LinearProgressIndicator(),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: "اكتب بالألماني أو العربي...",
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: send,
              )
            ],
          )
        ],
      ),
    );
  }
}
