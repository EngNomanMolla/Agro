import 'package:flutter/material.dart';
import 'package:smart_biniyog/App/Constant/Colors.dart';


class ProductStepper extends StatefulWidget {
  final Function(int currentValue) onDecrement, onIncrement;

  const ProductStepper(
      {Key? key, required this.onDecrement, required this.onIncrement})
      : super(key: key);

  @override
  State<ProductStepper> createState() => _ProductStepperState();
}

class _ProductStepperState extends State<ProductStepper> {
  int _currentValue = 1;
  final TextEditingController _stepperTEController = TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        stepperButton(
          onTap: () {
            if (_currentValue > 1) {
              _currentValue--;
              _stepperTEController.text = _currentValue.toString();
              widget.onDecrement(_currentValue);
            }
          },
          iconData: Icons.remove,
        ),
        SizedBox(
          width: 50,
          height: 30,
          child: TextField(
            controller: _stepperTEController,
            enabled: false,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
        stepperButton(
          onTap: () {
            if (_currentValue < 20) {
              _currentValue++;
              widget.onIncrement(_currentValue);
              _stepperTEController.text = _currentValue.toString();
            }
          },
          iconData: Icons.add,
        ),
      ],
    );
  }

  Widget stepperButton(
      {required VoidCallback onTap, required IconData iconData}) {
    return SizedBox(
      width: 40,
      height: 40,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.deepOrange, borderRadius: BorderRadius.circular(8)),
          child: Icon(
            iconData,
            size: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}