class Format {
  List formatter(List<List> options, List quest) {
    List<Map> questions = [];
    for (int j = 0; j < quest.length; j++) {
      questions.add({
        "\"questionText\"": "\"Q${j + 1}. ${quest[j]}\"",
        "\"answers\"": options[j]
      });
    }
    return questions;
  }

  List answerformatter(List options, List score) {
    List<Map> answers = [];
    for (int i = 0; i < options.length; i++) {
      answers.add({"\"text\"": "\"${options[i]}\"", "\"score\"": score[i]});
    }
    return answers;
  }
}
