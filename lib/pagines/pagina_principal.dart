import 'package:aplicacion_tareas/components/dialogNovaTasca.dart';
import 'package:aplicacion_tareas/components/item_tasca.dart';
import 'package:flutter/material.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {

  

  List tasquesLlista = [
    {"Titol": "Tasca 1", "Valor": false},
    {"Titol": "Tasca 2", "Valor": true}
  ];

  TextEditingController tecTextTasca = TextEditingController();

  void accioGuardar(){
    setState(() {
      tasquesLlista.add({"Titol": tecTextTasca.text, "Valor": false});
    });
    accioCancelar();
  }

  void accioCancelar(){
    tecTextTasca.clear();
    Navigator.of(context).pop();
  }

  void canviarCheckbox(bool? valorCheckbox, int index){
    setState(() {
      tasquesLlista[index]["Valor"] = !tasquesLlista[index]["Valor"];
    });
  }
  void accioEsborrarTasca(int index) {
    setState(() {
      tasquesLlista.removeAt(index);
    });
  }

  void crearNovaTasca(){
    showDialog(
      context: context, 
      builder: (context){
        return Dialognovatasca(
          tecTextTasca: tecTextTasca, 
          accioGuardar: accioGuardar, 
          accioCancelar: accioCancelar);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],

      //App bar
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.orange[200],
        title: Text("App tareas"),

      ),
      //Floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: crearNovaTasca,
        backgroundColor: Colors.teal[300],
        shape: CircleBorder(),
        child: Icon(
          Icons.add, 
          color: Colors.orange[200],
        ),
      ),
      //Body
      body: ListView.builder(
        itemCount: tasquesLlista.length,
        itemBuilder: (context, index){
          return ItemTasca(
            TextTasca: tasquesLlista[index]["Titol"].toString(), 
            valorCheckbox: tasquesLlista[index]["Valor"],
            canviarValorCheckbox: (valor) => canviarCheckbox(tasquesLlista[index]["Valor"], index),
            esborrarTasca: (valor) => accioEsborrarTasca(index),
          );
        },
      ),
    );
  }
}

