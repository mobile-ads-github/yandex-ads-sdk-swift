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
        .binaryTarget(
            name: "YandexMobileAds",
            url: "https://github.com/mobile-ads-github/yandex-ads-sdk-swift/releases/download/5.1.0/YandexMobileAds.xcframework.zip",
            checksum: "ceb62ca3a02d3ab7ee6d5785f6bbc372298d35a67918e15ff064c5f4596fbc55"
        ),
        .binaryTarget(
            name: "YandexMobileAdsInstream",
            url: "https://github.com/mobile-ads-github/yandex-ads-sdk-swift/releases/download/5.1.0/YandexMobileAdsInstream.xcframework.zip",
            checksum: "468775f473de34d34d0cc5662d637980bb6464add1b9988c5d9cd7a2fa9f11e3"
        ),
    ]
)
