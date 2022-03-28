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
import Foundation

class InMemoryEntryRepository: EntryRepository {
    private var observer: RepositoryObserver?
    private var entries: [Entry] = [
        Entry(mood: .neutral, date: Calendar.current.date(byAdding: .day,
                                                          value: -2,
                                                          to: Date()) ?? Date()),
        Entry(mood: .sad, date: Calendar.current.date(byAdding: .day,
                                                          value: -1,
                                                          to: Date()) ?? Date())
    ]

    func getAll(completion: (Result<[Entry], RepositoryError>) -> Void) {
        completion(.success(entries))
    }

    func add(entry: Entry, completion: (Result<Void, RepositoryError>) -> Void) {
        entries.append(entry)
        observer?.update()
    }

    func observe(observer: RepositoryObserver) {
        self.observer = observer
    }
}
