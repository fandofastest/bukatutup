import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bukatutupapp/widgets/articles.dart';
import 'package:bukatutupapp/widgets/categories.dart';

import 'package:bukatutupapp/providers/articles.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    var articlesProvider = Provider.of<ArticlesProvider>(
      context,
      listen: false,
    );
    return Scaffold(

      body: RefreshIndicator(
        onRefresh: articlesProvider.refresh,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AppBar(
                elevation: 0,
                title: Text(
                  'Buka Tutup Net',
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.search,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              Categories(),
              Articles(),
            ],
          ),
        ),
      ),
    );
  }
}
