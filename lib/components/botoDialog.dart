import 'package:flutter/material.dart';

class Botodialog extends StatelessWidget {
  final String textboto;
  final Function()? accioBoto;

  const Botodialog({
    super.key, 
    required this.textboto, 
    required this.accioBoto,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: accioBoto,
      color: Colors.teal[200],
      child: Text(textboto),
    );
  }
}