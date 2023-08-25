# Specialico

スペシャルティコーヒーが飲めるカフェを探せるアプリ
iOS版は[こちら](https://apps.apple.com/jp/app/specialico/id6462790050)、Android版は[こちら](https://play.google.com/store/apps/details?id=com.specialico)から。

## State管理
Riverpod 2.0を使用して、ドキュメンテーションで推奨されているNotifierProviderで状態管理をしています。

Riverpod + NotifierProvider + Freezed

## 利用サービス
- Firebase
    - Auth
    - Firestore (設計の詳細は、[こちら](https://github.com/KosukeOnishi/specialico/blob/master/docs/database.md))
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
