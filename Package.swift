// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "TreeSitterSwift",
    platforms: [.macOS(.v10_13), .iOS(.v12)],
    products: [
        .library(name: "TreeSitterSwift", targets: ["TreeSitterSwift"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TreeSitterSwift",
            dependencies: [],
            path: ".",
            exclude: [
                "Cargo.toml",
                "Makefile",
                "binding.gyp",
                "bindings/c",
                "bindings/go",
                "bindings/node",
                "bindings/python",
                "bindings/rust",
                "prebuilds",
                "grammar.js",
                "package.json",
                "package-lock.json",
                "pyproject.toml",
                "setup.py",
                "test",
                "examples",
                ".editorconfig",
                ".github",
                ".gitignore",
                ".gitattributes",
                ".gitmodules",
            ],
            sources: [
                "src/parser.c",
                "src/scanner.c",
            ],
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [
                .headerSearchPath("src"),
                .headerSearchPath("."),
            ],
            linkerSettings: [
                .linkedLibrary("tree-sitter"),
            ]
        )
    ],
    cLanguageStandard: .c11,
)
