import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';
import 'config/app_router.dart';
import 'config/strings.dart';

void main() {
  runApp(MovieAppTask());
}

 class MovieAppTask extends StatefulWidget {
   Uri? latestUri;
  @override
  _MovieAppState createState() => _MovieAppState(AppRouter());
 }

 class _MovieAppState extends State<MovieAppTask> {

  final AppRouter appRouter;
  StreamSubscription? _sub;
  Object? _err;


  _MovieAppState(this.appRouter);

  void _handleIncomingLinks() {
    if (!kIsWeb) {
      _sub = uriLinkStream.listen((Uri? uri) {
        if (!mounted) return;
        print('got uri: $uri');
        setState(() {
          widget.latestUri = uri;
          _err = null;
        });
      }, onError: (Object err) {
        if (!mounted) return;
        print('got err: $err');
        setState(() {
          widget.latestUri = null;
          if (err is FormatException) {
            _err = err;
          } else {
            _err = null;
          }
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _handleIncomingLinks();
    }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }

}
