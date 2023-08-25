import 'package:specialico/index.dart';
import 'locations.dart';

class ScaffoldWithBottomNavBar extends ConsumerStatefulWidget {
  const ScaffoldWithBottomNavBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState
    extends ConsumerState<ScaffoldWithBottomNavBar> {
  late int _currentIndex;

  // Bottom Navigation Barの要素数と対応
  final _routerDelegate = [
    BeamerDelegate(
      initialPath: '/home',
      locationBuilder: (routerInformation, _) {
        if (routerInformation.location!.contains('/home')) {
          return HomeLocation(routerInformation);
        }
        return NotFound(path: routerInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/map',
      locationBuilder: (routerInformation, _) {
        if (routerInformation.location!.contains('/map')) {
          return MapLocation(routerInformation);
        }
        return NotFound(path: routerInformation.location!);
      },
    ),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uriString = Beamer.of(context).configuration.location!;
    _currentIndex = uriString.contains('/home') ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HeroControllerScope(
            controller: MaterialApp.createMaterialHeroController(),
            child: Beamer(routerDelegate: _routerDelegate[0]),
          ),
          HeroControllerScope(
            controller: MaterialApp.createMaterialHeroController(),
            child: Beamer(routerDelegate: _routerDelegate[1]),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'ホーム',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'マップ',
            icon: Icon(Icons.travel_explore),
          ),
        ],
        onTap: (index) {
          // 選択されていないタブが選択されたら、タブを変更する
          if (index != _currentIndex) {
            if (index == 1) {
              ref.read(mapScreenControllerProvider.notifier).addActiveCount();
            }
            setState(() => _currentIndex = index);
            _routerDelegate[_currentIndex].update(rebuild: false);
          }
          // ホームタブが押されたときに、遷移先のページにいたら、最初のページに戻ってくる
          else if (index == 0 && Beamer.of(context).canBeamBack) {
            bool canBeamBack = Beamer.of(context).canBeamBack;
            while (canBeamBack) {
              Beamer.of(context).beamBack();
              canBeamBack = Beamer.of(context).canBeamBack;
            }
          }
          // ホームタブが押されたときに、ホームタブの最初のページにいたら、スクロール位置をリセットする
          else if (_currentIndex == 0) {
            HomeScreen.scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                );
          } else if (index == 1 &&
              Navigator.of(shopDetailSheetKey.currentContext ?? context)
                  .canPop()) {
            Navigator.of(shopDetailSheetKey.currentContext!).pop();
          }
        },
      ),
    );
  }
}
