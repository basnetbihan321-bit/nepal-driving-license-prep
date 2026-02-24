class Question {
  final String np; // Nepali question
  final String en; // English question
  final String ans; // correct answer
  final List<String> options; // MCQ options

  const Question({
    required this.np,
    required this.en,
    required this.ans,
    required this.options,
  });
}

// ---------------- BASE QUESTIONS ----------------
const List<Question> baseQuestions = [
  Question(
    np: "रातो बत्तीको अर्थ के हो?",
    en: "What does red traffic light mean?",
    ans: "Stop",
    options: ["Stop", "Go", "Wait", "Slow"],
  ),
  Question(
    np: "हरियो बत्तीको अर्थ के हो?",
    en: "What does green traffic light mean?",
    ans: "Go",
    options: ["Stop", "Go", "Wait", "Turn"],
  ),
  Question(
    np: "पहेंलो बत्तीको अर्थ के हो?",
    en: "What does yellow light mean?",
    ans: "Wait",
    options: ["Stop", "Go", "Wait", "Speed"],
  ),
  Question(
    np: "ओभरटेक गर्दा कुन साइडबाट जानुपर्छ?",
    en: "From which side should you overtake?",
    ans: "Right",
    options: ["Left", "Right", "Any", "None"],
  ),
  Question(
    np: "जिब्रा क्रसिङ कसका लागि हो?",
    en: "Zebra crossing is for?",
    ans: "Pedestrians",
    options: ["Cars", "Bikes", "Pedestrians", "Parking"],
  ),
  Question(
    np: "हेल्मेट किन आवश्यक छ?",
    en: "Why is helmet necessary?",
    ans: "Safety",
    options: ["Style", "Safety", "Comfort", "Rule only"],
  ),
  Question(
    np: "सडकको बायाँ किन चलाइन्छ?",
    en: "Why do we drive on left side?",
    ans: "Traffic rule",
    options: ["Choice", "Traffic rule", "Speed", "Overtake"],
  ),
  Question(
    np: "गाडी चलाउँदा मोबाइल प्रयोग गर्न पाइन्छ?",
    en: "Can you use mobile while driving?",
    ans: "No",
    options: ["Yes", "No", "Sometimes", "Emergency only"],
  ),
  Question(
    np: "स्पीड लिमिट किन हुन्छ?",
    en: "Why speed limit exists?",
    ans: "Safety",
    options: ["Race", "Safety", "Overtake", "Fuel"],
  ),
  Question(
    np: "ओभरस्पीड गर्दा के हुन्छ?",
    en: "What happens if overspeed?",
    ans: "Fine",
    options: ["Reward", "Fine", "Nothing", "License"],
  ),
];

// ---------------- EXPAND TO 1000 ----------------
final List<Question> carBikeQuestions =
    List.generate(1000, (i) => baseQuestions[i % baseQuestions.length]);

// ---------------- EXAM SETTINGS ----------------
const int examTotalQuestions = 40;
const int passMark = 32;
const Duration examTime = Duration(minutes: 30);