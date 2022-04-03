import 'package:flutter/material.dart';
import 'package:movieapptask/config/app_colors.dart';
import 'package:movieapptask/config/size_config.dart';
import 'package:movieapptask/config/strings.dart';
import 'package:movieapptask/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  MovieAppTask movieAppTask = new MovieAppTask();

  @override
  void initState() {

    super.initState();
      if(movieAppTask.latestUri.toString().contains("/movies_screen")){
        Navigator.pushReplacementNamed(context, moviesScreen);
      }else {
        Future.delayed(Duration(seconds: 3), () async {
          Navigator.pushReplacementNamed(context, moviesScreen);
        });
      }

  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.myBlack,
      body: Center(
        child: Container(
          child: Image.asset(
                'assets/images/splash-movie.gif',
                fit: BoxFit.fitHeight,
                width:  SizeConfig.blockSizeVertical*70,
                height: SizeConfig.blockSizeHorizontal*70,
              ),
        ),


      ),
    );
  }
}
