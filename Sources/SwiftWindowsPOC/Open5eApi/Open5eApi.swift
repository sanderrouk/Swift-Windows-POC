import Foundation
import FoundationNetworking

// Please do not code review this :D, this is POC

final class Open5eApi {

    private let baseUrl = URL(string: "https://api.open5e.com/monsters/")!

    func getMonsters(onSuccess: @escaping ([Monster]) -> Void) {
        getMonsterData(onSuccess: { data in
            do {
                let monsters = try JSONDecoder().decode(MonsterPayload.self, from: data)
                onSuccess(monsters.monsters)
            } catch {
                print(error.localizedDescription)
            }
        }, onFail: { error in
            print(error.localizedDescription)
        })
    }

    private func getMonsterData(onSuccess: @escaping (Data) -> Void, onFail: @escaping (Error) -> Void) {
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error -> Void in
            if let data = data {
                onSuccess(data)
            }

            if let error = error {
                onFail(error)
            }
        }

        task.resume()
    }
}

private struct MonsterPayload: Decodable {

    let count: Int
    let monsters: [Monster]

    enum CodingKeys: String, CodingKey {

        case count
        case monsters = "results"
    }
}