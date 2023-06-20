import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightScheme, ColorScheme? darkDynamic) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: lightScheme,
            brightness: Brightness.light,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkDynamic,
            useMaterial3: true,
            brightness: Brightness.dark,
          ),
          themeMode: ThemeMode.system,
          home: Scaffold(
            body: Container(),
          ),
        );
      },
    );
  }
}

// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   late final PageController pageController;
//   int _presentPage = 0;

//   @override
//   void initState() {
//     pageController = PageController(
//       initialPage: _presentPage,
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }

//   void handleBullet(int index) {
//     setState(() {
//       _presentPage = index;
//     });
//     pageController.animateToPage(
//       _presentPage,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeIn,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     return Stack(
//       alignment: const Alignment(0, 0.95),
//       children: [
//         PageView.builder(
//           controller: pageController,
//           itemCount: 4,
//           onPageChanged: (value) {
//             setState(() {
//               _presentPage = value;
//             });
//           },
//           itemBuilder: (context, index) {
//             return Container(
//               decoration: BoxDecoration(
//                 color: theme.colorScheme.background,
//                 border: Border.symmetric(
//                   vertical: BorderSide(
//                     width: 2,
//                     color: theme.colorScheme.onBackground,
//                   ),
//                 ),
//               ),
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       "Page ${index + 1}",
//                       style: theme.textTheme.displayLarge!.copyWith(
//                         color: theme.colorScheme.onBackground,
//                       ),
//                     ),
//                     SnackbarButton(theme: theme, index: index),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             for (int index = 0; index < 4; index++)
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: GestureDetector(
//                   onTap: () => handleBullet(index),
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.easeIn,
//                     height: 10,
//                     width: index == _presentPage ? 20 : 10,
//                     decoration: BoxDecoration(
//                       color: theme.colorScheme.onPrimaryContainer.withOpacity(
//                         index == _presentPage ? 1 : 0.2,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class SnackbarButton extends StatelessWidget {
//   const SnackbarButton({
//     super.key,
//     required this.theme,
//     required this.index,
//   });

//   final ThemeData theme;
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       onPressed: () {
//         final SnackBar snackBar = SnackBar(
//           content: Text("Viewing Page ${index + 1}"),
//           duration: const Duration(seconds: 1),
//           margin: const EdgeInsets.all(10),
//           behavior: SnackBarBehavior.floating,
//           backgroundColor: theme.colorScheme.onBackground,
//           showCloseIcon: true,
//         );
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       },
//       color: theme.colorScheme.onPrimaryContainer,
//       textColor: theme.colorScheme.onPrimary,
//       splashColor: theme.colorScheme.primary,
//       padding: const EdgeInsets.symmetric(
//         horizontal: 20,
//         vertical: 10,
//       ),
//       child: const Text("Open Snackbar"),
//     );
//   }
// }
