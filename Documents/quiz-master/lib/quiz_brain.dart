import 'package:quiz/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questions = [
    Question('Alguns gatos são alérgicos a humanos', true),
    Question(
        'É possível fazer com que uma vaca suba escadas, mas não descê-las.',
        false),
    Question(
        'Aproximadamente um quarto dos ossos humanos estão nos pés.', true),
    Question('O sangue de uma lesma é verde.', true),
    Question('O nome de solteira da mãe de Buzz Aldrin era \"Moon\".', true),
    Question('É ilegal urinar no oceano, em Portugal.', true),
    Question(
        'Nenhum pedaço quadrado de papel pode ser dobrado mais do que 7 vezes.',
        false),
    Question(
        'Em Londres, se você morrer no Parlamento, você tem direito a um funeral de estado, porque o prédio é considerado um local sagrado.',
        true),
    Question(
        'O som mais forte produzido por qualquer animal é de 188dB. Esse animal é o elefante africano.',
        false),
    Question(
        'A área total dos dois pulmões de um humano é de aproximadamente 70 metros quadrados.',
        true),
    Question('Google foi chamado, originalmente de \"Backrub\".', true),
    Question(
        'O chocolate afeta o coração e o sistema nervoso de um cão; algumas gramas são suficientes para matar um cão pequeno.',
        true),
    Question(
        'Na Virginia do Oeste, EUA, se você atropelar um animal com um carro, por acidente, você pode levá-lo para casa e comê-lo.',
        true),
  ];

  String getQuestionText() {
    return _questions[_questionNumber].text;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNumber].answer;
  }

  bool isChoiceCorrect(bool choice) {
    return _questions[_questionNumber].answer == choice;
  }

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    return _questionNumber == _questions.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }
}
