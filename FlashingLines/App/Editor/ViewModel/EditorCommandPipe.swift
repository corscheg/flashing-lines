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
        case takeLayer(duplicate: Bool, play: Bool)
        case setAssistLayer(Layer?)
        case clearCanvas
        case setDrawn(Layer)
        case play(Playable, speed: UInt)
        case stop
        case beginErase(location: CGPoint)
        case continueErase(location: CGPoint, width: CGFloat)
        case endErase(location: CGPoint, width: CGFloat)
        case commitErase
        case undoErase
        case redoErase
        case showSpeedSelector(currentSpeed: UInt)
    }
}
