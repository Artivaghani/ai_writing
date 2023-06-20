import 'dart:async';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

const productIds = {'essential_50', 'plus_100', 'elite_200'};

class SubScriptionHandler {
  static InAppPurchase connection = InAppPurchase.instance;
  static StreamSubscription? subscription;
  static List<ProductDetails> products = [];
  static bool isRecall = false;

  static init() async {
    Stream purchaseUpdated = InAppPurchase.instance.purchaseStream;
    subscription = purchaseUpdated.listen((purchaseDetailsList) {
      AppDialog.showProcess();
      listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      Get.back();
      subscription!.cancel();
    }, onError: (error) {
      Get.back();
      AppDialog.errorSnackBar(AppString.errorMsg.tr);
    });
  }

  static initStoreInfo({required Function callBack}) async {
    connection.queryProductDetails(AppConst.productPlan).then((value) {
      if (value.error == null) {
        value.productDetails.sort((a, b) => a.rawPrice.compareTo(b.rawPrice));
        products = value.productDetails;
        if (products.isEmpty && !isRecall) {
          Future.delayed(
            const Duration(seconds: 3),
            () {
              initStoreInfo(callBack: callBack);
              isRecall = true;
            },
          );
        } else {
          callBack.call();
        }
      }
    }).onError((error, stackTrace) {
      callBack.call();
    });
  }

  static Future<void> listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        // Get.back();
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          Get.back();
          AppDialog.errorSnackBar(AppString.errorMsg.tr);
        } else if (purchaseDetails.status == PurchaseStatus.purchased) {
         
          buyCredit(prodetail: purchaseDetails);
        } else {
          Get.back();
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await connection.completePurchase(purchaseDetails);
        }
      }
    }
  }

  static buyProduct(ProductDetails product) {
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
    connection.buyConsumable(purchaseParam: purchaseParam);
  }

  static buyCredit({required PurchaseDetails prodetail}) {
    ApiManager.callPost(
      ApiUtils.baseUrl + ApiUtils.purchase,
      headers: ApiParam.header,
      body: {
        ApiParam.subscriptionPlan: prodetail.productID,
        ApiParam.purchaseToken:
            prodetail.verificationData.serverVerificationData,
      },
    ).then((value) {
      Get.back();
      Get.find<HomeController>().credit.value = value['data']['total_credit'];
      Get.back();
      AppDialog.successSnackBar(value['message']);
    }).onError((error, stackTrace) {
      Get.back();
      AppDialog.errorSnackBar(error.toString());
    });
  }
}
