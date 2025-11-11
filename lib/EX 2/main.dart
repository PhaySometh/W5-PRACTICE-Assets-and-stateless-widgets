import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Custom Buttons"), centerTitle: false),
        backgroundColor: Colors.amber,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                buttonLable: "Submit",
                buttonIcon: Icons.check,
                iconPosition: IconPosition.left,
                buttonType: ButtonType.primary,
              ),
              SizedBox(height: 10),
              CustomButton(
                buttonLable: "Time",
                buttonIcon: Icons.lock_clock,
                iconPosition: IconPosition.right,
                buttonType: ButtonType.secondary,
              ),
              SizedBox(height: 10),
              CustomButton(
                buttonLable: "Account",
                buttonIcon: Icons.account_balance,
                iconPosition: IconPosition.right,
                buttonType: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum ButtonType {
  primary(color: Colors.blue),
  secondary(color: Colors.green),
  disabled(color: Colors.grey);

  final Color color;

  const ButtonType({required this.color});
}

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String buttonLable;
  final IconData buttonIcon;
  final IconPosition? iconPosition;
  final ButtonType? buttonType;

  const CustomButton({
    super.key,
    required this.buttonLable,
    required this.buttonIcon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: buttonType?.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: iconPosition == IconPosition.left
            ? [
                Icon(buttonIcon, size: 16, color: Colors.black),
                SizedBox(width: 10),
                Text(
                  buttonLable,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ]
            : [
                Text(
                  buttonLable,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(width: 10),
                Icon(buttonIcon, size: 16, color: Colors.black),
              ],
      ),
    );
  }
}
