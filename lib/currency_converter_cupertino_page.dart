import 'package:flutter/cupertino.dart';

//si je tape "stfl" je vais avoir un raccourci
// qui va écrire toute ce qu'un composont stateful a besoin
//equivalent ed !!! en html
class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  
  double result = 0;
  //tous les controllers doit être dispose pour évité les perte de données et mémoire
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = double.parse(textEditingController.text) * 0.94;
    setState(() {});
  }

  //est appelé la fonction initState
  //elle est invoquée lorsque les données dont dépend votre widget changent.
  //par exemple recharger la liste des tâches
  // à partir de la base de données et mettre à jour l'interface utilisateur 
  //pour refléter ces changements.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  //La fonction "didUpdateWidget" est utilisée pour réagir 
  //lorsque les propriétés d'un widget ont été mises à jour par le framework.
  @override
  void didUpdateWidget(CurrencyConverterCupertinoPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Action à effectuer lorsque les propriétés du widget sont mises à jour
    print('Le widget a été mis à jour!');
  }

  //la fonction dispose est appelé à chque fois que le widget n'existe plus
  //càd par exemple quand on change de page
  @override
  void dispose() {
    //on indique que cette objet n'existe plus maintenant
    textEditingController.dispose();

    //la ligne super.dispose(); doit être toujours à la fin
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    //CupertinoPageScaffold = Scaffold
    return CupertinoPageScaffold(
      //CupertinoColors = Colors
      backgroundColor: CupertinoColors.systemGrey3,

      //propriete navigationBar plus ou moins equivalent de appBar
      //CupertinoNavigationBar plus ou moins equivalent de AppBar
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey3,

        //middle = title
        middle: Text(
          "Currency converter",
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      //Cupertino n'a pas de body, mais directement un child
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)} €",
                style: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
              //CupertinoTextField = TextField
              CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(color: CupertinoColors.black),
                //BoxDecoration plus ou moins equivalent de InputDecoration
                decoration: BoxDecoration(
                  //fillColor = color, pas besoin de la propriete filled
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)
                ),
                //placeholder = hintText
                placeholder: "Please enter the amount in USD",
                //placeholderStyle = hintStyle
                placeholderStyle: const TextStyle(color: CupertinoColors.black),
                //CupertinoIcons = Icons
                prefix: const Icon(CupertinoIcons.money_dollar),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //CupertinoButton = TextButton
              CupertinoButton(
                onPressed: () {
                  convert();
                },
                //backgroundColor = color pas besoin du widget TextButton
                color: CupertinoColors.black,
                child: const Text("Convert"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
