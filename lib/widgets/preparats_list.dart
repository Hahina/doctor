import 'package:doctor/screen/preparat_screen.dart';

final preparats = [
    Preparat(
      title: 'препарат не вибрано',
      type: '',
      form: '',
      waitingPeriod: '',
      norma: '',
    ),
    Pesticide(
      title: 'ТАНОС',
      type: 'фунгіцид, контактно-системний',
      diseasePest: 'мілдью',
      activeSubstance: 'цимоксаніл (250 г/л); фамоксадон (250 г/л)',
      form: 'порошок',
      waitingPeriod: 30,
      norma: '16г / 20л',
    ),
    Pesticide(
      title: 'ДЖЕРОНІМО',
      type: 'інсекто-акарицид, контактно-системний',
      diseasePest: 'широкий спектр шкідників',
      activeSubstance: 'ацетаміприд, 250 г/кг; біфентрин, 250 г/кг',
      form: 'водорозчинні гранули',
      waitingPeriod: 40,
      norma: '2,5г / 20л',
    ),
    Pesticide(
      title: 'ТІЛТ 250',
      type: 'фунгіцид, системний',
      diseasePest: 'оїдіум, плямистості',
      activeSubstance: 'пропіконазол (250 г/л)',
      form: 'концентрат емульсії',
      waitingPeriod: 30,
      norma: '15мл / 20л',
    ),
    Preparat(
      title: 'ПРИЛИПАЧ',
      type: 'ПАР',
      form: 'розчин',
      waitingPeriod: 2,
      norma: '20мл / 20л',
    ),
    Pesticide(
      title: 'СУЛЬФАТ',
      type: 'добриво',
      diseasePest: 'підкислювач',
      activeSubstance: 'МgO (16%), SО3 (30%)',
      form: 'гранульований порошок',
      waitingPeriod: 2,
      norma: '30г / 20л',
    ),
  ];