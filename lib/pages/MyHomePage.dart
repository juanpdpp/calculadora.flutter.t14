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
  double? valorGuardado1Label;
  double? valorGuardado2Label;
  String calculo = "";
  String result = "";

  void criarOperacao() {
    setState(() {
      valorGuardado2 = double.tryParse(textController1.text) ?? 0;
      valorGuardado2Label = double.tryParse(textController1.text) ?? 0;

      switch (calculo) {
        case "+":
          valorGuardado1 += valorGuardado2;
          break;
        case "-":
          valorGuardado1 -= valorGuardado2;
          break;
        case "x":
          valorGuardado1 *= valorGuardado2;
          break;
        case "÷":
          valorGuardado1 /= valorGuardado2;
          break;
        default:
          valorGuardado1 = valorGuardado2;
          break;
      }

      result = "Resultado: $valorGuardado1";
      valorGuardado1Label = valorGuardado1;
      valorGuardado2Label = null;
      textController1.clear();
    });
  }


  void somaCalc() {
    setState(() {
      if (calculo.isNotEmpty) {
        criarOperacao();
      } else {
        valorGuardado1 = double.tryParse(textController1.text) ?? 0;
        valorGuardado1Label = double.tryParse(textController1.text) ?? 0;
        textController1.clear();
      }
      calculo = "+";
    });
  }

  void subtracaoCalc() {
    setState(() {
      if (calculo.isNotEmpty) {
        criarOperacao();
      } else {
        valorGuardado1 = double.tryParse(textController1.text) ?? 0;
        valorGuardado1Label = double.tryParse(textController1.text) ?? 0;
        textController1.clear();
      }
      calculo = "-";
    });
  }

  void multiplicacaoCalc() {
    setState(() {
      if (calculo.isNotEmpty) {
        criarOperacao();
      } else {
        valorGuardado1 = double.tryParse(textController1.text) ?? 0;
        valorGuardado1Label = double.tryParse(textController1.text) ?? 0;
        textController1.clear();
      }
      calculo = "x";
    });
  }

  void divisaoCalc() {
    setState(() {
      if (calculo.isNotEmpty) {
        criarOperacao();
      } else {
        valorGuardado1 = double.tryParse(textController1.text) ?? 0;
        valorGuardado1Label = double.tryParse(textController1.text) ?? 0;
        textController1.clear();
      }
      calculo = "÷";
    });
  }

  void resultadoCalc() {
    criarOperacao();
    setState(() {
      calculo = "";
    });
  }

  void clearFields() {
    setState(() {
      textController1.clear();
      result = "";
      valorGuardado1 = 0;
      valorGuardado1Label = null;
      calculo = "";
      valorGuardado2Label = null;
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
            Text(
              [
                if (valorGuardado1Label != null) valorGuardado1Label.toString(),
                if (calculo.isNotEmpty) calculo,
                if (valorGuardado2Label != null) valorGuardado2Label.toString(),
              ].join(' '),
              style: const TextStyle(fontSize: 20),
            ),
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
