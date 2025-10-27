  ##################
 ### main.dart ###
#################
Menú Principal
Aquest és el fitxer principal que crea un menú per executar tots els exercicis d'un mateix lloc.

MyApp: Widget principal que inicia l'aplicació amb el menú.
MainMenu: Pantalla principal amb botons per navegar a cada exercici.
buildButton: Mètode per crear botons que naveguen a cada pantalla amb Navigator.push
Utilitza imports de cada exercici per poder cridar-los.

  ###################
 ### main_1.dart ###
###################
Exercici 1.1
Fa un print del missatge "Hello World" al mig de la pantalla.

MaterialApp: Contenidor principal de l'app
Scaffold: Estructura bàsica de pantalla
Center: Centra el contingut
Text: Mostra text simple

  ###################
 ### main_2.dart ###
###################
Exercici 1.2
Mostra en la pantalla de benvinguda botons de LOGIN i REGISTER
També si dones a f12 y miras la terminal hi ha un missatge amb acada click.

Column: Organitza elements verticalment.
Text: Dos textos diferents, títol i subtítol
SizedBox: Dona espai entre elements a la part superior.

- Buttons:
ElevatedButton: Dos botons amb:
Estil personalitzat blau utilitzant la propietat backgroundColor
onPressed amb print per debug.

TextStyle: Personalització de fonts i colors

  ###################
 ### main_3.dart ###
###################
Exercici 1.3
Mostra text i una imatge des dels recursos.
S'ha de modificar el pubspec.yaml per crear la part dels /assets

Column amb mainAxisAlignment.start: Alinea contingut a dalt a l'esquerra.
Padding: Aplica marges al voltant de l'element.
Image: Carrega la imatge des de resources/asset/
    AssetImage('edim.jpg') -> dones el nom del asset
    Dimensions fixes (200x200) -> dondes la mida de la imatge.


  ###################
 ### main_4.dart ###
###################
Exercici 1.4
Imatge rodona amb dades d'una persona amb les seves dades personals, nom, 
cognom, email i teléfon exposats davall de la imatge.


Classe Contact: 
Tres propietats String (fullName, email, phone)
Constructor amb required per camps obligatoris!

AppBar: Barra superior
    Títol centrat
    Color personalitzat blau


CircleAvatar: Imatge de perfil circular
    radius: 60 per la mida
    backgroundImage carregant 'assets/edim.jpg' (Sempre molt maco ell).

Row per cada camp d'informació
    Icon (person_outline, email_outlined, phone_outlined)
    Text amb les dades del contacte


  ###################
 ### main_5.dart ###
###################
Exercici 1.5
Llista de missatges lorem ipsum, lorem i més ipsum amb scroll infinit


Classe Message: Model simple amb author i cos
StatefulWidget: Permet estat mutable per la llista dinàmica necessaria
initState(): Funció lambda que genera 20 missatges inicials

NotificationListener<ScrollNotification>:
    Detecta quan s'arriba al final del scroll
    Crida _generateMoreMessages() per afegir 20 més

ListView.builder
    Construcció de llistes grans (amb molts de registres).
    itemBuilder crea cada element sota demanda


ListTile: Widget predefinit per elements de llista
    leading: CircleAvatar amb inicial
    title: Nom de l'autor
    subtitle: Cos del missatge

  ###################
 ### main_6.dart ###
###################
Exercici 1.6
Ampliació de l'exercici anterior on es fica una barra de navegació inferior estàtica amb 
3 categoríes, Missatges, contactes i configuració. (No fan res si cliques).

S'ha afegit al codi del main_5.dart:

BottomNavigationBar: Barra inferior
    3 ítems (Missatges, Contactes, Configuració)
    Icons personalitzades per cada secció
