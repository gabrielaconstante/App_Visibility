import 'state.dart';

class StateMachine {
  int _stateNumber = 0;
  final List<State> _states = [
    State(
        text:
            'Paciente com glicemia capilar > 250mg/dL. \n\nHá sinais/sintomas de cetoacidose diabética ou estado hiperosmolar?',
        choice1: 'Sim',
        choice2: 'Não'),
    State(
        text: 'Há suspeita de doença intercorrente (excluindo emergências)?',
        choice1: 'Sim',
        choice2: 'Não'),
    State(
        text: 'Cetonúria disponível (Se indisponível, considerar negativa)?',
        choice1: 'Positiva',
        choice2: 'Negativa'),
    State(
        text:
            'Aplicar insulina regular e reavaliar glicemia capilar em 2 horas.\n\nGlicemia abaixo de 250mg/dL?',
        choice1: 'Sim',
        choice2: 'Não'),
    State(
        text:
            'Provável descompensação crônica. Ajustar tratamento (considerar insulina). Solicitar controle de glicemia capilar. Orientar sinais de alarme e reavaliação breve',
        choice1: 'Reiniciar'),
    State(
        text:
            'Encaminhar para emergência imediatamente. Monitorar sinais vitais. Realizar hidratação EV com SF 0,9% enquanto aguarda o transporte',
        choice1: 'Reiniciar'),
    State(
        text:
            'Tratar complicações agudas. Aumentar transitoriamente dose total de insulina até resolução do quadro.',
        choice1: 'Reiniciar'),
  ];

  void nextState(int choiceNumber) {
    if (_stateNumber == 0) {
      if (choiceNumber == 1) {
        _stateNumber = 5;
      } else if (choiceNumber == 2) {
        _stateNumber = 1;
      }
    } else if (_stateNumber == 1) {
      if (choiceNumber == 1) {
        _stateNumber = 2;
      } else if (choiceNumber == 2) {
        _stateNumber = 4;
      }
    } else if (_stateNumber == 2) {
      if (choiceNumber == 1) {
        _stateNumber = 5;
      } else if (choiceNumber == 2) {
        _stateNumber = 3;
      }
    } else if (_stateNumber == 3) {
      if (choiceNumber == 1) {
        _stateNumber = 6;
      } else if (choiceNumber == 2) {
        _stateNumber = 5;
      }
    } else if (_stateNumber == 5 || _stateNumber == 6 || _stateNumber == 4) {
      // if (choiceNumber == 1) {
      reset();
      // }
    }
  }

  void reset() {
    _stateNumber = 0;
  }

  String getStateText() {
    return _states[_stateNumber].text;
  }

  String getStatechoice1() {
    return _states[_stateNumber].choice1;
  }

  String? getStatechoice2(int num) {
    if (num != null) {
      return _states[_stateNumber].choice2;
    }
  }

  bool isFinished() {
    return _stateNumber == _states.length - 1;
  }
}
