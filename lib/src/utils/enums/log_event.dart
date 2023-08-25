enum LogEvent {
  // general // ✅
  adImpression, // ✅
  adPressed, // ✅
  // auth
  signUp, // ✅
  login, // ✅
  logout, // ✅
  signUpRequest, // ✅
  deleteAccount, // ✅
  authTermsOfService, // ✅
  authPrivacyPolicy, // ✅
  pressedProfileBean, // ✅
  pressedGenerateName, // ✅
  profileSet, // ✅
  profileEdit, // ✅
  tutorialBegin, // ✅
  tutorialComplete, // ✅
  // shops
  fetchedRecommendedShops, // ✅
  likeShop, // ✅
  unlikeShop, // ✅
  displayShopDetail, // ✅
  instagramPostPressed, // ✅
  instagramPostBack, // ✅
  instagramPostNext, // ✅
  mapLinkPressed, // ✅
  instagramAccountPressed, // ✅
  openEditOpeningHoursModal, // ✅
  updateOpeningHours, // ✅
  openReportShopModal, // ✅
  // requests
  suggestShop, // ✅
  reportShop, // ✅
  // map
  pressedFab, // ✅
  pressedMarker, // ✅
  pressedCluster; // ✅

  const LogEvent();

  String getEventName() {
    final exp = RegExp('(?<=[a-z])[A-Z]');
    return name.replaceAllMapped(exp, (m) => '_${m.group(0)}').toLowerCase();
  }
}
