#!/bin/sh
set -e

version=$1
instream_version=$2

if [ "$instream_version" == "" ]
then
    echo "Instream version should be specified"
    exit 1
fi

git checkout -b "release-$version"

[ -e ./YandexMobileAds.xcframework.zip ] && rm ./YandexMobileAds.xcframework.zip
[ -e ./YandexMobileAdsInstream.xcframework.zip ] && rm ./YandexMobileAdsInstream.xcframework.zip
[ -e ./YandexMobileAds.podspec.json ] && rm ./YandexMobileAds.podspec.json
[ -e ./YandexMobileAdsInstream.podspec.json ] && rm ./YandexMobileAdsInstream.podspec.json

curl -O "https://raw.githubusercontent.com/CocoaPods/Specs/master/Specs/a/c/5/YandexMobileAds/$version/YandexMobileAds.podspec.json"
curl $(cat ./YandexMobileAds.podspec.json | jq -r '.source.http') -o YandexMobileAds.zip
unzip ./YandexMobileAds.zip -d ./YandexMobileAds
rm ./YandexMobileAds.zip
mv "./YandexMobileAds/$(cat ./YandexMobileAds.podspec.json | jq -r '.vendored_frameworks')" YandexMobileAds.xcframework
rm -rf ./YandexMobileAds
zip -r YandexMobileAds.xcframework.zip YandexMobileAds.xcframework
rm -rf ./YandexMobileAds.xcframework

curl -O "https://raw.githubusercontent.com/CocoaPods/Specs/master/Specs/6/4/e/YandexMobileAdsInstream/$instream_version/YandexMobileAdsInstream.podspec.json"
curl $(cat ./YandexMobileAdsInstream.podspec.json | jq -r '.source.http') -o YandexMobileAdsInstream.zip
unzip ./YandexMobileAdsInstream.zip -d ./YandexMobileAdsInstream
rm ./YandexMobileAdsInstream.zip
mv "./YandexMobileAdsInstream/$(cat ./YandexMobileAdsInstream.podspec.json | jq -r '.vendored_frameworks')" YandexMobileAdsInstream.xcframework
rm -rf ./YandexMobileAdsInstream
zip -r YandexMobileAdsInstream.xcframework.zip YandexMobileAdsInstream.xcframework
rm -rf ./YandexMobileAdsInstream.xcframework

YMA_URL="https://github.com/mobile-ads-github/yandex-ads-sdk-swift/releases/download/$version/YandexMobileAds.xcframework.zip"
YMA_INSTREAM_URL="https://github.com/mobile-ads-github/yandex-ads-sdk-swift/releases/download/$version/YandexMobileAdsInstream.xcframework.zip"
YMA_CHECKSUM=$(swift package compute-checksum ./YandexMobileAds.xcframework.zip)
YMA_INSTREAM_CHECKSUM=$(swift package compute-checksum ./YandexMobileAdsInstream.xcframework.zip)

sed -e "s!YMA_URL!$YMA_URL!; s!YMA_INSTREAM_URL!$YMA_INSTREAM_URL!; s!YMA_CHECKSUM!$YMA_CHECKSUM!; s!YMA_INSTREAM_CHECKSUM!$YMA_INSTREAM_CHECKSUM!;" ./Package.template > Package.swift

read -p "Release is prepared. Now you can validate generated Package.swift, then press ENTER to push."

git add .
git commit -am "$version"
git tag "$version"
git push origin "release-$version" --tags