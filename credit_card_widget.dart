import 'package:flutter/material.dart';


class CreditCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 200,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.lightBlue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              width: 50,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(height: 10),
                CustomPaint(
                size: Size(60, 40),
                painter: MyPainter(),
              ),
                
                const Text(
                  '1234 5678 9012 3456',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 15),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CARD HOLDER',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'John Doe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'VALID THRU',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '12/25',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    // Define the main rectangle with beveled corners
    RRect mainRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, width, height),
      const Radius.circular(5.0), // Adjust the radius as needed for the bevel effect
    );

    // Define the golden radial gradient colors
    List<Color> gradientColors = [Colors.yellow.shade700, Colors.orange];

    // Create the golden radial gradient
    Paint mainPaint = Paint()
      ..shader = RadialGradient(
        colors: gradientColors,
        radius: 1.0,
        center: Alignment.center,
      ).createShader(mainRect.outerRect);

    // Draw the main rectangle with beveled corners and golden radial gradient
    canvas.drawRRect(mainRect, mainPaint);

    // Divide the main rectangle into three parts vertically
    double partWidth = width / 3;

    Paint blackPaint = Paint()..color = Colors.black;

    // Draw black lines to divide the main rectangle into three parts vertically
    canvas.drawLine(Offset(partWidth, 0), Offset(partWidth, height), blackPaint);
    canvas.drawLine(Offset(partWidth * 2, 0), Offset(partWidth * 2, height), blackPaint);

    // Draw black lines to divide the first and third part horizontally
    canvas.drawLine(Offset(0, height / 3), Offset(partWidth, height / 3), blackPaint);
    canvas.drawLine(Offset(0, height * 2 / 3), Offset(partWidth, height * 2 / 3), blackPaint);
    canvas.drawLine(Offset(partWidth * 2, height / 3), Offset(width, height / 3), blackPaint);
    canvas.drawLine(Offset(partWidth * 2, height * 2 / 3), Offset(width, height * 2 / 3), blackPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
