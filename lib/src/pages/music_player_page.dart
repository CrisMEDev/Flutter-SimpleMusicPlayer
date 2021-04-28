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

    final screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only( top: screenSize.height * 0.1 ),
      padding: EdgeInsets.symmetric( horizontal: screenSize.width * 0.1 ),
      child: Row(
        children: [
          _ImagenDisco(),
          SizedBox( width: 35.0, ),

          _BarraProgreso(),
          SizedBox( width: 20.0, ),
        ],
      ),
    );
  }
}

class _BarraProgreso extends StatelessWidget {

  final estiloDuracion = TextStyle( color: Colors.white70.withOpacity(0.5), letterSpacing: 1.0 );

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          Text('00:00', style: estiloDuracion),
          SizedBox( height: 7.0, ),
          Stack(
            children: [
              Container(
                width: 3.0,
                height: screenSize.width * 0.55,
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.vertical( top: Radius.circular(10.0), bottom: Radius.circular(10.0) )
                ),
              ),

              Positioned(
                bottom: 0,                                // Para llenar la barra hacia arriba
                child: Container(
                  width: 3.0,
                  height: screenSize.width * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent[100].withOpacity(0.5),
                    borderRadius: BorderRadius.vertical( top: Radius.circular(10.0), bottom: Radius.circular(10.0) ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Colors.white,
                        spreadRadius: 0.5
                      )
                    ]
                  ),
                ),
              )
            ],
          ),
          SizedBox( height: 7.0, ),
          Text('00:00', style: estiloDuracion),
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
              width: (screenSize.width * 0.55) * 0.14,
              height: (screenSize.width * 0.55) * 0.14,
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