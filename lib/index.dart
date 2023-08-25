//dart
export 'dart:convert' show json;
//packages
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: invalid_export_of_internal_element
export 'package:riverpod_annotation/riverpod_annotation.dart';
export 'package:freezed_annotation/freezed_annotation.dart';
export 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:cached_network_image/cached_network_image.dart' hide ErrorListener;
export 'package:metadata_fetch/metadata_fetch.dart';
export 'package:flutter_sticky_header/flutter_sticky_header.dart';
export 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
export 'package:dismissible_page/dismissible_page.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:expandable_page_view/expandable_page_view.dart' hide WidgetBuilder;
export 'package:dots_indicator/dots_indicator.dart';
export 'package:preload_page_view/preload_page_view.dart' hide PageMetrics, PageScrollPhysics;
export 'package:url_launcher/url_launcher.dart';
export 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';
export 'package:skeleton_loader/skeleton_loader.dart';
export 'package:geolocator/geolocator.dart';
export 'package:animated_flip_counter/animated_flip_counter.dart';
export 'package:beamer/beamer.dart';
export 'package:rxdart/rxdart.dart' hide Notification;
export 'package:firebase_core/firebase_core.dart';
export 'package:google_maps_flutter/google_maps_flutter.dart';
export 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
export 'package:flutter_native_splash/flutter_native_splash.dart';
export 'package:google_sign_in/google_sign_in.dart';
export 'package:sign_in_with_apple/sign_in_with_apple.dart';
export 'package:font_awesome_flutter/font_awesome_flutter.dart';
export 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
export 'package:email_validator/email_validator.dart';
export 'package:charset_converter/charset_converter.dart';
export 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
export 'package:image_picker/image_picker.dart';
export 'package:flutter_image_compress/flutter_image_compress.dart';
export 'package:firebase_storage/firebase_storage.dart';
export 'package:flutter_cache_manager/flutter_cache_manager.dart';
export 'package:google_mobile_ads/google_mobile_ads.dart';
export 'package:flutter_dotenv/flutter_dotenv.dart';
export 'package:direct_select_flutter/direct_select_container.dart';
export 'package:direct_select_flutter/direct_select_item.dart';
export 'package:direct_select_flutter/direct_select_list.dart';
export 'package:firebase_crashlytics/firebase_crashlytics.dart';
export 'package:firebase_analytics/firebase_analytics.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:app_tracking_transparency/app_tracking_transparency.dart';

export 'package:specialico/main.dart';

//src
export 'package:specialico/src/app.dart';

//src/common_widgets
export 'package:specialico/src/common_widgets/dismiss_page_button.dart';
export 'package:specialico/src/common_widgets/description_skelton.dart';
export 'package:specialico/src/common_widgets/shop_staggered_grid_skelton.dart';

