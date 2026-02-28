import 'package:flutter/material.dart';
import 'package:pragma_acercamiento/config/router/app_router_config.dart';
import 'package:ui_kit/ui_kit.dart';
import 'flavors/flavor_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_acercamiento/presentation/cubit/cat_list/cat_list_cubit.dart';
import 'package:pragma_acercamiento/domain/repositories/cat_repository.dart';
import 'package:pragma_acercamiento/core/di/injection_container.dart';
import 'package:pragma_acercamiento/domain/repositories/i_cat_local_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CatListCubit(getItApp<CatRepository>(), getItApp<ICatLocalRepository>()),
      child: UIkitConfigProvider(
        designWidth: 393,
        designHeight: 852,
        child: MaterialApp.router(
          title: FlavorConfig.appName,
          theme: PragmaTheme.lightTheme,
          darkTheme: PragmaTheme.darkTheme,
          themeMode: ThemeMode.dark,
          routerConfig: appRouter,
        ),
      ),
    );
  }
}
