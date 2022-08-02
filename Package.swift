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
            url: "https://github.com/mobile-ads-github/yandex-ads-sdk-swift/releases/download/5.3.0/YandexMobileAds.xcframework.zip",
            checksum: "2ad40da4573bdc5bf93b370a185e70a0d18478a60426b47be54ce5889ec91c26"
        ),
        .binaryTarget(
            name: "YandexMobileAdsInstream",
            url: "https://github.com/mobile-ads-github/yandex-ads-sdk-swift/releases/download/5.3.0/YandexMobileAdsInstream.xcframework.zip",
            checksum: "3ee0f4140535fef680788c8bac7fe4c524345644ff7e67b3a41d242cc1dd4825"
        ),
    ]
)
