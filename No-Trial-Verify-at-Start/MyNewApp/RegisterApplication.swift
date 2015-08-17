import Foundation

public class RegisterApplication: HandlesRegistering {
    
    let licenseVerifier: LicenseVerifier
    let licenseWriter: LicenseWriter
    let changeBroadcaster: LicenseChangeBroadcaster
    
    public convenience init() {
        
        self.init(licenseVerifier: LicenseVerifier(), licenseWriter: LicenseWriter(), changeBroadcaster: LicenseChangeBroadcaster())
    }
    
    public init(licenseVerifier: LicenseVerifier, licenseWriter: LicenseWriter, changeBroadcaster: LicenseChangeBroadcaster) {
        
        self.licenseVerifier = licenseVerifier
        self.licenseWriter = licenseWriter
        self.changeBroadcaster = changeBroadcaster
    }
    
    public func register(name: String, licenseCode: String) {
        
        if !licenseVerifier.licenseCodeIsValid(licenseCode, forName: name) {
            return
        }
        
        let licenseInformation = LicenseInformation.Registered(License(name: name, key: licenseCode))
        
        licenseWriter.storeLicenseCode(licenseCode, forName: name)
        changeBroadcaster.broadcast(licenseInformation)
    }
}