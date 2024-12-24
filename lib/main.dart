import '../screens/chat.dart';
import '../screens/splash.dart';
import 'package:flutter/material.dart';

import 'screens/auth.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 85, 47, 211),
);
final theme = ThemeData().copyWith(
  colorScheme: kColorScheme,
  scaffoldBackgroundColor: kColorScheme.primary,
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const AuthScreen()

        // StreamBuilder(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const SplashScreen();
        //     }
        //     if (snapshot.hasData) {
        //       return const ChatScreen();
        //     }
        //     return const AuthScreen();
        //   },
        // ),
        );
  }
}
