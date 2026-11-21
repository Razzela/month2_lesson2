import 'package:flutter/material.dart';

void main() {
  runApp(FeedbackApp());
}

class FeedbackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeedbackScreen(),
    );
  }
}


class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text(
                'Обратная связь',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Введите ваше имя и нажмите кнопку отправить',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 24),
              FeedbackForm(),
            ],
          ),
        ),
      ),
    );
  }
}




class FeedbackForm extends StatefulWidget {
  @override
  State<FeedbackForm> createState() => FeedbackFormState();
}

class FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController controller = TextEditingController();

  String name = "";
  bool isSent = false;
  bool hasError = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void send() {
    setState(() {
      if (name.trim().isEmpty) {
        hasError = true;
        isSent = false;
      } else {
        hasError = false;
        isSent = true;
        controller.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          onChanged: (value) {
            name = value;
          },
          decoration: InputDecoration(
            labelText: 'Ваше имя',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: send,
            child: Text('Отправить'),
          ),
        ),
        SizedBox(height: 16),

        if (hasError)
          Text(
            'Введите имя',
            style: TextStyle(fontSize: 16, color: Colors.red),
          ),

        if (isSent)
        Center(
        child: Text(
            'Отправлено! Спасибо, $name',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
            ),
          ),
      ],
    );
  }
}