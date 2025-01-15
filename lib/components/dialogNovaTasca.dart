import 'package:aplicacion_tareas/components/botoDialog.dart';
import 'package:flutter/material.dart';

class Dialognovatasca extends StatelessWidget {

  final TextEditingController tecTextTasca;
  final Function()? accioGuardar;
  final Function()? accioCancelar;

  const Dialognovatasca({
    super.key, 
    required this.tecTextTasca, 
    required this.accioGuardar, 
    required this.accioCancelar
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      content: Container(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: tecTextTasca,
              cursorColor: Colors.orange[300],
              decoration: InputDecoration(
                hintText: "Escriu la tasca: ",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.teal[100],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Boto guardar
                Botodialog(textboto: "Guardar", accioBoto: accioGuardar),
                //Boto cancelar
                Botodialog(textboto: "Cancelar", accioBoto: accioCancelar)
              ],
            )
          ],
        ),
      ),
    );
  }
}