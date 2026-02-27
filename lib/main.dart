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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: _getFlavorColor(), borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Text(
                    'Environment: ${FlavorConfig.appName}',
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('API: ${FlavorConfig.apiBaseUrl}', style: const TextStyle(color: Colors.white, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text('Contador'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _incrementCounter, tooltip: 'Increment', child: const Icon(Icons.add)),
    );
  }

  Color _getFlavorColor() {
    if (FlavorConfig.isDev) {
      return Colors.orange;
    } else if (FlavorConfig.isUat) {
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }
}
