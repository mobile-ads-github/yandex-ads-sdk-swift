
import Foundation

@objc(YMASwiftBundleDictionaryTarget)
@objcMembers
public class YMASwiftBundleDictionaryTarget: NSObject {
    public func provideBundle() -> Bundle {
        return Bundle.module
    }
}
