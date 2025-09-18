import 'package:flutter/material.dart';

class AttackPage extends StatefulWidget {
  @override
  _AttackPageState createState() => _AttackPageState();
}

class _AttackPageState extends State<AttackPage> {
  final TextEditingController answerController = TextEditingController();

  final String question =
      "A man writing code tries to write a ascending order 1 to 10.he writes the for loop and writes the condition of i++.but the code is not working properly.find the error.";

  // No feedback text, just a report button

  void _submitAnswer() {
    // For demo, just clear answer on submit and show a SnackBar
    FocusScope.of(context).unfocus(); // Hide keyboard
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Answer submitted!")),
    );
    answerController.clear();
  }

  void _reportQuestion() {
    // Show a dialog to confirm reporting
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Report Question'),
        content: Text('Are you sure you want to report this question?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Cancel
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Question reported!")),
              );
            },
            child: Text('Report'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attack - Solve a Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              question,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            TextField(
              controller: answerController,
              decoration: InputDecoration(
                labelText: 'Your Answer',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitAnswer,
              child: Text('Submit Answer'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 16),
            OutlinedButton(
              onPressed: _reportQuestion,
              child: Text('Report Question'),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
