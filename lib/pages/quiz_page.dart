import 'package:flutter/material.dart';
import 'package:be_english/components/custom_button.dart'; // Asegúrate de importar tus propios widgets aquí

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          // Pregunta 1
          _buildQuestion(
            question: 'What is the definition of "Avail oneself of"?',
            options: [
              'Option 1: Take advantage of something',
              'Option 2: Make use of',
              'Option 3: Go through',
              'Option 4: Check in',
            ],
          ),
          // Pregunta 2
          _buildQuestion(
            question: 'What is the definition of "Another Question"?',
            options: [
              'Option 1: Answer 1',
              'Option 2: Answer 2',
              'Option 3: Answer 3',
              'Option 4: Answer 4',
            ],
          ),
          // Aquí puedes agregar más preguntas según sea necesario
        ],
      ),
    );
  }

  Widget _buildQuestion(
      {required String question, required List<String> options}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          question,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        // Mostrar opciones de respuesta
        ...options
            .map((option) => CustomButton(
                  text: option,
                  onTap: () {
                    // Avanzar a la siguiente pregunta
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                ))
            .toList(),
        SizedBox(height: 20),
        // Mostrar el botón para enviar la respuesta
        CustomButton(
          text: 'Submit Answer',
          onTap: () {
            // Lógica para manejar el envío de la respuesta
          },
        ),
        Divider(), // Añade un divisor entre las preguntas
        SizedBox(height: 20),
      ],
    );
  }
}
