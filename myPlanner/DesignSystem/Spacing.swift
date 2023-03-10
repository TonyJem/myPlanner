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
    
    public static var separatorThickness: Self { 1 }
    
    public static var spacingXXXS: Self { 2 }
    
    public static var spacingXXS: Self { 4 }
    
    public static var spacingXS: Self { 8 }
    
    public static var spacingS: Self { 12 }
    
    public static var spacingM: Self { 16 }
    
    public static var spacingL: Self { 24 }
    
    public static var spacingXL: Self { 32 }
    
    public static var spacingXXL: Self { 48 }
    
    public static var spacingXXXL: Self { 64 }
    
}
