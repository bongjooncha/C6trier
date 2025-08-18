import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    @Environment(AppModel.self) private var appModel
    
    // 2D(UI, cm) → 3D(World, m) 변환
    private func map2Dto3D(_ p: SIMD2<Float>, height: Float = 0.5) -> SIMD3<Float> {
        SIMD3<Float>(p.x * 0.1, height, p.y * 0.1) 
    }
    
    var body: some View {
        // 2D 위치 찾기 (없으면 기본값)
        let k1Pos2D = appModel.controlVM.musicShapes.first(where: { $0.name == "kick_1" })?.position ?? SIMD2<Float>(-30, -60)
        let k2Pos2D = appModel.controlVM.musicShapes.first(where: { $0.name == "kick_2" })?.position ?? SIMD2<Float>(30, -60)
        let k1World = map2Dto3D(k1Pos2D)
        let k2World = map2Dto3D(k2Pos2D)

        RealityView { content in
            // RCP 씬 추가
            guard let immersive = try? await Entity(named: "Immersive", in: realityKitContentBundle),
                let root = immersive.findEntity(named: "Root") else {
                    print("Immersive entity not found")
                    return
                }
            content.add(immersive)

            // KickEntity 생성 (이제 name만 전달, 나머지는 ControlViewModel에서)
            let k1 = KickEntity(name: "kick_1", viewModel: appModel.controlVM, worldPosition: k1World)
            let k2 = KickEntity(name: "kick_2", viewModel: appModel.controlVM, worldPosition: k2World)
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