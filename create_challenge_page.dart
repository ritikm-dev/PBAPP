import 'package:flutter/material.dart';

class CreateChallengePage extends StatefulWidget {
  @override
  _CreateChallengePageState createState() => _CreateChallengePageState();
}

class _CreateChallengePageState extends State<CreateChallengePage> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();
  final TextEditingController constraintController = TextEditingController();

  void _submitChallenge() {
    final question = questionController.text.trim();
    final answer = answerController.text.trim();
    final constraint = constraintController.text.trim();

    if (question.isEmpty || answer.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Question and Answer are required.")),
      );
      return;
    }

    // Handle submission logic here
    print("Question: $question");
    print("Answer: $answer");
    print("Constraints: $constraint");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Challenge submitted!")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Challenge'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: questionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Enter your question',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: answerController,
              decoration: InputDecoration(
                labelText: 'Correct answer',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: constraintController,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: 'Constraints (optional)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitChallenge,
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            )
          ],
        ),
      ),
    );
  }
}
