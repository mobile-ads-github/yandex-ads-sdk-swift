// swift-tools-version:5.5
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
            url: "https://github.com/yandexmobile/yandex-ads-sdk-swift/releases/download/5.0.1/YandexMobileAds.xcframework.zip",
            checksum: "70398e54d4b979903373ef395ba8b6878e01c27087a5eb5ab744beac54d6d00f"
        ),
        .binaryTarget(
            name: "YandexMobileAdsInstream",
            url: "https://github.com/yandexmobile/yandex-ads-sdk-swift/releases/download/5.0.1/YandexMobileAdsInstream.xcframework.zip",
            checksum: "0ceeb35f671991b43cdc9604f2769e942d84ff3a4fc101063be0ec0d9663e7ec"
        ),
    ]
)
