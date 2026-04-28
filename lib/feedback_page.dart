import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});
  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E0E10),
        title: const Text("Feedback", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // titulo
            Text(
              "Tipo de pergunta",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            // botoes
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                Chip(
                  label: const Text("Problema de conteúdo"),
                  backgroundColor: const Color(0xFF5B21B6),
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                Chip(
                  label: const Text("Problema de reprodução"),
                  backgroundColor: Colors.grey[800], // cinza fixo
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                Chip(
                  label: const Text("Problema de download"),
                  backgroundColor: Colors.grey[800],
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                Chip(
                  label: const Text("Trava durante a reprodução"),
                  backgroundColor: Colors.grey[800],
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                Chip(
                  label: const Text("Não é possível acessar"),
                  backgroundColor: Colors.grey[800],
                  labelStyle: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // texto
            TextField(
              controller: controller,
              maxLength: 200,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Descreva sua sugestão ou problema...",
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                ),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            // enviar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5B21B6),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  controller.clear();
                },
                child: const Text(
                  "Enviar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
