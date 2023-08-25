import 'package:flutter/scheduler.dart';
import 'package:specialico/index.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  void initState() {
    AnalyticsClient().logEvent(LogEvent.tutorialBegin, {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        totalPage: 3,
        headerBackgroundColor: Theme.of(context).colorScheme.background,
        indicatorAbove: true,
        controllerColor: Theme.of(context).colorScheme.primary,
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        finishButtonTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.background,
        ),
        finishButtonText: 'はじめる',
        hasSkip: true,
        skipIcon: Icon(
          Icons.arrow_forward,
          color: Theme.of(context).colorScheme.background,
        ),
        onFinish: () {
          AnalyticsClient().logEvent(LogEvent.tutorialComplete, {});
          App.restart(context);
        },
        background: [
          _buildImage(
            context,
            SchedulerBinding.instance.platformDispatcher.platformBrightness ==
                    Brightness.light
                ? 'assets/images/onboarding1_light.png'
                : 'assets/images/onboarding1_dark.png',
          ),
          _buildImage(context, 'assets/images/onboarding2.png'),
          _buildImage(context, 'assets/images/onboarding3.png'),
        ],
        speed: 1.8,
        pageBodies: [
          _buildBody(
            context,
            'Dear coffee lovers...',
            'Specialico（スペシャリコ）は、スペシャルティコーヒー特化のカフェ探しアプリです',
          ),
          _buildBody(
            context,
            '位置情報から探せます',
            '「いま、おいしいコーヒーが飲みたい」をどこにいても叶えます（そのために、カフェの情報を集めています！）',
          ),
          _buildBody(
            context,
            'オアシスはすぐそこです',
            'Specialico（スペシャリコ）で、すてきなコーヒーショップを見つけましょう！',
          ),
        ],
      ),
    );
  }

  _buildImage(BuildContext context, String path) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).colorScheme.background,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                path,
                width: MediaQuery.of(context).size.width - 16,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildBody(BuildContext context, String headline, String text) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.55,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    headline,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
