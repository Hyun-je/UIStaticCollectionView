// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "UIStaticCollectionView",
    products: [
        .library(
            name: "UIStaticCollectionView",
            targets: ["UIStaticCollectionView"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "UIStaticCollectionView",
            dependencies: [],
            path: "UIStaticCollectionView"
        ),
    ]
)
