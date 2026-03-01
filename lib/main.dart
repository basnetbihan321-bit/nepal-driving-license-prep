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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

// ---------------- HOME ----------------
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
          child: const Text('Start Exam'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ExamScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ---------------- EXAM SCREEN ----------------
class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  late List<Question> examQuestions;
  int currentIndex = 0;
  int score = 0;
  int timeLeft = examTime.inSeconds;

  @override
  void initState() {
    super.initState();

    // random 40 questions
    examQuestions = List<Question>.from(carBikeQuestions)..shuffle();
    examQuestions = examQuestions.take(examTotalQuestions).toList();

    startTimer();
  }

  void startTimer() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return false;
      if (timeLeft <= 0) {
        finishExam();
        return false;
      }
      setState(() => timeLeft--);
      return true;
    });
  }

  void answer(String selected) {
    if (selected == examQuestions[currentIndex].ans) {
      score++;
    }

    if (currentIndex + 1 >= examQuestions.length) {
      finishExam();
    } else {
      setState(() => currentIndex++);
    }
  }

  void finishExam() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(score: score),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final q = examQuestions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Question ${currentIndex + 1}/$examTotalQuestions',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Text(
                '${timeLeft ~/ 60}:${(timeLeft % 60).toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              q.np,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              q.en,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ...q.options.map(
              (opt) => Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  onPressed: () => answer(opt),
                  child: Text(opt),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ---------------- RESULT ----------------
class ResultScreen extends StatelessWidget {
  final int score;

  const ResultScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    final pass = score >= passMark;

    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              pass ? 'PASS ✅' : 'FAIL ❌',
              style: TextStyle(
                fontSize: 28,
                color: pass ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Score: $score / $examTotalQuestions',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Restart Exam'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ExamScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}