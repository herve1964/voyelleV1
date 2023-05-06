// ignore: file_names
import 'package:flutter/material.dart';

class CelluleLettre extends StatelessWidget {
  final Color couleurCellule;
  final String lettre;
  final String textOccures;

  const CelluleLettre(
      {super.key,
      required this.couleurCellule,
      required this.lettre,
      required this.textOccures});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Container(
        // ignore: sort_child_properties_last
        child: Row(
          children: [
            Text(
              '$lettre          :',
              style: const TextStyle(
                  color: Colors.white, fontSize: 24.0, fontFamily: 'Inter'),
            ),
            Text(
              textOccures,
              style: const TextStyle(
                  color: Colors.white, fontSize: 24.0, fontFamily: 'Inter'),
            ),
          ],
        ),
        height: 40,
        decoration: BoxDecoration(
            color: couleurCellule,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            )),
      ),
    );
  }
}
