// swift-tools-version:5.3
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
            resources: [
                .process("Resources/YandexMobileAdsBundle.bundle")
            ],
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
            url: "https://github.com/mobile-ads-github/yandex-ads-sdk-swift/releases/download/5.2.0/YandexMobileAds.xcframework.zip",
            checksum: "365ad40a59ff43262e150bd906d86d2662397f5e591df082e32ec277a3caf037"
        ),
        .binaryTarget(
            name: "YandexMobileAdsInstream",
            url: "https://github.com/mobile-ads-github/yandex-ads-sdk-swift/releases/download/5.2.0/YandexMobileAdsInstream.xcframework.zip",
            checksum: "9121d578cb07eaeb2f8b38668c674f2535ff77e2f5e70fd6517366b0c56b4460"
        ),
    ]
)
