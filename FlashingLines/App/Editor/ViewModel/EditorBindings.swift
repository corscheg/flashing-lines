//
//  EditorBindings.swift
//  29.10.2024
//

import Combine
import Foundation

struct EditorBindings<Layer> {
    let onUndoTap: PassthroughSubject<Void, Never> = .init()
    let onRedoTap: PassthroughSubject<Void, Never> = .init()
    let onDeleteTap: PassthroughSubject<Void, Never> = .init()
    let onNewLayerTap: PassthroughSubject<Void, Never> = .init()
    let onShowLayersTap: PassthroughSubject<Void, Never> = .init()
    let onPlayTap: PassthroughSubject<Void, Never> = .init()
    let onPauseTap: PassthroughSubject<Void, Never> = .init()
    let onPencilTap: PassthroughSubject<Void, Never> = .init()
    let onBrushTap: PassthroughSubject<Void, Never> = .init()
    let onEraseTap: PassthroughSubject<Void, Never> = .init()
    let onShapesTap: PassthroughSubject<Void, Never> = .init()
    let onTouchEvent: PassthroughSubject<TouchEvent, Never> = .init()
    let onLayerTaken: PassthroughSubject<(layer: Layer, duplicate: Bool, play: Bool), Never> = .init()
    let onColorsTap: PassthroughSubject<Void, Never> = .init()
    let onColorSelect: PassthroughSubject<Color, Never> = .init()
    let onDuplicateTap: PassthroughSubject<Void, Never> = .init()
    let onDeleteAllTap: PassthroughSubject<Void, Never> = .init()
    let onSpeedTap: PassthroughSubject<Void, Never> = .init()
    let onSpeedSelect: PassthroughSubject<UInt, Never> = .init()
}
