//
//  EditorCommandPipe.swift
//  29.10.2024
//

import Foundation

struct EditorCommandPipe<Layer, Playable: Collection> where Playable.Element == Layer {
    var commands: [Command]
}

// MARK: - Command
extension EditorCommandPipe {
    enum Command {
        case begin(location: CGPoint)
        case `continue`(location: CGPoint, width: CGFloat, color: Color)
        case end(location: CGPoint, width: CGFloat, color: Color)
        case movePaintingToUndo
        case moveUndoToDrawn
        case undo
        case redo
        case takeLayer
        case setAssistLayer(Layer?)
        case clearCanvas
        case setDrawn(Layer)
        case play(Playable)
        case stop
    }
}
