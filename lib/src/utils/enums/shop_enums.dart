enum ShopListCategory {
  recommend,
  area,
  latest,
  like,
  map;

  const ShopListCategory();

  factory ShopListCategory.fromText(String text) {
    final loweredText = text.toLowerCase();
    return ShopListCategory.values.firstWhere(
        (category) => category.toString().split('.').last == loweredText);
  }
}

enum TimeType {
  openHours,
  openMinutes,
  closeHours,
  closeMinutes,
}

enum ShopReportType {
  wrongShopName('店名が違う'),
  wrongAddress('住所が違う'),
  wrongPosition('マップの表示位置が違う'),
  invalidMapUrl('GoogleマップのURLが不適当'),
  invalidShopImages('お店の写真が読み込めていない'),
  invalidInstagramAccount('Instagramのアカウントが不適当'),
  invalidWebsiteUrl('ウェブサイトのURLが不適当'),
  notSpecialtyCoffee('スペシャルティコーヒーが提供されていない'),
  notCoffeeShop('コーヒーショップでない'),
  otherProblems('その他');

  const ShopReportType(this.text);

  final String text;
}