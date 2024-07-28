import 'package:flutter/material.dart';

class PainRatingWidget extends StatefulWidget {
  final double height;
  final double width;
  final double selectedSizeFactor;
  final double unselectedSizeFactor;
  final Function(int) onRatingSelected;

  const PainRatingWidget({
    Key? key,
    required this.height,
    required this.width,
    this.selectedSizeFactor = 0.7,
    this.unselectedSizeFactor = 0.6,
    required this.onRatingSelected,
  }) : super(key: key);

  @override
  State<PainRatingWidget> createState() => _PainRatingWidgetState();
}

class _PainRatingWidgetState extends State<PainRatingWidget> {
  int _selectedButton = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFBFD6AA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xFF41733D),
          width: 2,
        ),
      ),
      height: widget.height,
      width: widget.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(5, (index) {
          int buttonIndex = index + 1;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedButton = buttonIndex;
                widget.onRatingSelected(buttonIndex);
              });
            },
            child: Center(
              child: Image.asset(
                'assets/images/smile${buttonIndex}.png',
                height: _selectedButton != buttonIndex
                    ? widget.height * widget.unselectedSizeFactor
                    : widget.height * widget.selectedSizeFactor,
              ),
            ),
          );
        })
            .expand((childWidget) => [
                  childWidget,
                  if (childWidget !=
                      Image.asset('')) // Add separators between buttons
                    Text(
                      '|',
                      style: TextStyle(
                        color: Color(0xFF042D00),
                        fontSize: widget.height * 0.7,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                ])
            .toList(),
      ),
    );
  }
}
