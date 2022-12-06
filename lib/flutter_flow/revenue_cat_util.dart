import 'dart:io' show Platform;
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';

Offerings? _offerings;
PurchaserInfo? _purchaserInfo;
String? _loggedInUid;

Offerings? get offerings => _offerings;
PurchaserInfo? get purchaserInfo => _purchaserInfo;

set purchaserInfo(PurchaserInfo? purchaserInfo) =>
    _purchaserInfo = purchaserInfo;

Future initialize(
  String appStoreKey,
  String playStoreKey, {
  bool debugLogEnabled = false,
  bool loadDataAfterLaunch = false,
}) async {
  if (kIsWeb) {
    print('RevenueCat is not supported on web.');
    return;
  }
  try {
    if (Platform.isIOS) {
      await Purchases.setDebugLogsEnabled(debugLogEnabled);
      await Purchases.setup(appStoreKey);
    } else if (Platform.isAndroid) {
      await Purchases.setDebugLogsEnabled(debugLogEnabled);
      await Purchases.setup(playStoreKey);
    } else {
      print("RevenueCat is not supported on this platform.");
      return;
    }

    if (loadDataAfterLaunch) {
      loadPurchaserInfo();
      loadOfferings();
    } else {
      await loadPurchaserInfo();
      await loadOfferings();
    }
  } on Exception catch (e) {
    // This should happen only in the web run mode.
    print("RevenueCat initialization failed: $e");
  }
}

// Purchase a package.
Future<bool> purchasePackage(String package) async {
  try {
    final revenueCatPackage = offerings?.current?.getPackage(package);
    if (revenueCatPackage == null) {
      return false;
    }
    purchaserInfo = await Purchases.purchasePackage(revenueCatPackage);
    return true;
  } catch (_) {
    return false;
  }
}

List<String> get activeEntitlementIds => _purchaserInfo != null
    ? _purchaserInfo!.entitlements.active.values
        .map((e) => e.identifier)
        .toList()
    : [];

Future loadOfferings() async {
  try {
    _offerings = await Purchases.getOfferings();
  } on PlatformException catch (e) {
    print("Error loading offerings info: $e");
  }
}

Future loadPurchaserInfo() async {
  try {
    _purchaserInfo = await Purchases.getPurchaserInfo();
  } on PlatformException catch (e) {
    print("Error loading purchaser info: $e");
  }
}

// Return if the user has the entitlement.
// Return null on errors.
Future<bool?> isEntitled(String entitlementId) async {
  try {
    purchaserInfo = await Purchases.getPurchaserInfo();
    return purchaserInfo!.entitlements.all[entitlementId]?.isActive ?? false;
  } on Exception catch (e) {
    print("Unable to check RevenueCat entitlements: $e");
    return null;
  }
}

// https://docs.revenuecat.com/docs/user-ids
Future login(String? uid) async {
  if (uid == _loggedInUid) {
    return;
  }
  try {
    if (uid != null) {
      purchaserInfo = (await Purchases.logIn(uid)).purchaserInfo;
    } else {
      purchaserInfo = await Purchases.logOut();
    }
    _loggedInUid = uid;
  } on Exception catch (e) {
    print("Unable to logIn or logOut user in RevenueCat: $e");
  }
}

// https://docs.revenuecat.com/docs/restoring-purchases
Future restorePurchases() async {
  try {
    purchaserInfo = await Purchases.restoreTransactions();
  } on PlatformException catch (e) {
    print("Unable to restore purchases in RevenueCat: $e");
  }
}
