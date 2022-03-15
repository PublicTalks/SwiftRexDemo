import ProjectDescription

let dependencies = Dependencies(
    // carthage: [
    //     .github(path: "Alamofire/Alamofire", requirement: .exact("5.0.4")),
    // ],
    swiftPackageManager: .init([
        .remote(url: "https://github.com/Quick/Quick", requirement: .upToNextMajor(from: "4.0.0")),
        .remote(url: "https://github.com/Quick/Nimble", requirement: .upToNextMajor(from: "9.2.0")),

    ], targetSettings: ["Nimble": ["ENABLE_TESTING_SEARCH_PATHS": "YES"], "Quick": ["ENABLE_TESTING_SEARCH_PATHS": "YES"]]),

    platforms: [.iOS]
)
