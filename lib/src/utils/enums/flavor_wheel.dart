import 'package:specialico/index.dart';

enum FlavorWheel {
  berry(
    Color(0xffDD4C51),
    'ベリー',
    ['ブラックベリー', 'ラズベリー', 'ブルーベリー', 'いちご'],
  ),
  driedFruit(
    Color(0xffC94A44),
    'ドライフルーツ',
    ['レーズン', 'プルーン'],
  ),
  otherFruit(
    Color(0xffF2684C),
    'その他の果実',
    ['ココナッツ', 'さくらんぼ', 'ザクロ', 'パイナップル', 'ぶどう', 'りんご', '桃', '梨'],
  ),
  citrusFruit(
    Color(0xffF7A129),
    '柑橘系',
    ['グレープフルーツ', 'オレンジ', 'レモン', 'ライム'],
  ),
  sour(
    Color(0xffE1C315),
    '酸味',
    ['酸っぱいアロマ', '酢', '酪酸', '吉草酸', 'クエン酸', 'リンゴ酸'],
  ),
  alcoholFermented(
    Color(0xffB09733),
    '酒/発酵',
    ['ワイン', 'ウィスキー', '発酵', '過発酵'],
  ),
  oliveOil(
    Color(0xffA2B028),
    'オリーブオイル',
    [],
  ),
  raw(
    Color(0xff708933),
    '生野菜',
    [],
  ),
  greenVegetative(
    Color(0xff3AA255),
    '植物/野菜',
    ['未成熟', 'さやえんどう', '生鮮野菜', '緑色野菜', '植物', '干し草', 'ハーブ'],
  ),
  beany(
    Color(0xff5E9A80),
    '豆',
    [],
  ),
  paperyMusty(
    Color(0xff9DB2B7),
    '紙/カビ',
    ['新鮮でない', 'ダンボール', '紙', '木', '湿った', 'ほこり', '土', '獣', '肉', 'フェノール'],
  ),
  chemical(
    Color(0xff76C0CB),
    '化学薬品',
    ['苦味', '塩味', '薬', '石油', 'スカンク', 'ゴム'],
  ),
  pipeTobacco(
    Color(0xffCAA465),
    'パイプタバコ',
    [],
  ),
  tobacco(
    Color(0xffDFBD7E),
    'タバコ',
    [],
  ),
  burnt(
    Color(0xffBE8663),
    '焦げ',
    ['刺激臭', '灰', '煙', '香ばしい'],
  ),
  cereal(
    Color(0xffDDAF61),
    '穀物',
    ['穀類', '麦芽'],
  ),
  pungent(
    Color(0xff794652),
    '唐辛子',
    [],
  ),
  pepper(
    Color(0xffCC3C42),
    'コショウ',
    [],
  ),
  brownSpice(
    Color(0xffB14D57),
    'ブラウンスパイス',
    ['アニス', 'ナツメグ', 'シナモン', 'クローブ'],
  ),
  nutty(
    Color(0xffC78869),
    'ナッツ',
    ['ピーナッツ', 'ヘーゼルナッツ', 'アーモンド'],
  ),
  cocoa(
    Color(0xffBB764C),
    'ココア',
    ['チョコレート', 'ダークチョコレート'],
  ),
  brownSugar(
    Color(0xffD45A59),
    '黒砂糖',
    ['糖蜜', 'メープルシロップ', 'キャラメル', 'はちみつ'],
  ),
  vanilla(
    Color(0xffF89A80),
    'バニラ',
    [],
  ),
  vanillin(
    Color(0xffF37674),
    'バニリン',
    [],
  ),
  overallSweet(
    Color(0xffE75B68),
    '総合的な甘み',
    [],
  ),
  sweetAromatics(
    Color(0xffD0545F),
    '甘いアロマ',
    [],
  ),
  blackTea(
    Color(0xff975E6D),
    '紅茶',
    [],
  ),
  floral(
    Color(0xffE0719C),
    '花',
    ['カモミール', '薔薇', 'ジャスミン'],
  );

  const FlavorWheel(this.color, this.japaneseText, this.detailCategories);

  final Color color;
  final String japaneseText;
  final List<String> detailCategories;
}
