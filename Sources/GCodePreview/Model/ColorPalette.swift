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

        /// Creates a color from a hex value, e.g. `Color(hex: 0xE04540)`.
        public init(hex: UInt32, alpha: CGFloat = 1) {
            self.red = CGFloat((hex >> 16) & 0xFF) / 255
            self.green = CGFloat((hex >> 8) & 0xFF) / 255
            self.blue = CGFloat(hex & 0xFF) / 255
            self.alpha = alpha
        }
    }

    /// Build plate appearance colors.
    public struct BuildPlateColors: Sendable, Hashable {
        public var side: Color
        public var top: Color
        public var frame: Color
        public var gridMinor: Color
        public var gridMajor: Color

        public init(
            side: Color = Color(hex: 0x333840),
            top: Color = Color(hex: 0x1F2126),
            frame: Color = Color(hex: 0x474D57),
            gridMinor: Color = Color(hex: 0x525761, alpha: 0.45),
            gridMajor: Color = Color(hex: 0x6B7380, alpha: 0.72)
        ) {
            self.side = side
            self.top = top
            self.frame = frame
            self.gridMinor = gridMinor
            self.gridMajor = gridMajor
        }
    }

    /// Colors assigned to filament indices (cycled if more filaments than colors).
    public var filamentColors: [Color]

    /// Color used for support material.
    public var supportColor: Color

    /// Colors used for the build plate.
    public var buildPlate: BuildPlateColors

    public init(
        filamentColors: [Color],
        supportColor: Color = Color(hex: 0x6194EB, alpha: 0.55),
        buildPlate: BuildPlateColors = BuildPlateColors()
    ) {
        self.filamentColors = filamentColors
        self.supportColor = supportColor
        self.buildPlate = buildPlate
    }

    public static let `default` = ColorPalette(filamentColors: [
        Color(hex: 0xE0453D),
        Color(hex: 0x29A65C),
        Color(hex: 0xF0B32E),
        Color(hex: 0x4D63ED),
        Color(hex: 0xEB7329),
        Color(hex: 0x1F9EBD),
    ])
}
