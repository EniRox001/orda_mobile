import 'package:flutter/material.dart';

class OrdaFadedImage extends StatelessWidget {
  const OrdaFadedImage({required this.image, super.key});

  final String image;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
