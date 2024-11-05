import Foundation

struct Remedy: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let symptoms: [String]
    let betterConditions: [String]
    let worseConditions: [String]
    let dosage: String
}

struct Child: Identifiable {
    let id = UUID()
    let name: String
    let dateOfBirth: Date
    var remedyHistory: [RemedyHistory]
}

struct RemedyHistory: Identifiable {
    let id = UUID()
    let remedyName: String
    let dateAdministered: Date
    let symptoms: [String]
    let notes: String?
}

struct UserProfile {
    var isSubscribed: Bool
    var children: [Child]
    
    var canAddMoreChildren: Bool {
        if isSubscribed {
            return children.count < 10
        }
        return children.count < 1
    }
} 