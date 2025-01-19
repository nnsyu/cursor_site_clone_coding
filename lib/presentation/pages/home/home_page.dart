import 'package:cursor_clone_coding/config/design_system/text_styles.dart';
import 'package:cursor_clone_coding/config/design_system/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cursor_clone_coding/config/design_system/colors.dart';
import 'package:cursor_clone_coding/config/design_system/gaps.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cursor_clone_coding/core/providers/platform_provider.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return buildPlatformWidget(
      context: context,
      ref: ref,
      webBuilder: () => _buildWebLayout(context),
      tabletBuilder: () => _buildTabletLayout(context),
      mobileBuilder: () => _buildMobileLayout(context),
    );
  }

  Widget _buildWebLayout(BuildContext context) {
    final isScrolled = useState<bool>(false);
    final scrollController = useScrollController();

    void scrollListener() {
      if (scrollController.offset > 0) {
        isScrolled.value = true;
      } else if (scrollController.offset <= 0) {
        isScrolled.value = false;
      }
    }

    useEffect(() {
      scrollController.addListener(scrollListener);
      return () => scrollController.removeListener(scrollListener);
    }, [scrollController]);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 112),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Text(
                'This is not the actual product of Cursor !!',
                style: TextStyle(color: Colors.red),
              ),
            ),
            Positioned.fill(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    SizedBox(
                      // color: Colors.blueGrey,
                      width: double.infinity,
                      height: 5000,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 1000.0),
                        child: Text('Hello'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: _buildWebHeader(context, isScrolled.value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  children: [],
                ),
              ),
            ),
            _buildHeader(const EdgeInsets.all(16)),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 60),
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  children: [],
                ),
              ),
            ),
            _buildHeader(const EdgeInsets.all(12)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLogoWithText(),
          Row(
            children: [
              AppDarkButton(
                child: Icon(
                  FeatherIcons.user,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
              AppGaps.h12,
              AppLightButton(
                child: Row(
                  children: [
                    Icon(Icons.apple),
                    AppGaps.h8,
                    Text(
                      'DOWNLOAD',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWebHeader(BuildContext context, bool isScrolled) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: isScrolled ? Colors.grey.shade900 : Colors.transparent,
              width: 0.8),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(isScrolled ? 0.06 : 0),
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
        ),
        constraints: BoxConstraints(maxWidth: 1600),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLogoWithText(),
            _buildHeaderMenu(context),
            Row(
              children: [
                AppDarkButton(
                  child: Icon(
                    FeatherIcons.user,
                    color: AppColors.white,
                    size: 24,
                  ),
                ),
                AppGaps.h12,
                AppLightButton(
                  child: Row(
                    children: [
                      Icon(Icons.apple),
                      AppGaps.h8,
                      Text(
                        'DOWNLOAD',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderMenu(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        final Widget gap = screenWidth > 1280 ? AppGaps.h42 : AppGaps.h22;

        final menuItems = [
          'PRICING',
          'FEATURES',
          'ENTERPRISE',
          'BLOG',
          'FORUM',
          'CAREERS',
        ];

        return Row(
          children: menuItems.map((item) {
            return Row(
              children: [
                Text(
                  item,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.gray400,
                  ),
                ),
                gap,
              ],
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildLogoWithText() {
    return HookBuilder(builder: (context) {
      final isHovered = useState(false);
      final videoController = useState<VideoPlayerController?>(null);
      final isInitialized = useState(false);

      useEffect(() {
        videoController.value =
            VideoPlayerController.asset('assets/videos/logo-black.mp4')
              ..initialize().then((_) {
                videoController.value?.setPlaybackSpeed(2.0);
                print('비디오 초기화 완료');
                isInitialized.value = true;
              }).catchError((error) {
                print('비디오 초기화 실패: $error');
              });
        return () => videoController.value?.dispose();
      }, const []);

      return MouseRegion(
        onEnter: (_) async {
          if (!isInitialized.value) return;
          isHovered.value = true;
          videoController.value?.setLooping(true);
          try {
            await videoController.value?.play();
            print('비디오 재생 시작');
          } catch (e) {
            print('비디오 재생 실패: $e');
          }
        },
        onExit: (_) async {
          if (!isInitialized.value) return;
          isHovered.value = false;
          videoController.value?.setLooping(false);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 100.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 32,
                height: 32,
                child: isInitialized.value
                    ? VideoPlayer(videoController.value!)
                    : Image.asset(
                        'assets/images/logo.webp',
                        width: 32,
                        height: 32,
                      ),
              ),
              AppGaps.h4,
              Transform.scale(
                scaleY: 0.80,
                child: Text(
                  'CONSOLE',
                  style: AppTextStyles.titleLarge.copyWith(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.exo2().fontFamily,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
