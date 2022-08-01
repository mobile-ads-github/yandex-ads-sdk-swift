#!/bin/sh
set -e

version=$1
instream_version=$2

git checkout main
git pull
git checkout -b "$version"

rm -rf YandexMobileAds.xcframework
curl -O "https://raw.githubusercontent.com/CocoaPods/Specs/master/Specs/a/c/5/YandexMobileAds/$version/YandexMobileAds.podspec.json"
curl $(cat ./YandexMobileAds.podspec.json | jq -r '.source.http') -o YandexMobileAds.zip
unzip ./YandexMobileAds.zip -d ./YandexMobileAds
mv "./YandexMobileAds/$(cat ./YandexMobileAds.podspec.json | jq -r '.vendored_frameworks')" YandexMobileAds.xcframework
rm ./YandexMobileAds.zip
rm -rf ./YandexMobileAds
rm ./YandexMobileAds.podspec.json


if [ "$instream_version" != "" ]
then
    rm -rf YandexMobileAdsInstream.xcframework
    curl -O "https://raw.githubusercontent.com/CocoaPods/Specs/master/Specs/6/4/e/YandexMobileAdsInstream/$instream_version/YandexMobileAdsInstream.podspec.json"
    curl $(cat ./YandexMobileAdsInstream.podspec.json | jq -r '.source.http') -o YandexMobileAdsInstream.zip
    unzip ./YandexMobileAdsInstream.zip -d ./YandexMobileAdsInstream
    mv "./YandexMobileAdsInstream/$(cat ./YandexMobileAdsInstream.podspec.json | jq -r '.vendored_frameworks')" YandexMobileAdsInstream.xcframework
    rm ./YandexMobileAdsInstream.zip
    rm -rf ./YandexMobileAdsInstream
    rm ./YandexMobileAdsInstream.podspec.json
fi

git add .
git commit -am "$version"
git tag "$version"
#git push origin "$version" --tags