
#### What is DeepRoute?

It’s a Flutter navigation package, it requires a minimal amount of code to generate everything
needed for navigation inside of your App.

## Installing
Add DeepRoute to your pubspec.yaml file:

```dart
dependencies:
deep_route:
```
Import DeepRoute in files that it will be used:
```dart
import 'package:deep_route/deep_route.dart';
```

## Usage

For sample code look in `/example` folder.

Step 1: Add "DeepMaterialApp" before your MaterialApp, use DeepMaterialApp instead of MaterialApp

```dart
void main() => runApp(DeepMaterialApp(home: Home()));
```
Step 2: Use DeepRoute for navigation like
```dart
DeepRouter.toNamed('/RouteName', arguments: 'sample');
```

## Additional information

This package is in its early development stage.
