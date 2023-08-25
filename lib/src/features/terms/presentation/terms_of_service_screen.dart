import 'package:specialico/index.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('利用規約')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBody(
                  'この利用規約（以下、「本規約」といいます。）は、このアプリ上で提供されるサービス（以下、「本サービス」といいます。）の利用条件を定めるものです。登録ユーザーの皆さま（以下、「ユーザー」といいます。）には、本規約に従って、本サービスをご利用いただきます。本アプリ「Specialico（スペシャリコ）」は、個人開発により作成・運営されています。開発者を、以下「運営」といいます。'),
              _buildHeadline('第1条（適用）', context),
              _buildBody(
                  '1. ユーザは、利用規約の定めに従って、本サービスを利用するものとします。\n\n2. 本サービスに関し、本規約のほか、ご利用にあたってのルール等、各種の定め（以下、「個別規定」といいます。）をすることがあります。これら個別規定はその名称のいかんに関わらず、本規約の一部を構成するものとします。\n\n3. 本規約の規定が前条の個別規定の規定と矛盾する場合には、個別規定において特段の定めなき限り、個別規定の規定が優先されるものとします。'),
              _buildHeadline('第2条（利用登録）', context),
              _buildBody(
                  '1. 本サービスにおいては、登録希望者が本規約に同意の上、利用登録を申請し、利用登録が完了するものとします。\n\n2. 運営は、利用登録の申請者に以下の事由があると判断した場合、利用登録の申請を承認しないことがあり、その理由については一切の開示義務を負わないものとします。\n    1. 利用登録の申請に際して虚偽の事項を届け出た場合\n    2. 本規約に違反したことがある者からの申請である場合\n    3. その他、運営が利用登録を相当でないと判断した場合'),
              _buildHeadline('第3条（ユーザーIDおよびパスワードの管理）', context),
              _buildBody(
                  '1. ユーザーは、自己の責任において、本サービスのユーザーIDおよびパスワードを適切に管理するものとします。 \n\n2. ユーザーは、いかなる場合にも、ユーザーIDおよびパスワードを第三者に譲渡または貸与し、もしくは第三者と共用することはできません。運営は、ユーザーIDとパスワードの組み合わせが登録情報と一致してログインされた場合には、そのユーザーIDを登録しているユーザー自身による利用とみなします。\n\n3. ユーザーID及びパスワードが第三者によって使用されたことによって生じた損害は、運営に故意又は重大な過失がある場合を除き、運営は一切の責任を負わないものとします。'),
              _buildHeadline('第4条（禁止事項）', context),
              _buildBody('ユーザーは、本サービスの利用にあたり、以下の行為をしてはなりません。\n\n1. 法令または公序良俗に違反する行為\n2. 犯罪行為に関連する行為本サービスの内容等\n3. 本サービスに含まれる著作権、商標権ほか知的財産権を侵害する行為\n4. 運営、ほかのユーザー、またはその他第三者のサーバーまたはネットワークの機能を破壊したり、妨害したりする行為\n5. 本サービスによって得られた情報を商業的に利用する行為\n6. 運営のサービス運営を妨害するおそれのある行為\n 7. 不正アクセスをし、またはこれを試みる行為\n8. 他のユーザーに関する個人情報等を収集または蓄積する行為\n9. 不正な目的を持って本サービスを利用する行為\n10. 本サービスの他のユーザーまたはその他の第三者に不利益、損害、不快感を与える行為\n11. 他のユーザーに成りすます行為\n12. 運営が許諾しない本サービス上での宣伝、広告、勧誘、または営業行為\n13. 面識のない相手との出会いを目的とした行為\n14. 運営のサービスに関連して、反社会的勢力に対して直接または間接に利益を供与する行為\n15. その他、運営が不適切と判断する行為'),
              _buildHeadline('第5条（本サービスの提供の停止等）', context),
              _buildBody('1. 運営は、以下のいずれかの事由があると判断した場合、ユーザーに事前に通知することなく本サービスの全部または一部の提供を停止または中断することができるものとします。\n    1. 本サービスにかかるコンピュータシステムの保守点検または更新を行う場合\n    2. 地震、落雷、火災、停電または天災などの不可抗力により、本サービスの提供が困難となった場合\n    3. コンピュータまたは通信回線等が事故により停止した場合\n    4. その他、運営が本サービスの提供が困難と判断した場合\n\n2. 運営は、本サービスの提供の停止または中断により、ユーザーまたは第三者が被ったいかなる不利益または損害についても、一切の責任を負わないものとします。'),
              _buildHeadline('第6条（利用制限および登録抹消）', context),
              _buildBody('1. 運営は、ユーザーが以下のいずれかに該当する場合には、事前の通知なく、ユーザーに対して、本サービスの全部もしくは一部の利用を制限し、またはユーザーとしての登録を抹消することができるものとします。\n    1. 本規約のいずれかの条項に違反した場合\n    2. 登録事項に虚偽の事実があることが判明した場合\n    3. 運営からの連絡に対し、一定期間返答がない場合\n    4. 本サービスについて、最終の利用から一定期間利用がない場合\n    5. その他、運営が本サービスの利用を適当でないと判断した場合\n\n2. 運営は、本条に基づき運営が行った行為によりユーザーに生じた損害について、一切の責任を負いません。'),
              _buildHeadline('第7条（退会）', context),
              _buildBody('ユーザーは、運営の定める退会手続により、本サービスから退会できるものとします。'),
              _buildHeadline('第8条（保証の否認および免責事項）', context),
              _buildBody('1. 運営は、本サービスに事実上または法律上の瑕疵（安全性、信頼性、正確性、完全性、有効性、特定の目的への適合性、セキュリティなどに関する欠陥、エラーやバグ、権利侵害などを含みます。）がないことを明示的にも黙示的にも保証しておりません。\n\n2. 運営は、本サービスに起因してユーザーに生じたあらゆる損害について、運営の故意又は重過失による場合を除き、一切の責任を負いません。ただし、本サービスに関する運営とユーザーとの間の契約（本規約を含みます。）が消費者契約法に定める消費者契約となる場合、この免責規定は適用されません。\n\n3. 前項ただし書に定める場合であっても、運営は、運営の過失（重過失を除きます。）による債務不履行または不法行為によりユーザーに生じた損害のうち特別な事情から生じた損害（運営またはユーザーが損害発生につき予見し、または予見し得た場合を含みます。）について一切の責任を負いません。また、運営の過失（重過失を除きます。）による債務不履行または不法行為によりユーザーに生じた損害の賠償は、ユーザーから当該損害が発生した月に受領した利用料の額を上限とします。\n\n4. 運営は、本サービスに関して、ユーザーと他のユーザーまたは第三者との間において生じた取引、連絡または紛争等について一切責任を負いません。'),
              _buildHeadline('第9条（サービス内容の変更等）', context),
              _buildBody('運営は、ユーザーへの事前の告知をもって、本サービスの内容を変更、追加または廃止することがあり、ユーザーはこれを承諾するものとします。'),
              _buildHeadline('第10条（利用規約の変更）', context),
              _buildBody('1. 運営は以下の場合には、ユーザーの個別の同意を要せず、本規約を変更することができるものとします。\n    1. 本規約の変更がユーザーの一般の利益に適合するとき。\n    2. 本規約の変更が本サービス利用契約の目的に反せず、かつ、変更の必要性、変更後の内容の相当性その他の変更に係る事情に照らして合理的なものであるとき。\n\n2. 運営はユーザーに対し、前項による本規約の変更にあたり、事前に、本規約を変更する旨及び変更後の本規約の内容並びにその効力発生時期を通知します。'),
              _buildHeadline('第11条（個人情報の取扱い）', context),
              _buildBody('運営は、本サービスの利用によって取得する個人情報については、運営の「プライバシーポリシー」に従い適切に取り扱うものとします。'),
              _buildHeadline('第12条（通知または連絡）', context),
              _buildBody('ユーザーと運営との間の通知または連絡は、運営の定める方法によって行うものとします。運営は、ユーザーから、運営が別途定める方式に従った変更届け出がない限り、現在登録されている連絡先が有効なものとみなして当該連絡先へ通知または連絡を行い、これらは、発信時にユーザーへ到達したものとみなします。'),
              _buildHeadline('第13条（権利義務の譲渡の禁止）', context),
              _buildBody('ユーザーは、運営の書面による事前の承諾なく、利用契約上の地位または本規約に基づく権利もしくは義務を第三者に譲渡し、または担保に供することはできません。'),
              _buildHeadline('第14条（準拠法・裁判管轄）', context),
              _buildBody('1. 本規約の解釈にあたっては、日本法を準拠法とします。\n\n2. 本サービスに関して紛争が生じた場合には、運営の本店所在地を管轄する裁判所を専属的合意管轄とします。'),
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
