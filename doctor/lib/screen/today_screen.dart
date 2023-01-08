import 'package:doctor/core/router.dart';
import 'package:doctor/widgets/button.dart';
import 'package:doctor/widgets/day_to_harvest_widget.dart';
import 'package:doctor/widgets/dropdown_button.dart';
import 'package:doctor/widgets/preparats_list.dart';
import 'package:flutter/material.dart';



class TodayScreen extends StatelessWidget {
  // final List<MenuRowData> menuRow = const [
  //   MenuRowData('виберіть препарат', '', '', ''),
  //   MenuRowData('Фольпан', '50 мл', 'ВП', '20 дн.'),
  //   MenuRowData('Інфініто', '35 мл', 'ЗП', '15 дн.'),
  //   MenuRowData('Джеронімо', '2.5 г', 'ВСК', '30 дн.'),
  //   MenuRowData('Прилипач', '20 мл', 'МКЕ', '10 дн.'),
  //   MenuRowData('Сульфат', '30-40 г', 'ВРП', '1 дн.'),
  // ];

  const TodayScreen({Key? key}) : super(key: key);

  //TodayScreen();

  @override
  Widget build(BuildContext context) {
    return 
      Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButtonPreparat(preparats: preparats),
              DropdownButtonPreparat(preparats: preparats),
              DropdownButtonPreparat(preparats: preparats),
              DropdownButtonPreparat(preparats: preparats),
              DropdownButtonPreparat(preparats: preparats),
              DropdownButtonPreparat(preparats: preparats),
              // PreparatRowData(menuRow: menuRow),
            ],
          ),
          Row(
            children: [
              // ignore: avoid_print
              PositivButton(onPressed: () => {print('Не збережено')}, text: 'Зберегти',),
              
              NegativeButton(onPressed: () => {Navigator.of(context).pushNamed(Routes.bottomBar)}, text: 'Скинути і повернутись в календар',),
            ],
          ),
          Column(
            
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  children: [
                    Container(
                      width: 140,
                      padding: const EdgeInsets.only(left: 20.0),
                      child: const Text('До збору врожаю лишилось:'),
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: ControlWidget()),
                    ),
                  ],
                ),
              ),
              
              const Note(
                text: "термін очікування",
                colorCircle: Colors.red,
              ),
              const Note(
                text: 'залишок від закінчення терміну очікування до збору врожаю',
                colorCircle: Colors.yellow,
              ),
            ],
          ),
        ]
      );
  }
}

class Note extends StatelessWidget {
  const Note({Key? key, required this.text, required this.colorCircle,}) : super(key: key);

  final String text;
  final Color colorCircle;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Row(
        children: [
          Container (width: 10, height: 10, color: colorCircle,),
          const SizedBox(width: 10,),
          Flexible(
            child: Text(text),)
        ]
      ),
    );
  }
}