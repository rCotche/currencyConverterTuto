import 'package:flutter/material.dart';

class CurrencyConverterMaterialPagee extends StatefulWidget {
  const CurrencyConverterMaterialPagee({super.key});

  //StatefulWidget a besoin de la fonction createState pour pouvoir créer les State
  //createState a besoin d'un objet de type State pour pouvoir le créer mais State est une abstract class
  //Donc nous avons besoin d'une classe qui herite de State
  //C'est pour cela que je crée CurrencyConverterMaterialPageState
  //qui herite de State, de cette façon je peux utilisé la fonction createState
  //dans ma classe qui herite de StatefulWidget

  //State<CurrencyConverterMaterialPagee> createState() est la mm chose que
  //State createState()
  //State<CurrencyConverterMaterialPagee> cette façon d'écrire est plus précise
  //c'est une bonne pratique
  @override
  State<CurrencyConverterMaterialPagee> createState() =>
      CurrencyConverterMaterialPageState();
}
//CurrencyConverterMaterialPageState j'override la fonction build
//je vais pouvoir faire la mm chose dans cette fonction build que celui
//de la class CurrencyConverterMaterialPage

//Parce que j'ai précisé State<CurrencyConverterMaterialPagee> dans la classe CurrencyConverterMaterialPagee
//alors je suis obligé de précisé State<CurrencyConverterMaterialPagee>
//dans la classe CurrencyConverterMaterialPageState
//pour m'assurer que ma classe CurrencyConverterMaterialPagee est bien associé a  ma classe d'état
//CurrencyConverterMaterialPageState
class CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPagee> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = double.parse(textEditingController.text) * 0.94;
    setState(() {});
  }

  //Pour être sûr qu'une action est réalisé avant le build fonction
  //util si j'ai besoin de valeur qui vient de "future" et de "stream"
  //Pour initialisé des données ou des propriétés en général

  //appelé après : constructeur de la classe > create state > initState
  @override
  void initState() {
    //la ligne super.initState(); doit être toujours en premier
    super.initState();
  }

  //peut être appelé aprés chaque frame
  //c'est pour cela qu'on essaie de mettre le moins de logic possible dans la fonction
  //surtout pas de sync task dans un build fonction
  @override
  Widget build(BuildContext context) {
    //monBorder est une variable
    // Pour refractor le code
    const monBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      //Comme en html, le header n'est pas dans le body
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        //elevation: 0, pour set l'effet d'elevation
        title: const Text(
          "Currency converter",
          style: TextStyle(color: Colors.white),
        ),
        //centerTitle: true,
        //foregroundColor: Colors.white,//moi
      ),
      //Column est un layout
      //Pour le widget column, le main axis est l'axe vertical
      //du coup le cross axis est l'axe horizontal

      //Pour le widget row, le main axis est l'axe horizontal
      //du coup le cross axis est l'axe vertical
      // mainAxisAlignment est une propriété de la classe Column

      //Column prends seulement l'espace dont il a besoin.
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          
            //dans la propriete children, je peux renseigner
            //plusieurs widget
            children: [
              Text(
                //result.toString(),
                //Pour avoir que 2 decimal après la virgule lors de la conversion en string
                //result.toStringAsFixed(0) aurait pu être "0" (moi)

                //ternaire
                //condition ? si la condition est vrai : faux
                "${result!=0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)} €",
                //Style est une propriete de la classe text
                //TextStyle est une classe
                style: const TextStyle(
                    //le fontsize par default est 14
                    fontSize: 55,
                    //FontWeight est une classe
                    //FontWeight.bold = FontWeight.w700
                    //FontWeight.normal = FontWeight.w400
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
          
              //differnece entre padding & margin
              //parding espace à l'intérieur de l'element
              //margin espace à l'exterieur de l'element
              TextField(
                //associe le textfield a la variable textEditingController
                //equivalent de l'attribut name en HTML
                controller: textEditingController,
                //couleur de l'ecriture lorsque l'utilisateur type in the textfield
                style: const TextStyle(color: Colors.black),
                //propiete decoration : tout ce qui est rapprt avec l'aspect du textfield
                decoration: const InputDecoration(
                  //equivalent placeholder en HTML
                  hintText: "Please enter the amount in USD",
                  hintStyle: TextStyle(color: Colors.black54),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black54,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: monBorder,
                  enabledBorder: monBorder,
                ),
              
                //equivalent d'un input type number en HTML
                //keyboardType: TextInputType.number, est suffisant pour android 22/04/2024
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              
              //ajoute un widget "container" juste pour faire une marge
              //entre le textfield et textbutton
              //Container(height: 10,),

              //il vaut mieux privilegier un widget qui a un constructeur
              // pour la performance de l'application
              const SizedBox(height: 10,),
              
              //exemple avec un TextButton
              TextButton(
                //onPressed: convert,//alternative
                onPressed: () {
                  //setState indique que CE widget a besoin d'être rebuild
                  //pas toute la classe, JUSTE cet element
                  //la fonction build est de nouveau appelé
                  //et build seulement ce que tu as besoin de rebuild
              
                  //setState ne peut pas return un future
                  //ne peut pas être async
                  ////////////////////////////////
                  //      ancienne version      //
                  ////////////////////////////////
                  /*setState(() {
                    result = double.parse(textEditingController.text) * 0.94;
                  });*/
                  convert();
                },
              
                //styleFrom est une fonction
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
              
                  //j'ai fait tout seul
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2.0,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: const Text("Convert"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});

  //BuildContext est un classe offert par flutter
  // c'est pour indiquer que CurrencyConverterMaterialPage
  // est présent ici et non à un autre endroit
  //flutter doit connaitre sa location
  //(c'est a dire où est le widget par rapport au widget tree
  //est ce qu'il en 2e, en 4e ou en 1er
  //de ce fait il pourra render les element correctement)

  //pas de tache complex dans le build function
  // tel que un async ou un timer
  // doir avoir qu'un return et widget tree
  @override
  Widget build(BuildContext context) {
    //la variable result je ne peut pas le mettre dans de façon global
    // car ma classe hérite de StatelessWidget,
    // par définition StatelessWidget ne peut avoir de donner qui change/évolue.
    // Les variable que je peux renseigner de façon global
    // dans un classe qui herite de StatelessWidget
    // sont forcément declarer avec final ou const
    double result = 0;
    final TextEditingController textEditingController = TextEditingController();

    ////////////////////////////////
    //      ancienne version      //
    ////////////////////////////////

    /*  return const Scaffold(
      body: Center(
        child: Text("Hellowww, world !!!"),
      ),
    );*/

    //monBorder est une variable
    // Pour refractor le code
    const monBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      //Comme en html, le header n'est pas dans le body
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        //elevation: 0, pour set l'effet d'elevation
        title: const Text(
          "Currency converter",
          style: TextStyle(color: Colors.white),
        ),
        //centerTitle: true,
        //foregroundColor: Colors.white,//moi
      ),
      //Column est un layout
      //Pour le widget column, le main axis est l'axe vertical
      //du coup le cross axis est l'axe horizontal

      //Pour le widget row, le main axis est l'axe horizontal
      //du coup le cross axis est l'axe vertical
      // mainAxisAlignment est une propriété de la classe Column

      //Column prends seulement l'espace dont il a besoin.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          //dans la propriete children, je peux renseigner
          //plusieurs widget
          children: [
            Text(
              result.toString(),
              //Style est une propriete de la classe text
              //TextStyle est une classe
              style: const TextStyle(
                  //le fontsize par default est 14
                  fontSize: 55,
                  //FontWeight est une classe
                  //FontWeight.bold = FontWeight.w700
                  //FontWeight.normal = FontWeight.w400
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),

            //differnece entre padding & margin
            //parding espace à l'intérieur de l'element
            //margin espace à l'exterieur de l'element
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                //associe le textfield a la variable textEditingController
                //equivalent de l'attribut name en HTML
                controller: textEditingController,
                //couleur de l'ecriture lorsque l'utilisateur type in the textfield
                style: const TextStyle(color: Colors.black),
                //propiete decoration : tout ce qui est rapprt avec l'aspect du textfield
                decoration: const InputDecoration(
                  ////////////////////////////////
                  //      ancienne version      //
                  ////////////////////////////////

                  //label demande un widget
                  /*label: Text(
                      "Please enter the amount in INR",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),*/

                  //equivalent placeholder en HTML
                  hintText: "Please enter the amount in USD",
                  hintStyle: TextStyle(color: Colors.black54),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black54,
                  filled: true,
                  fillColor: Colors.white,

                  ////////////////////////////////
                  //      ancienne version      //
                  ////////////////////////////////

                  /*focusedBorder: OutlineInputBorder(
                    //color(0xAARRGGBB)
                    //color(0xFF000000) = black
                    borderSide: BorderSide(
                      width: 2.0,
                      style: BorderStyle.solid,
                
                      //strokeAlignOutside le border n'est pas inclut dans le textfield
                      //strokeAlignInside le border est inclut dans le textfield
                      //strokeAlignCenter est au milieu, la moitié est dans le textfield
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    //demande un BorderRadius mais il n'y a pas de constructeur de BorderRadius
                    //c'est pour cela que j'utilise BorderRadius.all
                
                    //BorderRadius.all demande un Radius
                    //mais il n'y a pas de constructeur de Radius
                    //c'est pour cela que j'utilise Radius.circular
                
                    //je ne peut pas utiliser BorderRadius.circular
                    //car mon scaffold est une constante
                    //du coup tout les elements enfants doivent être une constante
                    //sinon je peut effacer le const au niveau du scaffold mais je dois alors
                    //préciser const pour tout les elements enfants
                    // dont const est nécessaire pour ne pas avoir de warning
                
                    //BorderRadius.all(Radius.circular(40)) = BorderRadius.circular(40)
                    borderRadius: BorderRadius.all(
                      Radius.circular(15)
                    ),
                  ),
                
                  // UnderlineInputBorder c'est lorsque il y aque le bat du textfield qui
                  //souligné
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15)
                    ),
                  ),*/
                  focusedBorder: monBorder,
                  enabledBorder: monBorder,
                ),

                //equivalent d'un input type number en HTML
                //keyboardType: TextInputType.number, est suffisant pour android 22/04/2024
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),

            //exemple avec un TextButton
            Padding(
              padding: const EdgeInsets.all(8.0),
              //ElevatedButton necessite les mm propriete que textbutton
              //ElevatedButton est censé avoir un effet d'elevation
              //pour accentué l'effet 3d ou d'elevation du ElevatedButton
              //j'ajoute la propriete elevation dans le ButtonStyle
              //cela n'a pas d'effet en textbutton
              child: TextButton(
                onPressed: () {
                  //trois type de mode dans notre application
                  //debug, release, profile

                  //check si l'application est en debug mode
                  //kDebugMode est une constante que flutter nous offre
                  //equivalent de DebugPrint("button clicked !");
                  /*if (kDebugMode) {
                      print("button clicked !");
                    }*/

                  //textEditingController.text get la valeur du text field
                  /*print(textEditingController.text);
                    //You need to use the double.parse since the .text
                    // property will return a String which needs to be converted
                    // to something you make calculations on (a numeric value type).
                    print(double.parse(textEditingController.text)*0.94);*/
                  result = double.parse(textEditingController.text) * 0.94;
                },

                ////////////////////////////////
                //      ancienne version      //
                ////////////////////////////////
                /*style: const ButtonStyle(
                    //elevation: MaterialStatePropertyAll(15),
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll(
                      //double.infinity dans ce context c'est pour faire en sorte
                      //que la taille du textbutton prenne le maximum de place possible
                      //sur la largeur
                      Size(double.infinity, 50),
                    ),
                
                    //j'ai fait tout seul
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2.0,
                          style: BorderStyle.solid,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),*/

                //styleFrom est une fonction
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),

                  //j'ai fait tout seul
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2.0,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: const Text("Convert"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
