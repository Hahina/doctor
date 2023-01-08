import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:doctor/widgets/preparats_list.dart';

class Preparat {
  final String title;
  final String type;
  final String form;
  final dynamic waitingPeriod;
  final String norma;

  Preparat({
    required this.title,
    required this.type,
    required this.form,
    required this.waitingPeriod,
    required this.norma,
  });

  List<String> get searchFields => [title];

  @override
  String toString() {
    if(waitingPeriod != ''){
      return '$title. $waitingPeriod.дн. $norma';
    }
    else {
      return '$title. $waitingPeriod. $norma';
    }
  }
}

class Pesticide extends Preparat{
  
  final String diseasePest;
  final String activeSubstance;

  Pesticide({
    required super.title,
    required super.type,
    required super.form,
    required super.waitingPeriod,
    required super.norma,

    required this.diseasePest,
    required this.activeSubstance,
  });

  @override
  List<String> get searchFields => super.searchFields + [diseasePest, activeSubstance];
}


class PreparatScreen extends StatefulWidget {

  const PreparatScreen({Key? key}) : super(key: key);

  @override
  State<PreparatScreen> createState() => _PreparatScreenState();
}

class _PreparatScreenState extends State<PreparatScreen> {

  var _filteredPreparats = <Preparat>[];

  final _searchController = TextEditingController();

  void _searchPreparats() {
    final query = _searchController.text;
    if(query.isEmpty) return setState(() {_filteredPreparats = preparats;});

    final List<Preparat> newFilteredPreparats = preparats.where((Preparat preparat) {
        // return preparat.title.toLowerCase().contains(query.toLowerCase());
        return preparat.searchFields.any((field) => field.toLowerCase().contains(query.toLowerCase()));
      }).toList();
      
    setState(() {
      _filteredPreparats = newFilteredPreparats;
    });
  }

  @override
  void initState() {
    super.initState();
    
    _filteredPreparats = preparats;
    _searchController.addListener(_searchPreparats);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredPreparats.length,
          itemExtent: 200,
          itemBuilder: (BuildContext context, int index){
            final preparat = _filteredPreparats[index];
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green.withOpacity(0.2)),
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.green.withOpacity(0.2),
                                        blurRadius: 8,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: 
                                    Column(
                                    children: [
                                      const Text(
                                        'термін очікування',
                                        textAlign: TextAlign.center,
                                        ),
                                      const SizedBox(height: 10,),
                                      Text(
                                        '${preparat.waitingPeriod} діб',
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    //color: const Color.fromARGB(255, 244, 245, 204),
                                    border: Border.all(color: Colors.green.withOpacity(0.2)),
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.green.withOpacity(0.2),
                                        blurRadius: 8,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: 
                                    Column(
                                    children: [
                                      const Text(
                                        'норма',
                                        textAlign: TextAlign.center,
                                        ),
                                      const SizedBox(height: 10,),
                                      Text(
                                        preparat.norma,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  preparat.title,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                const SizedBox(height: 5,),
                                Text(
                                  preparat.type,
                                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                                ),
                                if(preparat is Pesticide) Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    preparat.diseasePest,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                                if(preparat is Pesticide) Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(preparat.activeSubstance),
                                ),
                                const SizedBox(height: 5,),
                                Text(preparat.form),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      onTap: () {
                      },
                    ),
                  )
                ],
              ),
            );
          } 
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[&]+'))],
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Пошук',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}