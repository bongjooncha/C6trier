// C6trier/Source/Common/ECS/Entities/KickEntity.swift
import RealityKit
import SwiftUI

final class KickEntity: Entity {
    required init() {
        super.init()
    }

    convenience init(name: String, viewModel: ControlViewModel, worldPosition: SIMD3<Float>) {
        self.init()
        
        // Shape2DModel 찾기
        guard let shape = viewModel.musicShapes.first(where: { $0.name == name }) else {
            print("Warning: Shape2DModel not found for name: \(name)")
            return
        }

        // 메타데이터로 ShapeComponent 저장
        let materialColor = ColorType.MaterialColor(color: shape.color)
        components[ShapeComponent.self] = ShapeComponent(
            name: name,
            color: materialColor,
            position: worldPosition,
            size: Float(shape.radius) * 0.1  // cm → m 변환
        )

        // 시각 메쉬(구) 생성
        let mesh = MeshResource.generateSphere(radius: Float(shape.radius) * 0.05)  // cm → m
        let material = SimpleMaterial(color: UIColor(shape.color), isMetallic: false)
        let visual = ModelEntity(mesh: mesh, materials: [material])

        self.name = name
        self.position = worldPosition
        addChild(visual)
    }
}