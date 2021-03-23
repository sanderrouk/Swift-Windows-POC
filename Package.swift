// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "SwiftWindowsPOC",
    products: [
        .executable(name: "SwiftWindowsPOC", targets: ["SwiftWindowsPOC"])
    ],
    dependencies: [
        .package(
            name: "SwiftWin32",
            url: "https://github.com/compnerd/swift-win32.git",
            .revision("4ba773f20cf8aba2f7a00daa37a3044c6702ee23")
        )
    ],
    targets: [
        .executableTarget(
            name: "SwiftWindowsPOC",
            dependencies: ["SwiftWin32"],
            exclude: ["Info.plist", "SwiftWindowsPOC.exe.manifest"],
            swiftSettings: [.unsafeFlags(["-parse-as-library"])]
        )
    ]
)