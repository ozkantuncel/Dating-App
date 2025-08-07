import 'dart:async';

import 'package:dating_app/core/init_adapter/init_adapter.dart';
import 'package:dating_app/injection_container.dart';

class DependencyInjectionInit implements InitAdapter {
  @override
  FutureOr<void> initAdapter() async{
    await setupLocator();
  }

}