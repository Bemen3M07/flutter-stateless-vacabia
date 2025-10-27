import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class Message {
  final String author;
  final String body;

  Message(this.author, this.body);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Missatges infinits',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MessageListPage(),
    );
  }
}

class MessageListPage extends StatefulWidget {
  const MessageListPage({super.key});

  @override
  State<MessageListPage> createState() => _MessageListPageState();
}

class _MessageListPageState extends State<MessageListPage> {
  final List<String> names = [
    "Ellison Curry",
    "Briggs Willis",
    "Alexa Murphy",
    "Cameron Berry",
    "Annabelle Villarreal",
    "Nikolai Wiley",
    "Lauryn Morrow",
    "Kyree Hardy",
    "Wells Wilson",
    "Luna Foster",
    "Kayden Taylor",
    "Sofia Mann",
    "Nehemiah Randall",
    "Christina Gordon",
    "Karter Kramer",
    "Hanna Morales",
    "Megan Delarosa",
    "Osiris Johnson",
    "Emma Atkins",
    "Cason McKee",
    "Kori Walls",
    "Larry Shepherd",
  ];

  final String body =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ac vestibulum nunc.";

  final Random random = Random();
  final List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    _generateMoreMessages();
  }

  void _generateMoreMessages() {
    // Genera 20 missatges més
    final newMessages = List.generate(20, (index) {
      return Message(
        names[random.nextInt(names.length)],
        body,
      );
    });
    messages.addAll(newMessages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Llista de missatges'),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          // Si arribem al final, generem més missatges
          if (scrollInfo.metrics.pixels ==
              scrollInfo.metrics.maxScrollExtent) {
            setState(() {
              _generateMoreMessages();
            });
          }
          return false;
        },
        child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(message.author[0]),
              ),
              title: Text(message.author),
              subtitle: Text(message.body),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // Sense funcionalitat
        child: const Icon(Icons.add),
      ),
    );
  }
}
