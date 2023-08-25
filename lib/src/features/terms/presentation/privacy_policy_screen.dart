import 'package:specialico/index.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('プライバシーポリシー')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBody('「Specialico（スペシャリコ）」は、個人開発により作成・運営されています。開発者を、以下「運営」といいます。運営は、本アプリ上で提供するサービス（以下、「本サービス」といいます。）における、ユーザーの個人情報の取扱いについて、以下のとおりプライバシーポリシー（以下、「本ポリシー」といいます。）を定めます。'),
              _buildHeadline('第1条（個人情報）', context),
              _buildBody('「個人情報」とは、個人情報保護法にいう「個人情報」を指すものとし、生存する個人に関する情報であって、当該情報に含まれる氏名、生年月日、住所、電話番号、連絡先その他の記述等により特定の個人を識別できる情報及び容貌、指紋、声紋にかかるデータ、及び健康保険証の保険者番号などの当該情報単体から特定の個人を識別できる情報（個人識別情報）を指します。'),
              _buildHeadline('第2条（個人情報の収集方法）', context),
              _buildBody('運営は、ユーザーが利用登録をする際に氏名、生年月日、住所、電話番号、メールアドレス、などの個人情報をお尋ねする場合があります。また、ユーザーと提携先などとの間でなされたユーザーの個人情報を含む取引記録や決済に関する情報を、運営の提携先（情報提供元、広告主、広告配信先などを含みます。以下、｢提携先｣といいます。）などから収集することがあります。'),
              _buildHeadline('第3条（個人情報を収集・利用する目的）', context),
              _buildBody('運営が個人情報を収集・利用する目的は、以下のとおりです。\n\n1. 運営サービスの提供・運営のためユーザーからのお問い合わせに回答するため（本人確認を行うことを含む）\n\n2. ユーザーが利用中のサービスの新機能、更新情報、キャンペーン等及び運営が提供する他のサービスの案内のメールを送付するため\n\n3. メンテナンス、重要なお知らせなど必要に応じたご連絡のため\n\n4. 利用規約に違反したユーザーや、不正・不当な目的でサービスを利用しようとするユーザーの特定をし、ご利用をお断りするため\n\n5. ユーザーにご自身の登録情報の閲覧や変更、削除、ご利用状況の閲覧を行っていただくため\n\n6. 有料サービスにおいて、ユーザーに利用料金を請求するため\n\n7. 上記の利用目的に付随する目的'),
              _buildHeadline('第4条（利用目的の変更）', context),
              _buildBody('1. 運営は、利用目的が変更前と関連性を有すると合理的に認められる場合に限り、個人情報の利用目的を変更するものとします。\n\n2. 利用目的の変更を行った場合には、変更後の目的について、運営所定の方法により、ユーザーに通知し、公表するものとします。'),
              _buildHeadline('第5条（個人情報の第三者提供）', context),
              _buildBody('1. 運営は、次に掲げる場合を除いて、あらかじめユーザーの同意を得ることなく、第三者に個人情報を提供することはありません。ただし、個人情報保護法その他の法令で認められる場合を除きます。\n    1.1 人の生命、身体または財産の保護のために必要がある場合であって、本人の同意を得ることが困難であるとき\n    1.2 公衆衛生の向上または児童の健全な育成の推進のために特に必要がある場合であって、本人の同意を得ることが困難であるとき\n    1.3 国の機関もしくは地方公共団体またはその委託を受けた者が法令の定める事務を遂行することに対して協力する必要がある場合であって、本人の同意を得ることにより当該事務の遂行に支障を及ぼすおそれがあるとき\n    1.4 予め次の事項を告知あるいは公表し、かつ運営が個人情報保護委員会に届出をしたとき\n        1.4.a 利用目的に第三者への提供を含むこと\n        1.4.b 第三者に提供されるデータの項目\n        1.4.c 第三者への提供の手段または方法\n        1.4.d 本人の求めに応じて個人情報の第三者への提供を停止すること\n        1.4.e 本人の求めを受け付ける方法\n\n2. 前項の定めにかかわらず、次に掲げる場合には、当該情報の提供先は第三者に該当しないものとします。\n    2.1 運営が利用目的の達成に必要な範囲内において個人情報の取扱いの全部または一部を委託する場合\n    2.2 合併その他の事由による事業の承継に伴って個人情報が提供される場合\n    2.3 個人情報を特定の者との間で共同して利用する場合であって、その旨並びに共同して利用される個人情報の項目、共同して利用する者の範囲、利用する者の利用目的および当該個人情報の管理について責任を有する者の氏名または名称について、あらかじめ本人に通知し、または本人が容易に知り得る状態に置いた場合'),
              _buildHeadline('第6条（個人情報の開示）', context),
              _buildBody('1. 運営は、本人から個人情報の開示を求められたときは、本人に対し、遅滞なくこれを開示します。ただし、開示することにより次のいずれかに該当する場合は、その全部または一部を開示しないこともあり、開示しない決定をした場合には、その旨を遅滞なく通知します。なお、個人情報の開示に際しては、1件あたり1,000円の手数料を申し受けます。\n    1.1 本人または第三者の生命、身体、財産その他の権利利益を害するおそれがある場合\n    1.2 運営の業務の適正な実施に著しい支障を及ぼすおそれがある場合\n    1.3 その他法令に違反することとなる場合\n\n2. 前項の定めにかかわらず、履歴情報および特性情報などの個人情報以外の情報については、原則として開示いたしません。'),
              _buildHeadline('第7条（個人情報の訂正および削除）', context),
              _buildBody('1. ユーザーは、運営の保有する自己の個人情報が誤った情報である場合には、運営が定める手続きにより、運営に対して個人情報の訂正、追加または削除（以下、「訂正等」といいます。）を請求することができます。\n\n2. 運営は、ユーザーから前項の請求を受けてその請求に応じる必要があると判断した場合には、遅滞なく、当該個人情報の訂正等を行うものとします。\n\n3. 運営は、前項の規定に基づき訂正等を行った場合、または訂正等を行わない旨の決定をしたときは遅滞なく、これをユーザーに通知します。'),
              _buildHeadline('第8条（個人情報の利用停止等）', context),
              _buildBody('1. 運営は、本人から、個人情報が、利用目的の範囲を超えて取り扱われているという理由、または不正の手段により取得されたものであるという理由により、その利用の停止または消去（以下、「利用停止等」といいます。）を求められた場合には、遅滞なく必要な調査を行います。\n\n 2. 前項の調査結果に基づき、その請求に応じる必要があると判断した場合には、遅滞なく、当該個人情報の利用停止等を行います。\n\n3. 運営は、前項の規定に基づき利用停止等を行った場合、または利用停止等を行わない旨の決定をしたときは、遅滞なく、これをユーザーに通知します。\n4. 前2項にかかわらず、利用停止等に多額の費用を有する場合その他利用停止等を行うことが困難な場合であって、ユーザーの権利利益を保護するために必要なこれに代わるべき措置をとれる場合は、この代替策を講じるものとします。'),
              _buildHeadline('第9条（プライバシーポリシーの変更）', context),
              _buildBody('1. 本ポリシーの内容は、法令その他本ポリシーに別段の定めのある事項を除いて、ユーザーに通知することなく、変更することができるものとします。\n\n2. 運営が別途定める場合を除いて、変更後のプライバシーポリシーは、本アプリに掲載したときから効力を生じるものとします。'),
              _buildHeadline('第10条（お問い合わせ窓口）', context),
              _buildBody('本ポリシーに関するお問い合わせは、下記の窓口までお願いいたします。\n\nEメールアドレス: specialico.coffee@gmail.com'),
              const SizedBox(height: 32),
              _buildBody('2023年8月10日施行'),
            ],
          ),
        ),
      ),
    );
  }

  _buildBody(String text) {
    return Text(
      text,
      style: const TextStyle(height: 1.4, fontWeight: FontWeight.normal),
    );
  }

  _buildHeadline(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 16),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
