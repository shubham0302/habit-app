import 'package:flutter/material.dart';

class TextSizeResponsive extends StatelessWidget {
  final String string;
  final Color color;
  final double size;
  final FontWeight weight;
  final String? style;
  final TextAlign? alignment;
  final bool? isDotDot;
  const TextSizeResponsive(
      {Key? key,
      required this.string,
      required this.color,
      required this.size,
      required this.weight,
      this.alignment,
      this.style, this.isDotDot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    return Text(
      string,
      
      style: style == 'i'
          ? TextStyle(
              decoration: TextDecoration.lineThrough,
              color: color,
              fontSize: (size / 720.00) * sizeHeight > size
                  ? (size / 720.00) * sizeHeight
                  : (size / 720.00) * sizeHeight,
              fontWeight: weight,
            )
          : TextStyle(
              // decoration: TextDecoration.lineThrough,
              color: color,
              fontSize: (size / 720.00) * sizeHeight > size
                  ? (size / 720.00) * sizeHeight
                  : (size / 720.00) * sizeHeight,
              fontWeight: weight,
            ),
      textAlign: alignment,
      // maxLines: 1,
      overflow: isDotDot == true ?  TextOverflow.ellipsis : null,
    );
  }
}
