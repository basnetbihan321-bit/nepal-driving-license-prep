// questions_generator.dart
// Generates a List<Question> of arbitrary length based on simple templates.
// Usage:
//   import 'questions_generator.dart';
//   final generated = generateQuestions(5009, seed: 2026);
//   final all = List<Question>.from(baseQuestions)..addAll(generated);

import 'dart:math';
import 'questions.dart';

List<Question> generateQuestions(int count, {int seed = 42}) {
  final rnd = Random(seed);
  final subjectsNp = [
    'सवारी साधन',
    'ट्राफिक संकेत',
    'ड्राइभर',
    'पैदलयात्री',
    'हेल्मेट',
    'ओभरटेक',
    'स्पीड लिमिट',
    'जुनिपर',
  ];
  final subjectsEn = [
    'Vehicle',
    'Road sign',
    'Driver',
    'Pedestrian',
    'Helmet',
    'Overtake',
    'Speed limit',
    'Intersection',
  ];

  final verbsNp = ['कसरी', 'किन', 'कसले', 'कहिले', 'कुन अवस्थामा'];
  final verbsEn = ['how', 'why', 'who', 'when', 'under what condition'];

  final templatesNp = [
    '{sub} {verb} प्रयोग गर्ने? ',
    '{sub} मा के गर्नु पर्छ?',
    '{sub} हुँदा कुन नियम लाग्छ?',
    '{sub} कस्तो व्यवहार गर्नुहोस?',
  ];
  final templatesEn = [
    'How should the {sub} be used?',
    'What should be done with {sub}?',
    'Which rule applies to {sub}?',
    'How to behave with {sub}?',
  ];

  final choices = [
    ['Stop', 'Go', 'Wait', 'Slow'],
    ['Right', 'Left', 'Any', 'None'],
    ['Safety', 'Style', 'Comfort', 'Rule only'],
    ['Yes', 'No', 'Sometimes', 'Emergency only'],
    ['Pedestrians', 'Cars', 'Bikes', 'Parking'],
    ['10 km/h', '30 km/h', '60 km/h', '80 km/h'],
    ['Fine', 'Warning', 'Nothing', 'License suspended']
  ];

  final List<Question> out = <Question>[];

  for (var i = 0; i < count; i++) {
    final idx = rnd.nextInt(subjectsNp.length);
    final subNp = subjectsNp[idx];
    final subEn = subjectsEn[idx];

    final tplIdx = rnd.nextInt(templatesNp.length);
    final verbIdx = rnd.nextInt(verbsNp.length);

    final npQuestion = templatesNp[tplIdx]
        .replaceFirst('{sub}', subNp)
        .replaceFirst('{verb}', verbsNp[verbIdx])
        .trim();

    final enQuestion = templatesEn[tplIdx]
        .replaceFirst('{sub}', subEn)
        .replaceFirst('{verb}', verbsEn[verbIdx])
        .trim();

    final optsBase = choices[rnd.nextInt(choices.length)];
    final opts = List<String>.from(optsBase)..shuffle(rnd);
    final correct = opts[0];

    final explain = 'सही उत्तर: $correct. सामान्य ट्राफिक नियम अनुसार।';

    out.add(Question(
      np: npQuestion,
      en: enQuestion,
      ans: correct,
      options: opts,
      explain: explain,
    ));
  }

  return out;
}