//src/features
//src/features/auth
//src/features/auth/application
export 'package:specialico/src/features/auth/application/auth_service.dart';
//src/features/auth/data
export 'package:specialico/src/features/auth/data/like_dao.dart';
export 'package:specialico/src/features/auth/data/user_dao.dart';
//src/features/auth/data/clients
export 'package:specialico/src/features/auth/data/clients/apple_auth_client.dart';
export 'package:specialico/src/features/auth/data/clients/email_auth_client.dart';
export 'package:specialico/src/features/auth/data/clients/google_auth_client.dart';
//src/features/auth/data/liked_shop_ids_repository
export 'package:specialico/src/features/auth/data/liked_shop_ids_repository/liked_shop_ids_repository.dart';
//src/features/auth/data/user_repository
export 'package:specialico/src/features/auth/data/user_repository/user_repository.dart';
//src/features/auth/domain/user
export 'package:specialico/src/features/auth/domain/user/user.dart';
//src/features/auth/presentation/account_detail_screen
export 'package:specialico/src/features/auth/presentation/account_detail_screen/account_detail_screen.dart';
//src/features/auth/presentation/auth_screen
export 'package:specialico/src/features/auth/presentation/auth_screen/auth_screen_controller.dart';
export 'package:specialico/src/features/auth/presentation/auth_screen/auth_screen.dart';
//src/features/auth/presentation/credit_screen
export 'package:specialico/src/features/auth/presentation/credit_screen/credit_screen.dart';
//src/features/auth/presentation/email_auth_screen
export 'package:specialico/src/features/auth/presentation/email_auth_screen/email_auth_screen_controller.dart';
export 'package:specialico/src/features/auth/presentation/email_auth_screen/email_auth_screen.dart';
//src/features/auth/presentation/onboarding_screen
export 'package:specialico/src/features/auth/presentation/onboarding_screen/onboarding_screen.dart';
//src/features/auth/presentation/option_screen
export 'package:specialico/src/features/auth/presentation/option_screen/option_screen_controller.dart';
export 'package:specialico/src/features/auth/presentation/option_screen/option_screen.dart';
//src/features/auth/presentation/profile_edit_screen
export 'package:specialico/src/features/auth/presentation/profile_edit_screen/profile_edit_screen_controller.dart';
export 'package:specialico/src/features/auth/presentation/profile_edit_screen/profile_edit_screen.dart';
//src/features/map
//src/features/map/application
export 'package:specialico/src/features/map/application/map_service.dart';
//src/features/map/data
export 'package:specialico/src/features/map/data/map_dao.dart';
//src/features/map/data/current_position_repository
export 'package:specialico/src/features/map/data/current_position_repository/current_position_repository.dart';
//src/features/map/data/places_repository
export 'package:specialico/src/features/map/data/places_repository/places_repository.dart';
//src/features/map/domain
export 'package:specialico/src/features/map/domain/place.dart';
//src/features/map/presentation
//src/features/map/presentation/components/map_banner_ad
export 'package:specialico/src/features/map/presentation/components/map_banner_ad/map_banner_ad_controller.dart';
export 'package:specialico/src/features/map/presentation/components/map_banner_ad/map_banner_ad.dart';
//src/features/map/presentation/components/snippet_page_item
export 'package:specialico/src/features/map/presentation/components/snippet_page_item/snippet_page_item_controller.dart';
export 'package:specialico/src/features/map/presentation/components/snippet_page_item/snippet_page_item.dart';
//src/features/map/presentation/map_screen
export 'package:specialico/src/features/map/presentation/map_screen/map_screen_controller.dart';
export 'package:specialico/src/features/map/presentation/map_screen/map_screen.dart';
//src/features/map/presentation/shop_detail_sheet
export 'package:specialico/src/features/map/presentation/shop_detail_sheet/shop_detail_sheet.dart';

//src/features/request/application
export 'package:specialico/src/features/request/application/request_service.dart';
//src/features/request/data
export 'package:specialico/src/features/request/data/request_dao.dart';
export 'package:specialico/src/features/request/data/slack_api_client.dart';
//src/features/request/presentation/components
export 'package:specialico/src/features/request/presentation/components/suggest_new_shop_button.dart';
//src/features/request/presentation/shop_report_sheet
export 'package:specialico/src/features/request/presentation/shop_report_sheet/shop_report_sheet_controller.dart';
export 'package:specialico/src/features/request/presentation/shop_report_sheet/shop_report_sheet.dart';
//src/features/request/presentation/suggest_screen
export 'package:specialico/src/features/request/presentation/suggest_screen/suggest_screen_controller.dart';
export 'package:specialico/src/features/request/presentation/suggest_screen/suggest_screen.dart';
//src/features/shops
//src/features/shops/application
export 'package:specialico/src/features/shops/application/shop_service.dart';
//src/features/shops/data
export 'package:specialico/src/features/shops/data/shop_dao.dart';
//src/features/shops/data/http_metadata_repository
export 'package:specialico/src/features/shops/data/http_metadata_repository/http_metadata_repository.dart';
//src/features/shops/data/liked_shop_documents_repository
export 'package:specialico/src/features/shops/data/liked_shop_documents_repository/liked_shop_documents_repository.dart';
//src/features/shops/data/shop_count_repository
export 'package:specialico/src/features/shops/data/shop_count_repository/shop_count_repository.dart';
//src/features/shops/data/shop_ids_for_each_category_repository
export 'package:specialico/src/features/shops/data/shop_ids_for_each_category_repository/shop_ids_for_each_category_repository.dart';
//src/features/shops/data/shop_repository
export 'package:specialico/src/features/shops/data/shop_repository/shop_repository.dart';
//src/features/shops/data/shop_snippet_repository
export 'package:specialico/src/features/shops/data/shop_snippet_repository/shop_snippet_repository.dart';

