import 'package:been_here/app/app.dart';
import 'package:been_here/app/bootstrap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await bootstrap(() => const ProviderScope(child: BeenHereApp()));
}
