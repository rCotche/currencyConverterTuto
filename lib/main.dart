//import le fichier material.dart from le package flutter
//material donne des fonction, classe, methode qu'on peut utiliser
//import 'package:currency_converter/pages/currency_converter_material_page.dart';import package
import 'package:currency_converter/currency_converter_cupertino_page.dart';
import 'package:flutter/cupertino.dart';

import 'currency_converter_material_page.dart';//import relative
import 'package:flutter/material.dart';//google
//import 'package:flutter/cupertino.dart';//apple

//fonction où l'appli commence
//void ce que la fonction retourne
//main le nom de la fonction
void main() {
  //fonction pour execute l'application
  //runApp viens de material.dart
  //widget sont les block qui permet de construire l'UI
  //widget decrit ce que l'ui doit ressembler

  //qd ça surligne en bleu cela peut signifier qu'il y a une erreur

  ////////////////////////////////
  //      ancienne version      //
  ////////////////////////////////
  
  /*runApp(Text(
    'Hello, world!!!',
    textDirection: TextDirection.rtl,
  ));*/
  runApp(const MyCupertinoApp());
}

//StatelessWidget est un type de widget

// type de widget
// StatelessWidget
// StatefulWidget
// InheritedWidget

/////////////////////
//      state      //
/////////////////////

// state fait reference a toute les données qui détermine
// comment le widget doit ressembler, doit être afficher, doit se comporter
//difference entre state et widget, c'est que un 'state' est une donnée
//un bouton n'est pas une donnée
//un text ou un nombre est une donnée
//state est some data que le widget va prendre en compte

///////////////////////////////////
//     Stateless & Stateful      //
///////////////////////////////////

// StatelessWidget
//Dans un StatelessWidget le state ne change pas, les données ne change pas
//une fois que le widget est créer, on ne peut pas le modifier

// StatefulWidget
//Dans un StatefulWidget le state change , les données change
//une fois que le widget est créer, on peut le modifier

/////////////////////
//     design      //
/////////////////////

// il y a 2 populaire guide pour desgn son application
// Material design & cupertino design


//Parce que MyApp hérite de StatelessWidget il deveient un widget
class MyApp extends StatelessWidget {

  ///////////////////////////
  //     constructeur      //
  ///////////////////////////
  
  // const MyApp({super.key});
  //Cette partie est la déclaration du constructeur de la classe MyApp

  //Le const indique que ce constructeur est constant,
  //ce qui signifie qu'il ne peut pas modifier les propriétés de l'objet après sa création.

  //Le mot-clé super est utilisé pour faire référence au constructeur de la classe parente

  //Ici, le constructeur PEUT prend un paramètre nommé key,
  //qui est passé au constructeur de la classe parente

  ///////////////////////////
  //     optimisation      //
  ///////////////////////////
  
  //L'objectif de déclarer le constructeur est de faire en sorte que flutter
  //ne recrée pas à chaque fois l'objet
  // il le crée une fois, cela favorise la performance

  ////////////////////////////////////
  //     gestion des instances      //
  ////////////////////////////////////
  
  //key est un classe qui aide flutter à indentifier et
  //différencier les widget entre eux (comme une carte d'identité)

  //si je passe un key dans le constructeur alors
  // je vais une key pour CETTE instance de ma class
  const MyApp({super.key});

  @override
  //la fonction retourne un widget
  //buil est le nom de la fonction

  //la fonction obligatoirement retourner un widget
  Widget build(BuildContext context){

    ////////////////////////////////
    //      ancienne version      //
    ////////////////////////////////
    
    // le fait de mettre const ici,
    //indique que le widget n'a pas besoin d'être rebuilt
    //ça améliore la performance
    /*
    
    return const Text(
    'Hello, world!!!',
    textDirection: TextDirection.ltr,
    );
  
    */

  // Pour être sûr que mon application utilise material design
  // alors j'utilise la classe MaterialApp

  //Material va nous offrir tous les fonctionnalités pour
  //la navigation, le theming, localizarion...
  //Nous des fonctionnalité de maniere global

  ////////////////////////////////
  //      ancienne version      //
  ////////////////////////////////

  //Materialapp sera retourné qu'une fois dans toute l'application
  /*
  
  return const MaterialApp(
    //home demande un widget
    //généralement la propriété home est suivie par un "scaffold"

    // les proprietes de la classe Scaffold peut être compare
    //à ce qu'on a en HTML

    //le scaffold est spécifique à une page (local),
    //il va nous offrir tous les fonctionnalités pour
    //le header footer...
    home: Scaffold(
      // la classe center est offert par flutter
      // permet de centré un element
      // le fait qu'on pas configuré [widthFactor] and [heightFactor]
      //alors le widget prend toute la place possible

      //center est un layout
      //puisque center n'affiche rien sur l'écran
      // à la différence de texte
      body: Center(
        child: Text("Hellowww, world !!!"),
      ),
    ),
  );
  
  */

  return  const MaterialApp(
    home: CurrencyConverterMaterialPagee(),
  );
  }
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const CupertinoApp(
    home: CurrencyConverterCupertinoPage(),
  );
  }
}