//src/features/shops/domain
export 'package:specialico/src/features/shops/domain/liked_shop_document/liked_shop_document.dart';
export 'package:specialico/src/features/shops/domain/shop_snippet/shop_snippet.dart';
export 'package:specialico/src/features/shops/domain/shop/shop.dart';
//src/features/shops/presentation
//src/features/shops/presentation/area_choice_screen
export 'package:specialico/src/features/shops/presentation/area_choice_screen/area_choice_screen_controller.dart';
export 'package:specialico/src/features/shops/presentation/area_choice_screen/area_choice_screen.dart';
//src/features/shops/presentation/components/edit_weekday_texts_sheet
export 'package:specialico/src/features/shops/presentation/components/edit_weekday_texts_sheet/edit_weekday_texts_sheet_controller.dart';
export 'package:specialico/src/features/shops/presentation/components/edit_weekday_texts_sheet/edit_weekday_texts_sheet.dart';
//src/features/shops/presentation/components/shop_detail_page
export 'package:specialico/src/features/shops/presentation/components/shop_detail_page/shop_detail_page_controller.dart';
export 'package:specialico/src/features/shops/presentation/components/shop_detail_page/shop_detail_page.dart';
export 'package:specialico/src/features/shops/presentation/components/shop_detail_page/image_page_view_indicator.dart';
export 'package:specialico/src/features/shops/presentation/components/shop_detail_page/shop_info_column.dart';
export 'package:specialico/src/features/shops/presentation/components/shop_detail_page/square_image_page_view.dart';
//src/features/shops/presentation/components/native_ad_item
export 'package:specialico/src/features/shops/presentation/components/native_ad_item/native_ad_item_controller.dart';
export 'package:specialico/src/features/shops/presentation/components/native_ad_item/native_ad_item.dart';
//src/features/shops/presentation/components/shop_list_staggered_grid
export 'package:specialico/src/features/shops/presentation/components/shop_list_staggered_grid/shop_list_staggered_grid_item_controller.dart';
export 'package:specialico/src/features/shops/presentation/components/shop_list_staggered_grid/shop_list_staggered_grid_item.dart';
export 'package:specialico/src/features/shops/presentation/components/shop_list_staggered_grid/shop_list_staggered_grid.dart';
//src/features/shops/presentation/components
export 'package:specialico/src/features/shops/presentation/components/shop_list_categories_row.dart';
//src/features/shops/presentation/home_screen
export 'package:specialico/src/features/shops/presentation/home_screen/home_screen_controller.dart';
export 'package:specialico/src/features/shops/presentation/home_screen/home_screen.dart';
//src/features/shops/presentation/shop_detail_screen
export 'package:specialico/src/features/shops/presentation/shop_detail_screen/shop_detail_screen_controller.dart';
export 'package:specialico/src/features/shops/presentation/shop_detail_screen/shop_detail_screen.dart';
//src/features/shops/presentation/shop_list_screen
export 'package:specialico/src/features/shops/presentation/shop_list_screen/shop_list_screen_controller.dart';
export 'package:specialico/src/features/shops/presentation/shop_list_screen/shop_list_screen.dart';
//src/features/terms
export 'package:specialico/src/features/terms/presentation/privacy_policy_screen.dart';
export 'package:specialico/src/features/terms/presentation/terms_of_service_screen.dart';


//src/routing
export 'package:specialico/src/routing/scaffold_with_bottom_nav_bar.dart';

//src/theme
export 'package:specialico/src/theme/color_schemes.g.dart';
export 'package:specialico/src/theme/my_button_theme.dart';
export 'package:specialico/src/theme/my_text_theme.dart';
export 'package:specialico/src/theme/theme.dart';

//src/utils
export 'package:specialico/src/utils/admob_util.dart';
export 'package:specialico/src/utils/analytics_client.dart';
export 'package:specialico/src/utils/datetime_calculator.dart';
export 'package:specialico/src/utils/distance_calculator.dart';
export 'package:specialico/src/utils/geolocator_client.dart';
export 'package:specialico/src/utils/image_compressor.dart';
export 'package:specialico/src/utils/json_cache_manager.dart';
export 'package:specialico/src/utils/marker_bitmap_util.dart';
//src/utils/app_launchers
export 'package:specialico/src/utils/app_launchers/google_map_launcher.dart';
export 'package:specialico/src/utils/app_launchers/instagram_launcher.dart';
//src/utils/converters
export 'package:specialico/src/utils/converters/datetime_converter.dart';
export 'package:specialico/src/utils/converters/geo_fire_point_converter.dart';
export 'package:specialico/src/utils/converters/instagram_posts_converter.dart';
export 'package:specialico/src/utils/converters/shop_snippet_converter.dart';
//src/utils/enums
export 'package:specialico/src/utils/enums/auth_enums.dart';
export 'package:specialico/src/utils/enums/bean_type.dart';
export 'package:specialico/src/utils/enums/flavor.dart';
export 'package:specialico/src/utils/enums/flavor_wheel.dart';
export 'package:specialico/src/utils/enums/location_enums.dart';
export 'package:specialico/src/utils/enums/log_event.dart';
export 'package:specialico/src/utils/enums/shop_enums.dart';