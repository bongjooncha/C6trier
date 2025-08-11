import RealityKit

struct AudioComponent: Component, Codable {
    var wavFile: String
    var isPlaying: Bool = false

    static var componentName: String { "AudioComponent" }
}
