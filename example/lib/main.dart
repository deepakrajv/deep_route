import 'package:deep_route/deep_material_app.dart';
import 'package:deep_route/deep_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DeepMaterialApp(
      title: 'DeepRoute Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        // If you push the SecondPage route
        if (settings.name == SecondPage.routeName) {
          // Cast the arguments to the correct
          // type: String.
          final args = settings.arguments as String;

          // Then, extract the required data from
          // the arguments and pass the data to the
          // correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return SecondPage(
                message: args,
              );
            },
          );
        }
        // The code only supports
        // SecondPage.routeName right now.
        // Other values need to be implemented if we
        // add them. The assertion here will help remind
        // us of that higher up in the call stack, since
        // this assertion would otherwise fire somewhere
        // in the framework.
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      home: const MyHomePage(title: 'DeepRoute Demo Home'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Push the button and Navigate to next page using DeepRoute',
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.maxFinite, 40)),
              onPressed: () {
                DeepRoute.to(SecondPage(
                  message: 'Normal Page Route',
                ));
              },
              child: Text('Next Page'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.maxFinite, 40)),
              onPressed: () {
                DeepRoute.toNamed(SecondPage.routeName,
                    arguments: 'Named Route Used');
              },
              child: Text('Next Page (Using Named Route)'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.maxFinite, 40)),
              onPressed: _nextPage,
              child: Text('Next Page (Without using context)'),
            ),
          ],
        ),
      ),
    );
  }

  void _nextPage() {
    DeepRoute.toNamed(SecondPage.routeName,
        arguments: 'Navigated without context');
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.message}) : super(key: key);
  static final routeName = '/second';
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(child: Text(message)),
    );
  }
}
