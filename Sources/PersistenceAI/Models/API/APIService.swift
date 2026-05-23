// API/APIService.swift

import Foundation

class APIService {

    static let shared = APIService()

    func sendPrompt(
        _ prompt: String
    ) async throws -> ChatResponse {

        guard let url = URL(
            string: "http://127.0.0.1:8000/chat"
        ) else {
            throw URLError(.badURL)
        }

        let body = [
            "message": prompt
        ]

        var request = URLRequest(url: url)

        request.httpMethod = "POST"

        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )

        request.httpBody = try JSONSerialization.data(
            withJSONObject: body
        )

        let (data, _) = try await URLSession.shared.data(
            for: request
        )

        return try JSONDecoder().decode(
            ChatResponse.self,
            from: data
        )
    }
}
