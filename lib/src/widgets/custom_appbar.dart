import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric( horizontal: screenSize.width * 0.1, vertical: screenSize.height * 0.05 ),
          child: Row(
            children: [
              Icon( FontAwesomeIcons.chevronLeft ),
              Spacer(),

              Icon( FontAwesomeIcons.commentAlt ),
              SizedBox( width: 20.0, ),

              Icon( FontAwesomeIcons.headphonesAlt ),
              SizedBox( width: 20.0, ),

              Icon( FontAwesomeIcons.externalLinkAlt ),
              
            ],
          ),
        ),
      ),
    );
  }
}
