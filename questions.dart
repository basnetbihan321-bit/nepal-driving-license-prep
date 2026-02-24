class Question {
  final String np;
  final String en;
  final String ans;
  final List<String> options;

  Question({
    required this.np,
    required this.en,
    required this.ans,
    required this.options,
  });
}

final List<Question> baseQuestions = [
  Question(
    np: "रातो बत्तीको अर्थ के हो?",
    en: "What does red traffic light mean?",
    ans: "Stop",
    options: ["Stop", "Go", "Wait", "Slow"],
  ),
  Question(
    np: "ओभरटेक गर्दा कुन साइडबाट जानुपर्छ?",
    en: "From which side should you overtake?",
    ans: "Right",
    options: ["Left", "Right", "Any", "None"],
  ),
  Question(
    np: "हेल्मेट किन आवश्यक छ?",
    en: "Why is helmet necessary?",
    ans: "Safety",
    options: ["Style", "Safety", "Rule only", "Comfort"],
  ),
  Question(
    np: "जेब्रा क्रसिङमा के गर्नुपर्छ?",
    en: "What should you do at zebra crossing?",
    ans: "Stop for pedestrians",
    options: [
      "Speed up",
      "Stop for pedestrians",
      "Horn",
      "Ignore"
    ],
  ),
  Question(
    np: "सडकको बायाँ किन चलाइन्छ?",
    en: "Why drive on left side?",
    ans: "Traffic rule",
    options: [
      "Traffic rule",
      "Habit",
      "Choice",
      "Speed"
    ],
  ),
];

/// 🔥 Auto generate 1000+ questions
final List<Question> carBikeQuestions = generateQuestions(1000);

List<Question> generateQuestions(int count) {
  List<Question> list = [];

  for (int i = 0; i < count; i++) {
    final q = baseQuestions[i % baseQuestions.length];

    list.add(
      Question(
        np: "${q.np} (${i + 1})",
        en: "${q.en} (${i + 1})",
        ans: q.ans,
        options: q.options,
      ),
    );
  }

  return list;
}