// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YandexMobileAdsPackage",
    platforms: [.iOS(.v10)],
    products: [
        .library(name: "YandexMobileAdsPackage", targets: ["YandexMobileAdsTarget"])
    ],
    dependencies: [
        .package(url: "https://github.com/yandexmobile/metrica-sdk-ios", "4.0.0"..<"5.0.0")
    ],
    targets: [
        .target(
            name: "YandexMobileAdsTarget",
            dependencies: [
                .target(name: "YandexMobileAds"),
                .target(name: "YandexMobileAdsInstream"),
                .product(name: "YandexMobileMetrica", package: "metrica-sdk-ios"),
            ],
            path: "YandexMobileAdsTarget",
            linkerSettings: [
                .linkedFramework("UIKit"),
                .linkedFramework("Foundation"),
                .linkedFramework("WebKit"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("CoreLocation"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("AdSupport"),
                .linkedFramework("StoreKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreImage"),
                .linkedFramework("CoreMedia"),
                .linkedLibrary("xml2")
            ]
        ),
        .binaryTarget(name: "YandexMobileAds", path: "YandexMobileAds.xcframework"),
        .binaryTarget(name: "YandexMobileAdsInstream", path: "YandexMobileAdsInstream.xcframework"),
    ]
)
