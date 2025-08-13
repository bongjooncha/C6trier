import RealityKit
import Foundation

class EffectSystem: System {
    static let query = EntityQuery(where: .has(EffectComponent.self) && .has(AudioComponent.self) && .has(LightComponent.self))
    
    required init(scene: RealityKit.Scene) {
        // 필요한 초기화 작업
    }
    
    func update(context: SceneUpdateContext) {
        context.scene.performQuery(Self.query).forEach { entity in
            guard var effectComponent = entity.components[EffectComponent.self],
                  var audioComponent = entity.components[AudioComponent.self],
                  var lightComponent = entity.components[LightComponent.self] else { return }
            
            if effectComponent.isActive {
                // 오디오 재생
                audioComponent.isPlaying = true
                entity.components[AudioComponent.self] = audioComponent
                
                // 라이트 활성화
                lightComponent.isActive = true
                lightComponent.intensity = effectComponent.lightIntensity
                entity.components[LightComponent.self] = lightComponent
                
                // 효과 비활성화 예약
                DispatchQueue.main.asyncAfter(deadline: .now() + effectComponent.duration) {
                    effectComponent.isActive = false
                    lightComponent.isActive = false
                    entity.components[EffectComponent.self] = effectComponent
                    entity.components[LightComponent.self] = lightComponent
                }
            }
        }
    }
}
