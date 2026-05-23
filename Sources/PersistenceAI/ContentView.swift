// ContentView.swift

import SwiftUI

struct ContentView: View {

    @State private var prompt = ""

    @State private var output =
    "PersistenceAI Pro Ready"

    var body: some View {

        VStack(spacing: 20) {

            Text("PersistenceAI Pro")
                .font(.largeTitle)
                .bold()

            Text("AI That Builds")
                .foregroundColor(.gray)

            TextField(
                "Ask PersistenceAI...",
                text: $prompt
            )
            .textFieldStyle(.roundedBorder)

            Button("Run Agent") {

                Task {
                    await runAI()
                }
            }

            ScrollView {

                Text(output)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding()
            }

            Spacer()
        }
        .padding()
        .frame(
            minWidth: 700,
            minHeight: 500
        )
    }

    func runAI() async {

        do {

            let result = try await
            APIService.shared.sendPrompt(prompt)

            output = result.response

        } catch {

            output = error.localizedDescription
        }
    }
}
