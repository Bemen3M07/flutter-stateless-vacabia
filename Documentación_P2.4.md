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
Exercici 2.1 - Saludar dinàmic
Aplicació amb estat mutable que canvia el salut segons el botó premut.

StatefulWidget: Permet canviar l'estat de la variable greeting
String greeting: Variable d'estat que canvia entre "Good Morning!" i "Good Night!"
setState(): Actualitza l'estat i redibuja la pantalla

ElevatedButton: Dos botons (Morning i Night)
ButtonStyle: Personalització amb backgroundColor vermell
onPressed: Canvia el valor de greeting amb setState()

  ###################
 ### main_2.dart ###
###################
Exercici 2.2 - Input de text amb salutació personalitzada
Entrada de text que genera un missatge de salutació personalitzat.

TextEditingController: Controla l'input del nom d'usuari
dispose(): Neteja el controller quan es destrueix el widget

TextField: Camp d'entrada de text
decoration: InputDecoration amb hint text i borders
onChanged: Actualitza l'estat en temps real

Conditional rendering: Mostra el missatge només si hi ha text

  ###################
 ### main_3.dart ###
###################
Exercici 2.3 - Joc d'endevinar números
Joc interactiu per endevinar un número aleatori entre 1 i 100.

Random(): Genera número aleatori entre 1 i 100
int.tryParse(): Converteix text a número amb validació
_intentos: Comptador d'intents

Lògica de comparació:
    Número correcte: Mostra missatge d'èxit
    Número menor: "El número és més gran"
    Número major: "El número és més petit"

TextField numéric: keyboardType per només números
_reiniciar(): Reset del joc amb nou número aleatori

  ###################
 ### main_4.dart ###
###################
Exercici 2.4 - Joc de daus amb imatges
Simulador de daus amb imatges que canvien aleatòriament.

Random(): Genera números aleatoris per als daus (1-6)
setState(): Actualitza els valors dels daus i redibuja

Assets d'imatges: Càrrega de dice_1.png fins dice_6.png
Image.asset(): Mostra la imatge corresponent al valor del dau
Row: Organitza els dos daus horitzontalment

FloatingActionButton: Botó per llançar els daus
AppBar: Barra superior amb títol personalitzat

  ###################
 ### main_5.dart ###
###################
Exercici 2.5 - Marcador de puntuació esportiva
Aplicació per portar el marcador d'un partit entre equip local i visitant.

Variables d'estat: _scoreLocal i _scoreVisitante
Funcions d'increment/decrement per cada equip
Validació: Els marcadors no poden ser negatius

Column i Row: Organització de la interfície
Text amb fontSize gran per mostrar puntuacions
ElevatedButton: Botons per sumar i restar punts

_reset(): Reinicia ambdós marcadors a 0

  ###################
 ### main_6.dart ###
###################
Exercici 2.6 - Llista de la compra
Aplicació per gestionar una llista de la compra amb afegir i eliminar elements.

Classe ShoppingItem: Model amb name, quantity i isCompleted
List<ShoppingItem>: Llista dinàmica d'elements
TextEditingController: Dos controllers per nom i quantitat

_addItem(): Afegeix element amb validació
_toggleItem(): Marca/desmarca element com completat
_removeItem(): Elimina element de la llista

ListView.builder: Construcció eficient de llista dinàmica
ListTile: Widget predefinit amb checkbox, títol i botó d'eliminació
SnackBar: Missatges d'error per camps buits

  ###################
 ### main_7.dart ###
###################
Exercici 2.7 - Comptador amb Provider (State Management)
Aplicació amb gestió d'estat global utilitzant Provider pattern.

ChangeNotifierProvider: Proveeix l'estat global
CounterProvider: Classe que gestiona l'estat del comptador
notifyListeners(): Notifica canvis a tots els widgets que escolten

Provider.of<CounterProvider>(): Accés al provider
context.watch<CounterProvider>(): Escolta canvis automàticament
context.read<CounterProvider>(): Accés sense escoltar canvis

BottomNavigationBar: Navegació entre 3 pàgines
HomeScreen: Gestiona la navegació amb índex
Page1: Pantalla amb botó per incrementar
Page2 i Page3: Pantalles que mostren el valor del comptador

  ###################
 ### main_8.dart ###
###################
Exercici 2.8 - Navegador d'exercicis amb Drawer
Aplicació que permet navegar entre tots els exercicis anteriors utilitzant un menú lateral.

NavigationProvider: Provider per gestionar l'índex de l'exercici actual
Drawer: Menú lateral amb llista d'exercicis
DrawerHeader: Capçalera del drawer amb icona i títol

ListTile: Elements del menú amb:
    leading: Icona per cada exercici
    title: Nom de l'exercici
    selected: Highlighting de l'exercici actual
    onTap: Canvia l'exercici i tanca el drawer

_buildCurrentExercise(): Switch que retorna el widget corresponent
Navigator.pop(): Tanca el drawer després de seleccionar