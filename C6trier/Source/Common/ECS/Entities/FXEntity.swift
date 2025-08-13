import RealityKit
import SwiftUI

class FXEntity: Entity {
    required init() {
        super.init()
    }
    
    convenience init(name: String, color: SwiftUI.Color) {
        self.init()

        // 충돌 감지를 위한 컴포넌트
        components[CollisionComponent.self] = CollisionComponent(
            shapes: [.generateBox(size: [0.2, 0.2, 0.2])],
            mode: .trigger,
            filter: .sensor
        )
        
        // 오디오 컴포넌트
        components[AudioComponent.self] = AudioComponent(
            wavFile: name
        )
        
        // 라이트 컴포넌트
        components[LightComponent.self] = LightComponent(
            intensity: 1000,
            color: ColorType.MaterialColor(color: color)
        )
        
        // 이펙트 컴포넌트
        components[EffectComponent.self] = EffectComponent()
    }
}
