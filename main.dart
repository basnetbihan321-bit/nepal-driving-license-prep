import 'package:flutter/material.dart';
import 'questions.dart';

void main() {
  runApp(const LicensePrepApp());
}

class LicensePrepApp extends StatelessWidget {
  const LicensePrepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nepal License Prep',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('नेपाल लाइसेन्स तयारी'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Start Quiz'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QuizScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;
  int score = 0;

  void answer(String selected) {
    final q = carBikeQuestions[index];

    if (selected == q.ans) {
      score++;
    }

    if (index < carBikeQuestions.length - 1) {
      setState(() {
        index++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(score: score),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = carBikeQuestions[index];

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${index + 1}/${carBikeQuestions.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(q.np, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ...q.options.map((opt) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: ElevatedButton(
                    onPressed: () => answer(opt),
                    child: Text(opt),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  const ResultScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 10),
            Text(
              '$score',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Restart'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const HomeScreen()),
                  (route) => false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}