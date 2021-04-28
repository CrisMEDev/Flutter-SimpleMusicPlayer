import 'package:flutter/material.dart';
import 'package:music_player/src/widgets/custom_appbar.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(),

          ImagenDiscoDuracion(),
        ],
      )
    );
  }
}

class ImagenDiscoDuracion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Row(
        children: [
          _ImagenDisco(),

          // TODO: Barra progreso
        ],
      ),
    );
  }
}

class _ImagenDisco extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(15),
      width: screenSize.width * 0.55,
      height: screenSize.width * 0.55,

      child: ClipRRect(
        borderRadius: BorderRadius.circular(200.0),
        child: Stack(
          alignment: Alignment.center,    // Para centrar los hijos del stack

          children: [
            Image(image: AssetImage('assets/aurora.jpg')),

            Container(
              width: (screenSize.width * 0.55) * 0.16,
              height: (screenSize.width * 0.55) * 0.16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black38
              ),
            ),

            Container(
              width: (screenSize.width * 0.55) * 0.10,
              height: (screenSize.width * 0.55) * 0.10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF1C1C25).withOpacity(0.8)
              ),
            ),
          ],
        )
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            spreadRadius: 2.0,
            color: Colors.white.withOpacity(0.8)
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xFF484750),
            Color(0xFF1E1C24),
          ]
        )
      ),
    );
  }
}