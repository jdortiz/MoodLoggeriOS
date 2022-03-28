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

import Combine

class EntriesListViewModel: RepositoryObserver, ObservableObject {

    let repository: EntryRepository

    @Published var entries: [Entry] = []

    init(repository: EntryRepository) {
        self.repository = repository
        repository.observe(observer: self)
        repository.getAll { result in
            if case .success(let newList) = result {
                entries = newList
            }
        }
    }

    func onAddButton() {

    }

    func update() {
        repository.getAll { result in
            if case .success(let newList) = result {
                entries = newList
            }
        }
    }
}