import 'package:flutter/material.dart';
import 'package:test1/widgets/Cellule_Lettre.dart';

var monMot = "yyyy";
var voyelles = "aeiouy";
var blanc = "   ";
int calculeconsonnestotal = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("analyse voyelle"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  hintText: "Entrer un mot"),
              onChanged: (newValue) {
                monMot = removeDiacritics(newValue);
              },
            ),
          ),

          ElevatedButton(
              onPressed: () {
                calculeconsonnestotal = 0;

                setState(() {});
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                  textStyle:
                      MaterialStatePropertyAll(TextStyle(fontSize: 30.0))),
              child: const Text("Analyser")),
          // ignore: avoid_unnecessary_containers
          for (var i = 0; i < voyelles.length; i++)
            CelluleLettre(
                couleurCellule: calculecouleur(i),
                // ignore: unnecessary_string_interpolations
                lettre: blanc + voyelles[i],
                textOccures: calculeconsonnes(monMot, voyelles[i])),
          CelluleLettre(
              couleurCellule: Colors.red,
              lettre: "Consonnes",
              textOccures: ' $calculeconsonnestotal'),
        ]),
      ),
    );
  }

  String calculeconsonnes(String monMot, String lettre) {
    return compterConsonnes(monMot, lettre).toString();
  }

  int compterConsonnes(String chaine, String lettre) {
    int compteur = 0;

    for (int i = 0; i < chaine.length; i++) {
      if (lettre.contains(chaine[i])) {
        compteur++;
      }
    }
    calculeconsonnestotal = calculeconsonnestotal + compteur;

    return compteur;
  }

  calculecouleur(int i) {
    switch (i) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.green;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.yellow;
      case 4:
        return Colors.orange;
      case 5:
        return Colors.purple;

      default:
        return Colors.red;
    }
  }
}

String removeDiacritics(String str) {
  var withDia =
      'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
  var withoutDia =
      'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

  for (int i = 0; i < withDia.length; i++) {
    str = str.replaceAll(withDia[i], withoutDia[i]);
  }

  return str;
}
