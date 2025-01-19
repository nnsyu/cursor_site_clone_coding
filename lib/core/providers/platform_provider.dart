import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../enums/platform_type.dart';

// WidgetsBindingObserver를 사용하여 화면 크기 변경을 감지하는 provider
final platformProvider =
    StateNotifierProvider<PlatformNotifier, PlatformType>((ref) {
  return PlatformNotifier();
});

class PlatformNotifier extends StateNotifier<PlatformType>
    with WidgetsBindingObserver {
  PlatformNotifier() : super(PlatformType.mobile) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void updatePlatform(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    state = PlatformType.fromWidth(width);
  }
}

// 플랫폼별 위젯을 빌드하기 위한 유틸리티 함수
Widget buildPlatformWidget({
  required BuildContext context,
  required WidgetRef ref,
  required Widget Function() webBuilder,
  required Widget Function() tabletBuilder,
  required Widget Function() mobileBuilder,
}) {
  // build 시점에 platform 업데이트
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ref.read(platformProvider.notifier).updatePlatform(context);
  });

  final platform = ref.watch(platformProvider);

  switch (platform) {
    case PlatformType.web:
      return webBuilder();
    case PlatformType.tablet:
      return tabletBuilder();
    case PlatformType.mobile:
      return mobileBuilder();
  }
}
