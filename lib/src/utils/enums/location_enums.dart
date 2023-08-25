// 初期は日本のみOK
enum Region {
  hokkaido('北海道'),
  tohoku('東北'),
  kanto('関東'),
  chubu('中部'),
  kansai('関西'),
  chugoku('中国'),
  shikoku('四国'),
  kyushu('九州');

  const Region(this.name);

  final String name;
}

enum Prefecture {
  hokkaido('北海道', Region.hokkaido),
  miyagi('宮城県', Region.tohoku),
  aomori('青森県', Region.tohoku),
  iwate('岩手県', Region.tohoku),
  akita('秋田県', Region.tohoku),
  yamagata('山形県', Region.tohoku),
  fukushima('福島県', Region.tohoku),
  tokyo('東京都', Region.kanto),
  kanagawa('神奈川県', Region.kanto),
  saitama('埼玉県', Region.kanto),
  chiba('千葉県', Region.kanto),
  ibaraki('茨城県', Region.kanto),
  tochigi('栃木県', Region.kanto),
  gunma('群馬県', Region.kanto),
  niigata('新潟県', Region.chubu),
  toyama('富山県', Region.chubu),
  ishikawa('石川県', Region.chubu),
  fukui('福井県', Region.chubu),
  yamanashi('山梨県', Region.chubu),
  nagano('長野県', Region.chubu),
  aichi('愛知県', Region.chubu),
  gifu('岐阜県', Region.chubu),
  shizuoka('静岡県', Region.chubu),
  mie('三重県', Region.kansai),
  osaka('大阪府', Region.kansai),
  hyogo('兵庫県', Region.kansai),
  kyoto('京都府', Region.kansai),
  shiga('滋賀県', Region.kansai),
  nara('奈良県', Region.kansai),
  wakayama('和歌山県', Region.kansai),
  hiroshima('広島県', Region.chugoku),
  okayama('岡山県', Region.chugoku),
  tottori('鳥取県', Region.chugoku),
  shimane('島根県', Region.chugoku),
  yamaguchi('山口県', Region.chugoku),
  kagawa('香川県', Region.shikoku),
  tokushima('徳島県', Region.shikoku),
  ehime('愛媛県', Region.shikoku),
  kochi('高知県', Region.shikoku),
  fukuoka('福岡県', Region.kyushu),
  saga('佐賀県', Region.kyushu),
  nagasaki('長崎県', Region.kyushu),
  kumamoto('熊本県', Region.kyushu),
  oita('大分県', Region.kyushu),
  miyazaki('宮崎県', Region.kyushu),
  kagoshima('鹿児島県', Region.kyushu),
  okinawa('沖縄県', Region.kyushu);

  const Prefecture(this.name, this.region);

  final String name;
  final Region region;

  factory Prefecture.fromAlphabet(String text) {
    final loweredText = text.toLowerCase();
    return Prefecture.values.firstWhere(
        (prefecture) => prefecture.toString().split('.').last == loweredText);
  }
}