//
//  CanvasView.swift
//  28.10.2024
//

import Combine
import UIKit

final class CanvasView<Playable: Collection>: UIView where Playable.Element == UIImage {
    
    // MARK: Internal Properties
    var eventPublisher: some Publisher<TouchEvent, Never> {
        canvasResponderView.eventPublisher
    }
    
    // MARK: Private Properties
    private let cornerRadiuses: any CornerRadiuses
    private let images: any Images
    private let opacities: any Opacities
    private let screen: UIScreen
    
    // MARK: Visual Components
    private lazy var paperView: UIImageView = {
        let imageView = UIImageView(image: images.paper)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = cornerRadiuses.large
        imageView.layer.cornerCurve = .continuous
        
        return imageView
    }()
    
    private lazy var paintingView = PaintingView(opacities: opacities)
    private lazy var canvasResponderView = CanvasResponderView(screen: screen)
    private lazy var playerView = PlayerView<Playable>()
    
    // MARK: Initializers
    init(frame: CGRect, cornerRadiuses: any CornerRadiuses, images: any Images, opacities: any Opacities, screen: UIScreen) {
        self.opacities = opacities
        self.cornerRadiuses = cornerRadiuses
        self.images = images
        self.screen = screen
        super.init(frame: frame)
        
        addSubviews()
        playerView.isHidden = true
    }
    
    convenience init(cornerRadiuses: any CornerRadiuses, images: any Images, opacities: any Opacities, screen: UIScreen) {
        self.init(frame: .zero, cornerRadiuses: cornerRadiuses, images: images, opacities: opacities, screen: screen)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UIView
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        size
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        paperView.frame = bounds
        playerView.frame = bounds
        paintingView.frame = bounds
        canvasResponderView.frame = bounds
    }
    
    // MARK: Internal Methods
    func startDrawing(at start: CGPoint) {
        paintingView.startDrawing(at: start)
    }
    
    func continueDrawing(to point: CGPoint, brushWidth: CGFloat, color: CGColor) {
        paintingView.continueDrawing(to: point, brushWidth: brushWidth, color: color)
    }
    
    func endDrawing(at point: CGPoint, brushWidth: CGFloat, color: CGColor) {
        paintingView.endDrawing(at: point, brushWidth: brushWidth, color: color)
    }
    
    func moveUndoToDrawn() {
        paintingView.moveUndoToDrawn()
    }
    
    func movePaintingToUndo() {
        paintingView.movePaintingToUndo()
    }
    
    func performUndo() {
        paintingView.performUndo()
    }
    
    func performRedo() {
        paintingView.performRedo()
    }
    
    func takeCurrentImage() -> UIImage? {
        paintingView.takeCurrentImage()
    }
    
    func setAssistImage(_ image: UIImage?) {
        paintingView.setAssistImage(image)
    }
    
    func clearPainting() {
        paintingView.clear()
    }
    
    func setDrawnImage(_ image: UIImage) {
        paintingView.setDrawnImage(image)
    }
    
    func startPlaying(_ playable: Playable, at framesPerSecond: UInt) {
        paintingView.isHidden = true
        canvasResponderView.isHidden = true
        playerView.isHidden = false
        playerView.play(playable, at: framesPerSecond)
    }
    
    func stopPlaying() {
        playerView.stop()
        playerView.isHidden = true
        canvasResponderView.isHidden = false
        paintingView.isHidden = false
    }
    
    func startErase(at location: CGPoint) {
        paintingView.startErase(at: location)
    }
    
    func continueErase(to location: CGPoint, width: CGFloat) {
        paintingView.continueErase(to: location, width: width)
    }
    
    func endErase(at location: CGPoint, width: CGFloat) {
        paintingView.endErase(at: location, width: width)
    }
    
    func commitErase() {
        paintingView.commitErase()
    }
    
    func undoErase() {
        paintingView.undoErase()
    }
    
    func redoErase() {
        paintingView.redoErase()
    }
}

// MARK: - Private Methods
extension CanvasView {
    private func addSubviews() {
        addSubview(paperView)
        addSubview(playerView)
        addSubview(paintingView)
        addSubview(canvasResponderView)
    }
}
