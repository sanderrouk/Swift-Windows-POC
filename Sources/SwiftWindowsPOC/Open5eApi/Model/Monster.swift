struct Monster: Decodable {

    enum MonsterSize: String, Decodable {

        case gargantuan = "Gargantuan"
        case huge = "Huge"
        case large = "Large"
        case medium = "Medium"
        case small = "Small"
        case tiny = "Tiny"
    }

    let name: String
    let size: MonsterSize
}