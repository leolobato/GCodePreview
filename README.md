# GCodePreview

A Swift Package for parsing G-code and rendering 3D print previews using SceneKit. Supports iOS 17+ and macOS 14+.

## Features

- **G-code parsing** — Supports G0/G1 linear moves, G2/G3 arc moves, absolute/relative positioning, retraction tracking, and move type classification (perimeter, infill, support, skirt)
- **3MF support** — Extracts embedded G-code from `.3mf` archives (Bambu Studio, PrusaSlicer, etc.) with multi-plate support
- **3D scene rendering** — Builds a SceneKit scene with color-coded filament paths, a build plate with grid lines, lighting, and an automatic camera
- **SwiftUI view** — Drop-in `GCodePreviewView` with orbit/turntable camera controls for both iOS and macOS
- **Layer-by-layer access** — Query individual print layers, segment counts, and build dimensions

## Installation

Add the package to your project via Swift Package Manager:

```swift
dependencies: [
    .package(url: "<repository-url>", from: "1.0.0")
]
```

## Usage

### Parse G-code and render a preview

```swift
import GCodePreview

let parser = GCodeParser()
let model = try parser.parse(gcodeString)

let palette = ColorPalette(filamentColors: [
    .init(red: 0.88, green: 0.27, blue: 0.24),  // Red
    .init(red: 0.16, green: 0.65, blue: 0.36),  // Green
    .init(red: 0.94, green: 0.70, blue: 0.18),  // Yellow
    .init(red: 0.30, green: 0.39, blue: 0.93),  // Blue
    .init(red: 0.92, green: 0.45, blue: 0.16),  // Orange
    .init(red: 0.12, green: 0.62, blue: 0.74),  // Cyan
])

let builder = PrintSceneBuilder(palette: palette)
let scene = builder.buildScene(from: model)

// In SwiftUI:
GCodePreviewView(scene: scene)
```

Colors are cycled when there are more filaments than palette entries. You can also customize the support material color:

```swift
let palette = ColorPalette(
    filamentColors: [.init(red: 1, green: 1, blue: 1)],
    supportColor: .init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
)
```

### Extract G-code from a .3mf file

```swift
let reader = ThreeMFReader()
let extracted = try reader.extractGCode(from: fileURL, preferredPlateId: 0)
let model = try GCodeParser().parse(extracted.content)
```

### Limit rendering to a specific layer

```swift
let model = try parser.parse(gcodeString, maxLayer: 42)
```

## Requirements

- iOS 17.0+ / macOS 14.0+
- Swift 5.9+
