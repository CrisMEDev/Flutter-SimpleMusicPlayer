import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:music_player/src/helpers/helpers.dart';
import 'package:music_player/src/models/audio_player_model.dart';
import 'package:music_player/src/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new AudioPlayerModel(),

      child: Scaffold(
        body: Stack(
          children: [

            Background(),

            Column(
              children: [
                CustomAppbar(),

                ImagenDiscoDuracion(),

                TituloPlay(),

                SizedBox( height: 5.0 ),
                Expanded(
                  child: Lyrics(),
                ),
                SizedBox( height: 5.0 )
              ],
            ),
          ],
        )
      ),
    );
  }
}

class Background extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(70.0) ),
        color: Colors.blueGrey,

        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: [
            Color(0xFF33333E),
            Color(0xFF201E28)
          ]
        )
      ),
    );
  }
}

class Lyrics extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final lyrics = getLyrics();

    return Container(
      child: ListWheelScrollView(
        itemExtent: 42,
        diameterRatio: 1.5,
        physics: BouncingScrollPhysics(),

        children: lyrics.map((linea) => Text(
          linea,
          overflow: TextOverflow.fade,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white60.withOpacity(0.75),
            letterSpacing: 1.0,

          ),)
        ).toList(),
      ),
    );
  }
}

class TituloPlay extends StatefulWidget {

  @override
  _TituloPlayState createState() => _TituloPlayState();
}

class _TituloPlayState extends State<TituloPlay> with SingleTickerProviderStateMixin{

  bool isPlaying = false;
  AnimationController playAnimation;

  @override
  void initState() {
    playAnimation = AnimationController( vsync: this, duration: Duration( milliseconds: 500 ) );
    super.initState();
  }

  @override
  void dispose() {
    playAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric( horizontal: screenSize.width * 0.13),
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          Column(
            children: [
              Text('Far Away', style: TextStyle( fontSize: 30, color: Colors.white.withOpacity(0.8) ), ),
              Text('--Breaking Benjamin--', style: TextStyle( fontSize: 15, color: Colors.white.withOpacity(0.5) ), ),
            ],
          ),
          Spacer(),

          FloatingActionButton(
            backgroundColor: Color(0xFF00FF84).withOpacity(0.6),
            splashColor: Colors.blueGrey[300],
            child: AnimatedIcon(
              color: Colors.white60.withOpacity(0.75),
              icon: AnimatedIcons.play_pause,
              progress: playAnimation
            ),

            onPressed: (){

              final audioPlayerProvider = Provider.of<AudioPlayerModel>(context, listen: false);

              if ( this.isPlaying ){
                this.playAnimation.reverse();
                this.isPlaying = false;
                audioPlayerProvider.controller.stop();
              } else {
                this.playAnimation.forward();
                this.isPlaying = true;
                audioPlayerProvider.controller.repeat() ;
              }
            },
          ),
        ],
      ),
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
    final audioPlayerProvider = Provider.of<AudioPlayerModel>(context);

    return Container(
      padding: EdgeInsets.all(15),
      width: screenSize.width * 0.55,
      height: screenSize.width * 0.55,

      child: ClipRRect(
        borderRadius: BorderRadius.circular(200.0),
        child: Stack(
          alignment: Alignment.center,    // Para centrar los hijos del stack

          children: [
            SpinPerfect(
              duration: Duration( seconds: 10 ),
              infinite: true,
              manualTrigger: true,
              controller: ( animationController ) => audioPlayerProvider.controller = animationController,    // Para manejar el
                                                                                                              // la animacion
              child: Image(image: AssetImage('assets/aurora.jpg'))
            ),

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