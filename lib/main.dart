import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:bukatutupapp/pages/details_page.dart';
import 'package:bukatutupapp/pages/tabbar.dart';

import 'package:bukatutupapp/providers/articles.dart';
import 'package:bukatutupapp/providers/categories.dart';
import 'package:bukatutupapp/providers/user.dart';

class FlutterNewsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final articlesChangeNotifier = ChangeNotifierProvider.value(
      value: ArticlesProvider(),
    );
    final categoriesChangeNotifier = ChangeNotifierProvider.value(
      value: CategoriesProvider(),
    );
    final userChangeNotifier = ChangeNotifierProvider.value(
      value: UserProvider(),
    );
    return MultiProvider(
      providers: [
        articlesChangeNotifier,
        categoriesChangeNotifier,
        userChangeNotifier,
      ],
      child: MaterialApp(
        title: 'Buka Tutup Net',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        initialRoute: Tabbar.routeName,
        routes: {
          Tabbar.routeName: (ctx) => Tabbar(),
          DetailsPage.routeName: (ctx) => DetailsPage(),
        },
      ),
    );
  }
}

void main() {
  timeago.setLocaleMessages('fr', timeago.FrMessages());
  return runApp(FlutterNewsApp());
}
