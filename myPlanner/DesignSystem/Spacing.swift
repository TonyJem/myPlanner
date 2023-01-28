import Foundation

/**
 * This extension adds predifened values of spacing.
 *
 * The constants defined here should be used for spacing,
 * inset, padding and margin definitions as mush as possible.
 * Extending `ExpressibleByIntegerLiteral` adds these constants
 * to all types that can be initialized with integer, such as
 * `Int`,`Double` or `CGFloat`.
 */
extension ExpressibleByIntegerLiteral {
    
    public static var spacingS: Self { 12 }
    
    public static var spacingM: Self { 16 }
    
    public static var spacingL: Self { 24 }
    
}
