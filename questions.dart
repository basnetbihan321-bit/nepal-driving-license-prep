class Question {
  final String np;
  final String en;
  final String ans;

  Question({
    required this.np,
    required this.en,
    required this.ans,
  });
}

final List<Map<String, String>> baseQuestions = [
  {
    "np": "रातो ट्राफिक बत्तीको अर्थ के हो?",
    "en": "What does red traffic light mean?",
    "ans": "रोक्नु"
  },
  {
    "np": "हरियो ट्राफिक बत्तीको अर्थ के हो?",
    "en": "What does green traffic light mean?",
    "ans": "जानु"
  },
  {
    "np": "पहेंलो ट्राफिक बत्तीको अर्थ के हो?",
    "en": "What does yellow traffic light mean?",
    "ans": "तयारी"
  },
  {
    "np": "ओभरटेक गर्दा कुन साइडबाट जानुपर्छ?",
    "en": "From which side should you overtake?",
    "ans": "दायाँ"
  },
  {
    "np": "हेल्मेट किन आवश्यक छ?",
    "en": "Why is helmet necessary?",
    "ans": "टाउको सुरक्षा"
  },
  {
    "np": "सिट बेल्ट किन लगाउनुपर्छ?",
    "en": "Why wear seat belt?",
    "ans": "ज्यान सुरक्षा"
  },
  {
    "np": "जिब्रा क्रसिङ कसका लागि हो?",
    "en": "Zebra crossing is for?",
    "ans": "पैदल यात्री"
  },
  {
    "np": "नो पार्किङ चिन्हको अर्थ?",
    "en": "No parking sign means?",
    "ans": "पार्क नगर्नु"
  },
  {
    "np": "यू टर्न कहाँ लिन पाइन्छ?",
    "en": "Where is U-turn allowed?",
    "ans": "अनुमति भएको स्थान"
  },
  {
    "np": "हर्न निषेध कहाँ हुन्छ?",
    "en": "Where is horn prohibited?",
    "ans": "हस्पिटल/स्कुल"
  },
];

List<Question> generateQuestions(int total) {
  List<Question> list = [];

  for (int i = 0; i < total; i++) {
    final q = baseQuestions[i % baseQuestions.length];

    list.add(
      Question(
        np: "${q["np"]} (${i + 1})",
        en: "${q["en"]} (${i + 1})",
        ans: q["ans"]!,
      ),
    );
  }

  return list;
}

final List<Question> carBikeQuestions = generateQuestions(5000);