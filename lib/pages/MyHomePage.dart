import 'package:flutter/material.dart';
import 'package:primeira_aplicacao_flutter/widgets/calcButton_widget.dart';
import 'package:primeira_aplicacao_flutter/widgets/input_widget.dart';
import 'package:primeira_aplicacao_flutter/widgets/eraseButton_widget.dart';
import 'package:primeira_aplicacao_flutter/widgets/resulButton_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var textController1 = TextEditingController();
  double valorGuardado1 = 0;
  double valorGuardado2 = 0;
  double valorGuardado1Label = 0;
  double valorGuardado2Label = 0;
  String calculo = "";
  String result = "";
  List<String> conta = [];

  void somaCalc() {
    setState(() {
      valorGuardado1 = double.tryParse(textController1.text) ?? 0;
      valorGuardado1Label = double.tryParse(textController1.text) ?? 0;
      textController1.clear();

      calculo = "+";
      valorGuardado2Label = 0;
    });
  }

  void subtracaoCalc() {
    setState(() {
      valorGuardado1 = double.tryParse(textController1.text) ?? 0;
      valorGuardado1Label = double.tryParse(textController1.text) ?? 0;
      textController1.clear();
      calculo = "-";
      valorGuardado2Label = 0;
    });
  }

  void multiplicacaoCalc() {
    setState(() {
      valorGuardado1 = double.tryParse(textController1.text) ?? 0;
      valorGuardado1Label = double.tryParse(textController1.text) ?? 0;
      textController1.clear();
      calculo = "x";
      valorGuardado2Label = 0;
    });
  }

  void divisaoCalc() {
    setState(() {
      valorGuardado1 = double.tryParse(textController1.text) ?? 0;
      valorGuardado1Label = double.tryParse(textController1.text) ?? 0;
      textController1.clear();
      calculo = "÷";
      valorGuardado2Label = 0;
    });
  }

  void resultadoCalc() {
    setState(() {
      valorGuardado2 = double.tryParse(textController1.text) ?? 0;
      valorGuardado2Label = double.tryParse(textController1.text) ?? 0;
      switch (calculo) {
        case "+":
          double? somaResult = valorGuardado1 + valorGuardado2;
          result = "resultado $somaResult";
          valorGuardado1 = 0;
          valorGuardado2 = 0;
          textController1.clear();
          break;

        case "-":
          double? subtracaoResult = valorGuardado1 - valorGuardado2;
          result = "resultado $subtracaoResult";
          valorGuardado1 = 0;
          valorGuardado2 = 0;
          textController1.clear();
          break;

        case "x":
          double? multiplicacaoResult = valorGuardado1 * valorGuardado2;
          result = "resultado $multiplicacaoResult";
          valorGuardado1 = 0;
          valorGuardado2 = 0;
          textController1.clear();
          break;

        case "÷":
          double? divisaoResult = valorGuardado1 / valorGuardado2;
          result = "resultado $divisaoResult";
          valorGuardado1 = 0;
          valorGuardado2 = 0;
          textController1.clear();
          break;
        default:
      }
    });
  }

  void clearFields() {
    setState(() {
      textController1.clear();
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("$valorGuardado1Label $calculo $valorGuardado2Label"),
            InputWidget(controller: textController1, label: ""),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconButtonsRow(
                      soma: somaCalc,
                      subtracao: subtracaoCalc,
                      multiplicacao: multiplicacaoCalc,
                      divisao: divisaoCalc,
                    ),
                    SizedBox(height: 16),
                    Text(
                      result,
                      style: TextStyle(fontSize: 16),
                    ),
                  ]),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ClearFieldsButton(
            onPressed: clearFields,
          ),
          SizedBox(height: 10),
          ResultadoButton(
            onPressed: resultadoCalc,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
