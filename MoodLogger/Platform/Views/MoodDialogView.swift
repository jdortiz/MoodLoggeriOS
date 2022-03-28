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

struct MoodDialogView: View {
    // MARK: - Properties
    let viewModel: MoodDialogViewModel
    @Environment(\.presentationMode) private var presentationMode

    // MARK: - View
    var body: some View {
        VStack {
            Text("Select your mood")
            HStack(spacing: 30) {
                Button {
                    viewModel.onSadButton()
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    MoodButton(mood: .sad)
                }
                Button {
                    viewModel.onNeutralButton()
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    MoodButton(mood: .neutral)
                }
                Button {
                    viewModel.onHappyButton()
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    MoodButton(mood: .happy)
                }
            }
        }
        .navigationTitle("Current mood")
    }
}

struct MoodButton: View {
    let mood: Mood

    var body: some View {
        Text(String("\(mood)"))
            .font(Font.system(size: 40))
            .padding()
            .background(Color.accentColor)
            .cornerRadius(10)
    }
}

// struct MoodDialogViewPreviews: PreviewProvider {
//    static var previews: some View {
//        MoodDialogView(mood: .constant(.neutral))
//    }
// }
