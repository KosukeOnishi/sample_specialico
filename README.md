# Specialico

スペシャルティコーヒーが飲めるカフェを探せるアプリ-"Specialico"のサンプルコードをこちらのレポジトリに掲載しています。

iOS版は[こちら](https://apps.apple.com/jp/app/specialico/id6462790050)、Android版は[こちら](https://play.google.com/store/apps/details?id=com.specialico)から。

<p>
    <img src="https://github.com/KosukeOnishi/sample_specialico/blob/main/docs/images/6.5_1.png" width=20%>
    <img src="https://github.com/KosukeOnishi/sample_specialico/blob/main/docs/images/6.5_2.png" width=20%>
    <img src="https://github.com/KosukeOnishi/sample_specialico/blob/main/docs/images/6.5_3.png" width=20%>
    <img src="https://github.com/KosukeOnishi/sample_specialico/blob/main/docs/images/6.5_4.png" width=20%>
</p>

## State管理
Riverpod + NotifierProvider + Freezed

Riverpod 2.0を使用。[公式ドキュメンテーション](https://docs-v2.riverpod.dev)で推奨されているNotifierProviderで状態管理をしています。
（とはいえ、最近は@riverpodアノテーションでproviderを生成しているので、providerの種類はほとんど意識することなく、最適なものを使えるようになりました。）


## 利用サービス
- Firebase
    - Auth
    - Firestore (設計の詳細は[こちら](https://github.com/KosukeOnishi/specialico/blob/master/docs/database.md))
    - Storage
    - Functions
    - Analytics
    - Crashlytics
    - Hosting
- Google Maps Platform
    - Maps SDK for Android
    - Maps SDK for iOS
- Slack API

## アーキテクチャ
DDDベースの考え方で([参考](https://codewithandrea.com/articles/flutter-project-structure/))、4つのレイヤーに分けています。
- Presentation Layer
    - Widgets
    - Controllers
- Application Layer
    - Services
- Domain Layer
    - Models
- Data Layer
    - Repositories
    - DAOs
    - Data Sources

ユーザーが取る行動を一つのfeatureと捉え、feature単位でディレクトリを分けて4つのレイヤーに沿って開発しています。
