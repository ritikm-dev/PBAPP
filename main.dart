import 'package:flutter/material.dart';
import 'create_challenge_page.dart';
import 'attack_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge & Attack',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // Placeholder point values
  final int attackPoints = 120;
  final int defendPoints = 80;

  @override
  Widget build(BuildContext context) {
    int totalPoints = attackPoints + defendPoints;

    return Scaffold(
      appBar: AppBar(
        title: Text('Battle Zone'),
        actions: [
          IconButton(
            icon: Icon(Icons.leaderboard),
            tooltip: 'Leaderboard',
            onPressed: () {
              // Navigate to leaderboard (placeholder)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Leaderboard tapped!")),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Buttons
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.edit),
                    label: Text('Challenge!'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateChallengePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                      icon: Icon(Icons.bolt),
                      label: Text('Attack!'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AttackPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 60),
                        textStyle: TextStyle(fontSize: 20),
                        backgroundColor: Colors.redAccent,
                      ),
                    ),
                ],
              ),
            ),

            // Point Indicators
            Divider(height: 30),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildPointColumn('Attack Points', attackPoints, Colors.red),
                    _buildPointColumn('Defend Points', defendPoints, Colors.blue),
                    _buildPointColumn('Total Points', totalPoints, Colors.green),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget
  Widget _buildPointColumn(String title, int points, Color color) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          points.toString(),
          style: TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
