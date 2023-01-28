import Foundation

extension String {
    
    /// Returns the localized `self`.
    public var localized: String {
        return NSLocalizedString(self, comment: "\(self)_comment")
    }
    
}
