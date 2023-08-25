enum SignUpRequestType {
  like,
  suggest,
  report,
  editWeekdayText,
  userProfile,
}

enum EmailAuthError {
  weakPassword('パスワードは半角英数で6文字~20文字で作成してください。'),
  alreadyInUse('このEメールアドレスはすでに使用されています。'),
  notFound('メールアドレスが登録されていません。'),
  wrongPassword('パスワードが誤っています。'),
  unknown('サーバーエラーが発生しました。時間をおいて再度お試しください。');

  const EmailAuthError(this.displayText);

  final String displayText;
}

enum AuthSignInType {
  anonymous,
  email,
  google,
  apple,
}


enum EmailAuthType {
  signIn,
  signUp,
}
