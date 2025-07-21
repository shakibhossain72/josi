import 'package:get/get.dart';

// FAQ Model
class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

// GetX Controller
class FAQController extends GetxController {
  // List to track which FAQ items are expanded
  var expandedItems = <int, bool>{}.obs;

  // FAQ data
  final List<FAQItem> faqItems = [
    FAQItem(
      question: "Lorem ipsum dolor sit amet?",
      answer:
          "Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua.",
    ),
    FAQItem(
      question: "Lorem ipsum dolor sit amet?",
      answer:
          "Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua.",
    ),
    FAQItem(
      question: "Lorem ipsum dolor sit amet?",
      answer:
          "Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua.",
    ),
    FAQItem(
      question: "Lorem ipsum dolor sit amet?",
      answer:
          "Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua.",
    ),
    FAQItem(
      question: "Lorem ipsum dolor sit amet?",
      answer:
          "Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua.",
    ),
    FAQItem(
      question: "Lorem ipsum dolor sit amet?",
      answer:
          "Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua.",
    ),
  ];

  // Toggle expansion state
  void toggleExpansion(int index) {
    expandedItems[index] = !(expandedItems[index] ?? false);
  }

  // Check if item is expanded
  bool isExpanded(int index) {
    return expandedItems[index] ?? false;
  }
}
