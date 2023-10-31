import 'package:flutter/material.dart';
import 'package:flutter_application_1/form/budget_page.dart';
import 'package:flutter_application_1/form/email_question_page.dart';
import 'package:flutter_application_1/form/name_question_page.dart';
import 'package:flutter_application_1/form/result_page.dart';
import 'package:flutter_application_1/form/studies_question_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  HomePage({Key? key, required this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  String name = '';
  String email = '';
  double budget = 0.0;
  List<String> interests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido ${widget.username}'),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          _buildNameQuestionPage(),
          _buildEmailQuestionPage(),
          _buildBudgetPage(),
          StudiesQuestionPage(username: widget.username, onNext: _onStudiesSelected),
          // Agrega más páginas según sea necesario
        ],
      ),
    );
  }

  Widget _buildNameQuestionPage() {
    return NameQuestionPage(
      username: widget.username,
      onNext: _onNameSelected,
    );
  }

  void _onNameSelected(String name) {
    this.name = name;
    _nextPage();
  }

  void _onEmailSelected(String email) {
    this.email = email;
    _nextPage();
  }

  void _onBudgetSelected(double budget) {
    this.budget = budget;
    _nextPage();
  }

  void _onStudiesSelected(List<String> selectedInterests) {
    this.interests = selectedInterests;
    _navigateToResultPage();
  }

  void _navigateToResultPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ResultPage(
          username: name,
          email: email,
          budget: budget,
          interests: interests,
        ),
      ),
    );
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  Widget _buildEmailQuestionPage() {
    return EmailQuestionPage(
      username: widget.username,
      onNext: _onEmailSelected,
    );
  }

  Widget _buildBudgetPage() {
    return BudgetPage(onBudgetSelected: _onBudgetSelected);
  }
}
