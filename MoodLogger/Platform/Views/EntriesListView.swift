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

struct EntriesListView: View {
    // MARK: - Properties
    private let viewModel: EntriesListViewModel
    @State private var showModal = false
    @State private var newMood = Mood.neutral

    // MARK: - Initializer
    init(viewModel: EntriesListViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - View
    var body: some View {
        List {
            ForEach(viewModel.entries) { entry in
                EntryRowView(entry: entry)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Mood")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    showModal = true
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $showModal) {
            print("Create mood: \(newMood) at \(Date())")
        } content: {
            NavigationView {
                MoodDialogView(mood: $newMood)
            }
        }

    }
}

// struct EntriesListViewPreviews: PreviewProvider {
//    static var previews: some View {
//        EntriesListView()
//    }
// }
