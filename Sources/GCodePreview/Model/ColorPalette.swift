import Foundation

public struct ColorPalette: Sendable, Hashable {
    /// A platform-agnostic RGBA color.
    public struct Color: Sendable, Hashable {
        public let red: CGFloat
        public let green: CGFloat
        public let blue: CGFloat
        public let alpha: CGFloat

        public init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) {
            self.red = red
            self.green = green
            self.blue = blue
            self.alpha = alpha
        }
    }

    /// Colors assigned to filament indices (cycled if more filaments than colors).
    public var filamentColors: [Color]

    /// Color used for support material.
    public var supportColor: Color

    public init(
        filamentColors: [Color],
        supportColor: Color = Color(red: 0.38, green: 0.58, blue: 0.92, alpha: 0.55)
    ) {
        self.filamentColors = filamentColors
        self.supportColor = supportColor
    }

    public static let `default` = ColorPalette(filamentColors: [
        Color(red: 0.88, green: 0.27, blue: 0.24),
        Color(red: 0.16, green: 0.65, blue: 0.36),
        Color(red: 0.94, green: 0.70, blue: 0.18),
        Color(red: 0.30, green: 0.39, blue: 0.93),
        Color(red: 0.92, green: 0.45, blue: 0.16),
        Color(red: 0.12, green: 0.62, blue: 0.74),
    ])
}
