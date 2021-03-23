import Foundation
import SwiftWin32
import struct WinSDK.UINT

final class RootView {

    private let baseView: View
    private let label: Label
    private let progressView = ProgressView(frame: .zero)
    private let textView: TextView
    private var monsters = [Monster]()

    init(frame: Rect) {
        self.baseView = View(frame: frame)
        self.label = Label(
            frame: Rect(
                x: 340,
                y: frame.midY - 60,
                width: 300,
                height: 30
            )
        )
        self.textView = TextView(
            frame: Rect(
                x: 20,
                y: 20,
                width: 300,
                height: frame.size.height - 40
            ))
        setup()
        layout(for: frame)
    }

    func make() -> View {
        loadData()
        return baseView
    }

    private func setup() {
        label.text = "Example label with lengthy text to show mid point"
        textView.editable = false
    }

    private func layout(for frame: Rect) {
        baseView.addSubview(label)
        baseView.addSubview(progressView)
        baseView.addSubview(textView)

        progressView.frame = Rect(
            x: 340,
            y: frame.midY - 20,
            width: 300,
            height: 30
        )
        // Needs to be called post frame sizing
        progressView.setProgress(0.5, animated: false)
    }

    private func loadData() {
        Open5eApi().getMonsters { [textView] monsters in
            let text = monsters.map({ "\($0.name), size \($0.size)"}).joined(separator: "\n")
            textView.text = text
        }
    }
}