import 'package:specialico/index.dart';

part 'shop_count_repository.freezed.dart';
part 'shop_count_repository.g.dart';

@freezed
class ShopCountData with _$ShopCountData {
  const factory ShopCountData({
    required int nationWide,
    required Map<Prefecture, int> countsOfEachPrefecture,
  }) = _ShopCountData;
}

@Riverpod(keepAlive: true)
class ShopCountRepository extends _$ShopCountRepository {
  @override
  ShopCountData build() {
    return ShopCountData(
      nationWide: 0,
      countsOfEachPrefecture: Map.from({}),
    );
  }

  void setData(Map<String, dynamic> data) {
    final int nationWide = data['count'];
    final Map<String, dynamic> countsOfEachPrefectureMap =
        data['countsOfEachPrefecture'];
    Map<Prefecture, int> countsOfEachPrefecture = {};
    countsOfEachPrefectureMap.forEach((key, value) =>
        countsOfEachPrefecture[Prefecture.fromAlphabet(key)] = value);
    state = state.copyWith(
      nationWide: nationWide,
      countsOfEachPrefecture: countsOfEachPrefecture,
    );
  }

  Future<void> getShopCount() async {
    final Map<String, dynamic> data = await ShopDao.getShopCount();
    setData(data);
  }
}
