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

struct EntryRowView: View {
    // MARK: - Properties
    private var entry: Entry
    private let formatter: DateFormatter

    // MARK: - Initializer
    init(entry: Entry) {
        self.entry = entry
        formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
    }

    // MARK: - View
    var body: some View {
        HStack(alignment: .center) {
            Text(String("\(entry.mood)"))
                .font(Font.system(size: 30))
            Text(entry.date, formatter: formatter)
        }
    }
}

struct EntryRowViewPreviews: PreviewProvider {
    static var previews: some View {
        List {
            EntryRowView(entry: Entry(mood: .sad,
                                      date: Calendar.current.date(byAdding: .day,
                                                                  value: -1,
                                                                  to: Date()) ?? Date()))
            EntryRowView(entry: Entry(mood: .neutral,
                                      date: Date()))
            EntryRowView(entry: Entry(mood: .happy,
                                      date: Calendar.current.date(byAdding: .day,
                                                                  value: 1,
                                                                  to: Date()) ?? Date()))
        }
    }
}
