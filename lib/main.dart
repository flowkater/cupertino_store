import 'package:cupertino_store/app.dart';
import 'package:cupertino_store/model/app_state_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppStateModel>(
      create: (_) => AppStateModel()..loadProducts(),
      child: CupertinoStoreApp(),
    ),
  );
}
