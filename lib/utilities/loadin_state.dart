import 'package:flutter/material.dart';
import 'package:wordy/utilities/skelenton_line.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({
    super.key,
    required this.palette,
  });

  final ColorScheme palette;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(
          maxWidth: 600,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SkeletonLine(width: 250, height: 40),
                const SizedBox(width: 20),
                ClipOval(
                  child: SkeletonLine(
                    width: 35,
                    height: 35,
                    child: Icon(
                      Icons.mic_rounded,
                      color: palette.primary,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const SkeletonLine(width: 100, height: 35),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              height: 450,
              width: double.infinity,
              decoration: BoxDecoration(
                color: palette.primary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: palette.primaryContainer,
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SkeletonLine(width: 120, height: 30),
                  const SizedBox(height: 20),
                  const SkeletonLine(width: double.infinity, height: 20),
                  const SizedBox(height: 5),
                  const SkeletonLine(width: 200, height: 20),
                  const SizedBox(height: 20),
                  const SkeletonLine(width: double.infinity, height: 20),
                  const SizedBox(height: 5),
                  const SkeletonLine(width: 300, height: 20),
                  const SizedBox(height: 20),
                  const SkeletonLine(width: 150, height: 20),
                  const SizedBox(height: 20),
                  const SkeletonLine(width: double.infinity, height: 20),
                  const SizedBox(height: 10),
                  const SkeletonLine(width: 200, height: 20),
                  const SizedBox(
                    height: 50,
                  ),
                  const SkeletonLine(width: 100, height: 20),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const SkeletonLine(width: 70, height: 35),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
