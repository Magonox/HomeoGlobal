import Foundation

struct Symptom: Identifiable {
    let id = UUID()
    let description: String
    let options: [SymptomOption]
}

struct SymptomOption: Identifiable {
    let id: UUID
    let description: String
    let nextSymptom: Symptom? // For follow-up questions
    let remedy: HomeopathicRemedy? // If this option leads to a remedy
    
    // Add initializer to make all parameters optional except description
    init(description: String, nextSymptom: Symptom? = nil, remedy: HomeopathicRemedy? = nil) {
        self.id = UUID()
        self.description = description
        self.nextSymptom = nextSymptom
        self.remedy = remedy
    }
}

struct HomeopathicRemedy: Identifiable {
    let id = UUID()
    let name: String
    let potency: String
    let dosage: String
    let description: String
    let keyIndications: [String]
    let warnings: [String]
}

enum CategoryQuestionnaire {
    static let commonCold: [Symptom] = [
        Symptom(
            description: "How did the cold start?",
            options: [
                SymptomOption(
                    description: "Sudden onset after exposure to cold dry wind",
                    remedy: HomeopathicRemedy(
                        name: "Aconitum Napellus",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Best for sudden onset colds with anxiety",
                        keyIndications: [
                            "Sudden onset after cold exposure",
                            "High fever",
                            "Anxiety and restlessness"
                        ],
                        warnings: ["Reduce dosage as symptoms improve"]
                    )
                ),
                SymptomOption(
                    description: "Gradual onset with watery discharge",
                    remedy: HomeopathicRemedy(
                        name: "Natrum Muriaticum",
                        potency: "30C",
                        dosage: "3-5 pellets 3 times daily",
                        description: "Effective for colds with clear, watery discharge",
                        keyIndications: [
                            "Clear, watery nasal discharge",
                            "Loss of taste and smell",
                            "Craving for salt"
                        ],
                        warnings: ["Take away from meals"]
                    )
                )
            ]
        )
    ]
    
    static let cough: [Symptom] = [
        Symptom(
            description: "What type of cough do you have?",
            options: [
                SymptomOption(
                    description: "Dry, spasmodic cough worse at night",
                    remedy: HomeopathicRemedy(
                        name: "Drosera",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Effective for spasmodic coughing fits",
                        keyIndications: [
                            "Barking cough",
                            "Worse after midnight",
                            "Cough with vomiting"
                        ],
                        warnings: ["Consult physician if symptoms persist"]
                    )
                ),
                SymptomOption(
                    description: "Wet cough with thick yellow mucus",
                    remedy: HomeopathicRemedy(
                        name: "Pulsatilla",
                        potency: "30C",
                        dosage: "3-5 pellets 3 times daily",
                        description: "Suitable for productive coughs with yellow discharge",
                        keyIndications: [
                            "Yellow-green discharge",
                            "Better in open air",
                            "Worse in warm rooms"
                        ],
                        warnings: ["Not suitable for high fever"]
                    )
                )
            ]
        )
    ]
} 