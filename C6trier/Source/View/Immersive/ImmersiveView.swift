import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    @Environment(AppModel.self) private var appModel
    
    // 2D(UI, cm) → 3D(World, m) 변환
    private func map2Dto3D(_ p: SIMD2<Float>, height: Float = 0.5) -> SIMD3<Float> {
        SIMD3<Float>(p.x * 0.1, height/2, p.y * 0.1) 
    }
    
    var body: some View {
        // 2D 위치 찾기 (없으면 기본값)
        let k1Pos2D = appModel.controlVM.musicShapes.first(where: { $0.name == "kick_1" })?.position ?? SIMD2<Float>(-30, -60)
        let k2Pos2D = appModel.controlVM.musicShapes.first(where: { $0.name == "kick_2" })?.position ?? SIMD2<Float>(30, -60)
        let k1World = map2Dto3D(k1Pos2D)
        let k2World = map2Dto3D(k2Pos2D)

        RealityView { content in
            // RCP 씬 추가
            guard let immersive = try? await Entity(named: "Immersive", in: realityKitContentBundle) else {
                    print("Immersive entity not found")
                    return
                }
            content.add(immersive)

            // KickEntity 생성 (이제 name만 전달, 나머지는 ControlViewModel에서)
            let k1 = KickEntity(name: "kick_1", viewModel: appModel.controlVM, worldPosition: k1World)
            let k2 = KickEntity(name: "kick_2", viewModel: appModel.controlVM, worldPosition: k2World)
            k1.components.set(HoverEffectComponent())
            k1.components.set(InputTargetComponent())
            k1.generateCollisionShapes(recursive: true)
            k2.components.set(HoverEffectComponent())
            k2.components.set(InputTargetComponent())
            k2.components.set(CollisionComponent(shapes: [.generateCapsule(height:0.1, radius: 0.5)]))
            
            
            // fx와 clap에도 Hover 추가
            if let fx = immersive.findEntity(named: "fx") {
                fx.components.set(HoverEffectComponent())
            }
            
            if let clap = immersive.findEntity(named: "clap") {
                clap.components.set(HoverEffectComponent())
                clap.components.set(InputTargetComponent())
                clap.components.set(CollisionComponent(shapes: [.generateCapsule(height:0.1, radius: 0.05)]))
            }
            
            immersive.addChild(k1)
            immersive.addChild(k2)
        } update: { content in
            guard let root = content.entities.first?.findEntity(named: "Root") else { return }
            
            func updateKick(_ name: String, to pos: SIMD3<Float>) {
                root.findEntity(named: name)?.position = pos
            }
            updateKick("kick_1", to: k1World)
            updateKick("kick_2", to: k2World)
        }
    }
}

#Preview(immersionStyle: .full) {
    ImmersiveView()
        .environment(AppModel())
}
