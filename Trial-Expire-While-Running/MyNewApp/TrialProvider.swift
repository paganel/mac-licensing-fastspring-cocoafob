import Foundation

public class TrialProvider {
    
    public init() { }
    
    lazy var userDefaults: NSUserDefaults = UserDefaults.standardUserDefaults()

    public var currentTrialPeriod: TrialPeriod? {
        
        if let startDate = userDefaults.objectForKey("\(TrialPeriod.UserDefaultsKeys.StartDate)") as? NSDate,
            endDate = userDefaults.objectForKey("\(TrialPeriod.UserDefaultsKeys.EndDate)") as? NSDate {
                
            return TrialPeriod(startDate: startDate, endDate: endDate)
        }
        
        return .None
    }
}
