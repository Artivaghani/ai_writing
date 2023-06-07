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
      print('on Data: $purchaseUpdated');
      AppDialog.showProcess();
      listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      Get.back();
      print('on Done: $purchaseUpdated');
      subscription!.cancel();
    }, onError: (error) {
      Get.back();
      print('on Error: $purchaseUpdated');
      AppDialog.errorSnackBar(AppString.errorMsg.tr);
    });
  }

  static initStoreInfo({required Function callBack}) async {
    // connection.queryProductDetails(AppConst.productPlan).then((value) {
    //   if (value.error == null) {
    //     products = value.productDetails;
    //     debugPrint('purchaseList: ${value.productDetails}');
    //     if (products.isEmpty && !isRecall) {
    //       Future.delayed(
    //         const Duration(seconds: 3),
    //         () {
    //           initStoreInfo(callBack: callBack);
    //           isRecall = true;
    //         },
    //       );
    //     } else {
    //       callBack.call();
    //     }
    //   }
    // }).onError((error, stackTrace) {
    //   callBack.call();
    // });
  }

  static Future<void> listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) async {
    print('purchaseDetailsList: $purchaseDetailsList');
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      print('purchaseDetails: ${purchaseDetails.status}');
      if (purchaseDetails.status == PurchaseStatus.pending) {
        print('pending process');
        Get.back();
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          Get.back();
          AppDialog.errorSnackBar(AppString.errorMsg.tr);
        } else if (purchaseDetails.status == PurchaseStatus.purchased) {
          print("purchased id ${purchaseDetails.productID}");
          print("get buy amout id ${purchaseDetails.productID.split('_')[1]}");
          print('token : ${purchaseDetails.verificationData.serverVerificationData}');
          print('complete call ${AppConst.apkName}');
          // buyCredit(prodetail: purchaseDetails);
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

  // static buyCredit({required PurchaseDetails prodetail}) {
  //   print('call buy credit');
  //   JWTFunctions().apiEncode({
  //     ApiParams.appId: StorageHelper().loginData.appid,
  //     ApiParams.appToken: StorageHelper().loginData.apptoken,
  //     ApiParams.amount: prodetail.productID.split('_')[1],
  //     ApiParams.purchasetoken: prodetail.verificationData.serverVerificationData,
  //     ApiParams.productId: prodetail.productID,
  //     ApiParams.apkname: AppConst.apkName,
  //     // ApiParams.amount: prodetail.productID.split('_')[1],
  //   }).then((token) {
  //     ApiManager.callPost(ApiUtils.baseUrl + ApiParams.buyCredit, body: {
  //       ApiParams.PARAM: token,
  //     }).then((value) {
  //       Get.back();
  //       HomeController homeController = Get.find<HomeController>();
  //       homeController.getCredit();
  //       Get.back();
  //       AppDialog.successSnackBar('${AppString.youAreGet.tr} ${prodetail.productID.split('_')[1]} ${AppString.credits.tr} ${AppString.successfully.tr}');
  //     }).onError((error, stackTrace) {
  //       Get.back();
  //       AppDialog.errorSnackBar(error.toString());
  //     });
  //   }).onError((error, stackTrace) {
  //     Get.back();
  //   });
  // }
}
