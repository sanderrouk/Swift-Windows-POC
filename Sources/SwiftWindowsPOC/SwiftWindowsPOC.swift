import SwiftWin32

private typealias MainDelegate = ApplicationDelegate & SceneDelegate

@main
final class SwiftWindowsPOC: MainDelegate {

    var window: Window!

    func scene(
        _ scene: Scene,
        willConnectTo session: SceneSession,
        options: Scene.ConnectionOptions
    ) {
        guard let windowScene = scene as? WindowScene else { return }

        window = Window(windowScene: windowScene)

        window.rootViewController = ViewController()
        window.rootViewController?.title = "SwiftWindowsPOC"

        let minimumSize = windowScene.sizeRestrictions?.minimumSize
        let screenRect = Rect(x: 0, y: 0, width: minimumSize?.width ?? 0, height: minimumSize?.height ?? 0)
        let rootView = RootView(frame: screenRect)
        window.addSubview(rootView.make())
        window.makeKeyAndVisible()
    }
}