import 'package:cursor_clone_coding/config/design_system/text_styles.dart';
import 'package:cursor_clone_coding/config/design_system/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/home/home_provider.dart';
import 'package:cursor_clone_coding/config/design_system/colors.dart';
import 'package:cursor_clone_coding/config/design_system/gaps.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 112),
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  children: [],
                ),
              ),
            ),
            _buildHeader(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLogoWithText(),
          Row(
            children: [
              Text(
                'PRICING',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.gray400,
                ),
              ),
              AppGaps.h12,
              Text(
                'FEATURES',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.gray400,
                ),
              ),
              AppGaps.h12,
              Text(
                'ENTERPRISE',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.gray400,
                ),
              ),
              AppGaps.h12,
              Text(
                'BLOG',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.gray400,
                ),
              ),
              AppGaps.h12,
              Text(
                'FORUM',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.gray400,
                ),
              ),
              AppGaps.h12,
              Text(
                'CAREERS',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.gray400,
                ),
              ),
            ],
          ),
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

  Widget _buildLogoWithText() {
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
        // try {
        //   //await videoController.value?.pause();
        //   print('비디오 정지');
        // } catch (e) {
        //   print('비디오 정지 실패: $e');
        // }
      },
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
    );
  }
}
