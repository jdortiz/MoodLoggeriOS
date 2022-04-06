/*
 * 25/3/22. Initial version created by jorge
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
import SwiftUI
import Foundation

@main
struct MoodLoggerApp: App {
    init() {
        self.registerSettings()

        print("Configuration: \(Configuration.current), server: \(Configuration.current.server)")
#if USE_REALM
        print("Using Realm")
#else
        print("NOT using Realm")
#endif
        if FeatureFlagsFactory.getFlags(forConfiguration: Configuration.current).useRealm {
            print("Using Realm dynamically")
        } else {
            print("Not using Realm dynamically")
        }
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                EntriesListView(viewModel: EntriesListViewModel(repository: InMemoryEntryRepository()))
            }
        }
    }

    private func registerSettings() {
        guard let settingsURL = Bundle.main.url(forResource: "Root",
                                                withExtension: "plist",
                                                subdirectory: "Settings.bundle"),
              let settingsPlist = NSDictionary(contentsOf: settingsURL),
              let preferences = settingsPlist["PreferenceSpecifiers"] as? [NSDictionary] else {
            print("Couldn't load data from Settings.bundle")
            return
        }
        var defaultsFromSettings: [String: Any] = [:]

        for preference in preferences {
            if let key = preference["Key"] as? String,
               let value = preference["DefaultValue"] {
                defaultsFromSettings[key] = value
            }
        }
        UserDefaults.standard.register(defaults: defaultsFromSettings)
    }
}
