import 'dart:io';

import 'package:specialico/index.dart';

class AuthLocation extends BeamLocation<BeamState> {
  AuthLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('auth'),
          title: 'auth',
          type: BeamPageType.noTransition,
          child: AuthScreen(),
        ),
        if (state.uri.path.contains('email'))
          BeamPage(
            key: const ValueKey('/auth/email'),
            title: 'Email',
            // type: BeamPageType.material,
            child: EmailAuthScreen(
              authType: state.queryParameters['type'] == 'signIn'
                  ? EmailAuthType.signIn
                  : EmailAuthType.signUp,
            ),
          ),
        if (state.uri.path.contains('profile'))
          const BeamPage(
            key: ValueKey('/auth/profile'),
            title: 'Profile',
            child: ProfileEditScreen(),
          ),
        if (state.uri.path.contains('onboarding'))
          const BeamPage(
            key: ValueKey('/auth/onboarding'),
            title: 'Onboarding',
            type: BeamPageType.slideTransition,
            child: OnboardingScreen(),
          ),
      ];
}

class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(super.routeInformation);
  @override
  List<Pattern> get pathPatterns => ['/home/list/:category'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    debugPrint(state.uri.path);
    return [
      const BeamPage(
        key: ValueKey('home'),
        title: 'Tab Home',
        type: BeamPageType.noTransition,
        child: HomeScreen(),
      ),
      if (state.uri.path == '/home/detail')
        BeamPage(
          key: const ValueKey('home/detail'),
          title: 'Detail',
          type: BeamPageType.fadeTransition,
          child: ShopDetailScreen(
            category:
                ShopListCategory.fromText(state.queryParameters['category']!),
            shopId: state.queryParameters['shopId']!,
          ),
        ),
      if (state.uri.path.contains('home/suggest'))
        const BeamPage(
          key: ValueKey('/home/suggest'),
          title: 'Suggest',
          child: SuggestScreen(),
        ),
      if (state.uri.path.contains('area'))
        BeamPage(
          key: const ValueKey('home/area'),
          title: 'Area',
          type: Platform.isAndroid
              ? BeamPageType.material
              : BeamPageType.cupertino,
          popToNamed: '/home',
          child: const AreaChoiceScreen(),
        ),
      if (state.uri.path.contains('area') && state.uri.path.contains('list'))
        BeamPage(
          key: const ValueKey('home/area/list'),
          title: 'List',
          type: Platform.isAndroid
              ? BeamPageType.material
              : BeamPageType.cupertino,
          child: ShopListScreen(
            category: ShopListCategory.area,
            prefecture: state.queryParameters['location'] == null
                ? null
                : Prefecture.fromAlphabet(state.queryParameters['location']!),
          ),
        ),
      if (state.uri.path.contains('area') && state.uri.path.contains('detail'))
        BeamPage(
          key: const ValueKey('/home/area/list/detail'),
          title: 'Detail',
          type: BeamPageType.fadeTransition,
          child: ShopDetailScreen(
            category: ShopListCategory.fromText(state.queryParameters[
                'category']!), // categoryの呼び出しが必要なのはTapされたタイミングだけなので、readでOK
            shopId: state.queryParameters['shopId']!,
          ),
        ),
      if (state.uri.path.contains('list/') && !state.uri.path.contains('area'))
        BeamPage(
          key: const ValueKey('home/list'),
          title: 'List',
          type: Platform.isAndroid
              ? BeamPageType.material
              : BeamPageType.cupertino,
          popToNamed: '/home',
          child: ShopListScreen(
            category: (ShopListCategory.values.firstWhere(
              (e) => e.name == state.uri.path.split('/')[3],
            )),
          ),
        ),
      if (state.uri.path.contains('list') &&
          state.uri.path.contains('detail') &&
          !state.uri.path.contains('area'))
        BeamPage(
          key: const ValueKey('/home/list/detail'),
          title: 'Detail',
          type: BeamPageType.fadeTransition,
          child: ShopDetailScreen(
            category: ShopListCategory.fromText(state.queryParameters[
                'category']!), // categoryの呼び出しが必要なのはTapされたタイミングだけなので、readでOK
            shopId: state.queryParameters['shopId']!,
          ),
        ),
      if (state.uri.path.contains('option'))
        const BeamPage(
          key: ValueKey('/home/option'),
          title: 'Option',
          child: OptionScreen(),
        ),
      if (state.uri.path.contains('account'))
        const BeamPage(
          key: ValueKey('home/option/account'),
          title: 'Account',
          child: AccountDetailScreen(),
        ),
      if (state.uri.path.contains('option/suggest'))
        const BeamPage(
          key: ValueKey('home/option/suggest'),
          title: 'Suggest',
          child: SuggestScreen(),
        ),
      if (state.uri.path.contains('profile_edit'))
        const BeamPage(
          key: ValueKey('/home/option/profile_edit'),
          title: 'ProfileEdit',
          child: ProfileEditScreen(),
        ),
      if (state.uri.path.contains('terms_of_service'))
        const BeamPage(
          key: ValueKey('/home/option/terms_of_service'),
          title: 'TermsOfService',
          child: TermsOfServiceScreen(),
        ),
      if (state.uri.path.contains('privacy_policy'))
        const BeamPage(
          key: ValueKey('/home/option/privacy_policy'),
          title: 'PrivacyPolicy',
          child: PrivacyPolicyScreen(),
        ),
      if (state.uri.path.contains('credit'))
        const BeamPage(
          key: ValueKey('/home/option/credit'),
          title: 'Credit',
          child: CreditScreen(),
        ),
    ];
  }
}

class MapLocation extends BeamLocation<BeamState> {
  MapLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('map'),
          title: 'Tab Map',
          type: BeamPageType.noTransition,
          child: MapScreen(),
        ),
        if (state.uri.path.contains('detail'))
          BeamPage(
            key: const ValueKey('/map/detail'),
            title: 'Detail',
            type: BeamPageType.fadeTransition,
            opaque: false,
            child: ShopDetailScreen(
              category: ShopListCategory.map,
              shopId: state.queryParameters['shopId']!,
            ),
          ),
      ];
}
