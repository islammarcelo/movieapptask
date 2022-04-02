import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';
import 'config/app_router.dart';

void main() {
  runApp(MovieAppTask());
}

 class MovieAppTask extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState(AppRouter());
 }

 class _MovieAppState extends State<MovieAppTask> {

  final AppRouter appRouter;

  _MovieAppState(this.appRouter);

  Future<String?> initUniLinks() async {
    try {
      final initialLink = await getInitialLink();
      return initialLink;
    } on PlatformException {

    }
  }
  @override
  void initState() {
    super.initState();
    initUniLinks();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }

 }
