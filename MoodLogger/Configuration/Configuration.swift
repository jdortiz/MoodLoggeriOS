/*
 * 1/4/22. Initial version created by jorge
 * for a MongoDB training.
 *
 * Copyright 2022 Jorge Ortiz Fuentes
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import Foundation

enum Configuration: String {
    // swiftlint:disable identifier_name
    case debug, qa, release

    static var current: Configuration = {
        guard let configString: String = Bundle.main.infoDictionary?["Configuration"] as? String else {
                fatalError("Couldn't read Configuration property from Info.plist")
        }
        guard let config = Configuration(rawValue: configString.lowercased()) else {
                fatalError("Unknown configuration: \(configString)")
        }
        return config
    }()

    var server: String {
        switch self {
        case .debug, .qa:
                    return "https://development.server.cloud/"
        case .release:
                    return "https://production.server.cloud/"
        }
    }
}
