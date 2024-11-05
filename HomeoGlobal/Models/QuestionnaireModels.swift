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
            description: "How did your cold symptoms begin?",
            options: [
                SymptomOption(
                    description: "Sudden onset after cold exposure with anxiety",
                    remedy: HomeopathicRemedy(
                        name: "Aconitum Napellus",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Best for sudden onset colds with anxiety and restlessness",
                        keyIndications: [
                            "Sudden onset after cold exposure",
                            "High fever with anxiety",
                            "Dry cough and thirst",
                            "Symptoms worse at night and in cold wind"
                        ],
                        warnings: ["Reduce dosage as symptoms improve", "Seek medical attention if fever persists"]
                    )
                ),
                SymptomOption(
                    description: "Watery discharge with frequent sneezing",
                    remedy: HomeopathicRemedy(
                        name: "Allium Cepa",
                        potency: "30C",
                        dosage: "3-5 pellets every 3-4 hours",
                        description: "Excellent for colds with watery discharge and sneezing",
                        keyIndications: [
                            "Profuse watery nasal discharge",
                            "Frequent sneezing",
                            "Burning sensation in nose",
                            "Eyes watering but not burning"
                        ],
                        warnings: ["Reduce frequency as symptoms improve"]
                    )
                ),
                SymptomOption(
                    description: "Thick, yellow-green discharge with loss of smell",
                    remedy: HomeopathicRemedy(
                        name: "Pulsatilla",
                        potency: "30C",
                        dosage: "3-5 pellets 3 times daily",
                        description: "Effective for thick, yellow-green discharges",
                        keyIndications: [
                            "Thick yellow-green discharge",
                            "Loss of smell and taste",
                            "Better in open air",
                            "Worse in warm rooms"
                        ],
                        warnings: ["Not suitable for high fever"]
                    )
                )
            ]
        ),
        Symptom(
            description: "What time of day are your symptoms worst?",
            options: [
                SymptomOption(
                    description: "Worse in morning with violent sneezing",
                    remedy: HomeopathicRemedy(
                        name: "Nux Vomica",
                        potency: "30C",
                        dosage: "3-5 pellets twice daily",
                        description: "Particularly effective for morning symptoms",
                        keyIndications: [
                            "Stuffed nose in morning",
                            "Violent sneezing",
                            "Irritability",
                            "Chilliness"
                        ],
                        warnings: ["Avoid coffee during treatment"]
                    )
                ),
                SymptomOption(
                    description: "Worse in evening with burning eyes",
                    remedy: HomeopathicRemedy(
                        name: "Euphrasia",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Best for colds affecting the eyes",
                        keyIndications: [
                            "Burning, watering eyes",
                            "Mild nasal discharge",
                            "Worse in evening",
                            "Better in open air"
                        ],
                        warnings: ["Consult if eye symptoms persist"]
                    )
                )
            ]
        ),
        Symptom(
            description: "What type of nasal discharge do you have?",
            options: [
                SymptomOption(
                    description: "Thick, green discharge with bad breath",
                    remedy: HomeopathicRemedy(
                        name: "Mercurius Solubilis",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Effective for thick, infected-looking discharge",
                        keyIndications: [
                            "Thick green nasal discharge",
                            "Bad breath",
                            "Excessive salivation",
                            "Worse at night",
                            "Sensitive to both hot and cold"
                        ],
                        warnings: [
                            "Seek medical attention if symptoms persist",
                            "Not for long-term use"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Thick, stringy, yellow mucus",
                    remedy: HomeopathicRemedy(
                        name: "Kali Bichromicum",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Specific for thick, stringy mucus",
                        keyIndications: [
                            "Stringy, yellow-green mucus",
                            "Post-nasal drip",
                            "Sinus pain at specific points",
                            "Better from heat",
                            "Worse in morning"
                        ],
                        warnings: [
                            "Consult doctor if sinus pain severe",
                            "Not for acute infections"
                        ]
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
                            "Barking, spasmodic cough",
                            "Worse after midnight",
                            "Cough with vomiting",
                            "Tickling in larynx"
                        ],
                        warnings: ["Seek medical attention if breathing difficulty occurs"]
                    )
                ),
                SymptomOption(
                    description: "Loose cough with yellow mucus",
                    remedy: HomeopathicRemedy(
                        name: "Antimonium Tartaricum",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Effective for loose, rattling coughs",
                        keyIndications: [
                            "Rattling in chest",
                            "Difficulty expectorating",
                            "Drowsiness",
                            "Worse in warm rooms"
                        ],
                        warnings: ["Not for long-term use", "Consult doctor if symptoms persist"]
                    )
                ),
                SymptomOption(
                    description: "Hard, dry cough with chest pain",
                    remedy: HomeopathicRemedy(
                        name: "Bryonia",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Best for dry coughs with chest pain",
                        keyIndications: [
                            "Dry, painful cough",
                            "Worse with movement",
                            "Thirst for large quantities",
                            "Better with pressure"
                        ],
                        warnings: ["Seek medical attention if chest pain is severe"]
                    )
                )
            ]
        ),
        Symptom(
            description: "What other cough symptoms do you have?",
            options: [
                SymptomOption(
                    description: "Loose, rattling cough with mucus",
                    remedy: HomeopathicRemedy(
                        name: "Hepar Sulphuris",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Effective for loose coughs with thick mucus",
                        keyIndications: [
                            "Rattling cough with thick mucus",
                            "Worse from cold air",
                            "Better from warmth",
                            "Oversensitive to pain",
                            "Irritability with cough"
                        ],
                        warnings: [
                            "Seek medical attention if mucus is blood-tinged",
                            "Not for prolonged use"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Barking, croup-like cough",
                    remedy: HomeopathicRemedy(
                        name: "Spongia Tosta",
                        potency: "30C",
                        dosage: "3-5 pellets every 2-3 hours",
                        description: "Specific for croup-like, barking coughs",
                        keyIndications: [
                            "Barking, seal-like cough",
                            "Worse before midnight",
                            "Better from warm drinks",
                            "Difficulty breathing",
                            "Worse lying down"
                        ],
                        warnings: [
                            "Seek immediate care for breathing difficulties",
                            "Not for chronic cough"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Tickly, irritating cough",
                    remedy: HomeopathicRemedy(
                        name: "Phosphorus",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Good for tickly, irritating coughs",
                        keyIndications: [
                            "Tickling sensation in throat",
                            "Worse from talking",
                            "Better from cold drinks",
                            "Cough worse in evening",
                            "Hoarseness with cough"
                        ],
                        warnings: [
                            "Not for coughs with fever",
                            "Consult doctor if persists"
                        ]
                    )
                )
            ]
        ),
        Symptom(
            description: "Do you have any specific cough triggers?",
            options: [
                SymptomOption(
                    description: "Tickly cough worse at night and from cold air",
                    remedy: HomeopathicRemedy(
                        name: "Rumex Crispus",
                        potency: "30C",
                        dosage: "3-5 pellets every 3-4 hours",
                        description: "Excellent for tickly coughs triggered by cold air",
                        keyIndications: [
                            "Tickling sensation in throat",
                            "Worse from cold air",
                            "Worse at night",
                            "Must cover mouth in cold air",
                            "Constant tickling behind sternum"
                        ],
                        warnings: [
                            "Seek medical attention if breathing affected",
                            "Not for productive coughs"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Dry cough with hoarseness and rawness",
                    remedy: HomeopathicRemedy(
                        name: "Causticum",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Effective for dry, hoarse coughs",
                        keyIndications: [
                            "Hoarse, raw feeling",
                            "Cannot drink while speaking",
                            "Better from sips of cold water",
                            "Worse in dry cold weather",
                            "Cough with involuntary urination"
                        ],
                        warnings: [
                            "Consult doctor if hoarseness persists",
                            "Not for wet coughs"
                        ]
                    )
                )
            ]
        )
    ]

    static let fever: [Symptom] = [
        Symptom(
            description: "How did the fever start and what are the main symptoms?",
            options: [
                SymptomOption(
                    description: "Sudden high fever with anxiety and restlessness",
                    remedy: HomeopathicRemedy(
                        name: "Aconitum Napellus",
                        potency: "30C",
                        dosage: "3-5 pellets every 2-3 hours",
                        description: "Best for sudden onset fevers with anxiety",
                        keyIndications: [
                            "Sudden high fever after cold exposure",
                            "Intense thirst",
                            "Anxiety and restlessness",
                            "Hot, dry skin",
                            "Symptoms worse at midnight"
                        ],
                        warnings: [
                            "Seek immediate medical attention if fever is very high",
                            "Reduce dosage as symptoms improve"
                        ]
                    )
                ),
                SymptomOption(
                    description: "High fever with extreme fatigue and body aches",
                    remedy: HomeopathicRemedy(
                        name: "Gelsemium",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Effective for flu-like fevers with fatigue",
                        keyIndications: [
                            "Gradual onset fever",
                            "Extreme fatigue and weakness",
                            "Heavy, drooping eyelids",
                            "Chills up and down spine",
                            "No thirst during fever"
                        ],
                        warnings: ["Monitor hydration levels", "Not for prolonged high fevers"]
                    )
                ),
                SymptomOption(
                    description: "Fever with alternating hot and cold sensations",
                    remedy: HomeopathicRemedy(
                        name: "Belladonna",
                        potency: "30C",
                        dosage: "3-5 pellets every 2-3 hours",
                        description: "Excellent for high fevers with red face and hot skin",
                        keyIndications: [
                            "Sudden high fever",
                            "Face red and hot",
                            "Cold extremities",
                            "Throbbing headache",
                            "Dilated pupils"
                        ],
                        warnings: [
                            "Seek medical attention if fever persists",
                            "Not for prolonged use"
                        ]
                    )
                )
            ]
        ),
        Symptom(
            description: "What accompanying symptoms do you have with the fever?",
            options: [
                SymptomOption(
                    description: "Fever with profuse sweating and thirst",
                    remedy: HomeopathicRemedy(
                        name: "Arsenicum Album",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Suitable for fevers with anxiety and restlessness",
                        keyIndications: [
                            "Fever with chills",
                            "Intense thirst for small sips",
                            "Anxiety and restlessness",
                            "Worse between 1-2 AM",
                            "Exhaustion but can't rest"
                        ],
                        warnings: [
                            "Monitor hydration levels",
                            "Seek medical attention if symptoms worsen"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Fever with body aches and bone pain",
                    remedy: HomeopathicRemedy(
                        name: "Eupatorium Perfoliatum",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Effective for fevers with intense body aches",
                        keyIndications: [
                            "Deep bone pain",
                            "Intense body aches",
                            "Thirst for cold water",
                            "Worse in morning",
                            "Chills running up and down back"
                        ],
                        warnings: [
                            "Not for prolonged use",
                            "Consult doctor if pain is severe"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Low-grade fever with weakness and mild symptoms",
                    remedy: HomeopathicRemedy(
                        name: "Ferrum Phosphoricum",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Good for early stages of fever",
                        keyIndications: [
                            "Mild fever",
                            "Gradual onset",
                            "Flushed face",
                            "Weakness",
                            "Better with cold applications"
                        ],
                        warnings: [
                            "Monitor temperature",
                            "Seek medical attention if fever increases significantly"
                        ]
                    )
                )
            ]
        )
    ]

    static let allergies: [Symptom] = [
        Symptom(
            description: "What are your main allergy symptoms?",
            options: [
                SymptomOption(
                    description: "Watery eyes and nose with frequent sneezing",
                    remedy: HomeopathicRemedy(
                        name: "Allium Cepa",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Excellent for hay fever with watery discharge",
                        keyIndications: [
                            "Watery eyes and nose",
                            "Frequent violent sneezing",
                            "Burning nasal discharge",
                            "Better in open air",
                            "Worse in warm rooms"
                        ],
                        warnings: [
                            "Reduce dosage as symptoms improve",
                            "Consult doctor if symptoms persist"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Burning eyes with bland nasal discharge",
                    remedy: HomeopathicRemedy(
                        name: "Euphrasia",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Specific for eye-related allergy symptoms",
                        keyIndications: [
                            "Burning, watering eyes",
                            "Mild nasal discharge",
                            "Eyes sensitive to light",
                            "Worse in evening",
                            "Better in open air"
                        ],
                        warnings: ["Seek medical attention if eye symptoms worsen"]
                    )
                ),
                SymptomOption(
                    description: "Blocked nose with loss of smell",
                    remedy: HomeopathicRemedy(
                        name: "Natrum Muriaticum",
                        potency: "30C",
                        dosage: "3-5 pellets twice daily",
                        description: "Effective for chronic allergies",
                        keyIndications: [
                            "Loss of smell and taste",
                            "Clear nasal discharge",
                            "Sneezing in morning",
                            "Craving for salt",
                            "Worse from sun exposure"
                        ],
                        warnings: ["Not for acute allergic reactions"]
                    )
                )
            ]
        ),
        Symptom(
            description: "Do you have any skin reactions with your allergies?",
            options: [
                SymptomOption(
                    description: "Itchy, burning skin rash",
                    remedy: HomeopathicRemedy(
                        name: "Apis Mellifica",
                        potency: "30C",
                        dosage: "3-5 pellets every 2-3 hours",
                        description: "Best for allergic reactions with swelling",
                        keyIndications: [
                            "Swelling with stinging pain",
                            "Red, hot skin",
                            "Better with cold applications",
                            "Worse from heat",
                            "No thirst"
                        ],
                        warnings: [
                            "Seek immediate medical attention for severe allergic reactions",
                            "Not for known bee allergies"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Itchy hives that move around",
                    remedy: HomeopathicRemedy(
                        name: "Urtica Urens",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Specific for hives and urticaria",
                        keyIndications: [
                            "Burning, stinging hives",
                            "Itching worse from touch",
                            "Rash that moves location",
                            "Worse from cold air",
                            "Better from warm applications"
                        ],
                        warnings: ["Seek medical help if breathing affected"]
                    )
                ),
                SymptomOption(
                    description: "Dry, itchy skin with anxiety",
                    remedy: HomeopathicRemedy(
                        name: "Arsenicum Album",
                        potency: "30C",
                        dosage: "3-5 pellets three times daily",
                        description: "For allergies with anxiety and restlessness",
                        keyIndications: [
                            "Burning, itching skin",
                            "Anxiety and restlessness",
                            "Worse at night (1-2 AM)",
                            "Better from warm applications",
                            "Thirsty for small sips"
                        ],
                        warnings: [
                            "Not for severe allergic reactions",
                            "Consult doctor if symptoms persist"
                        ]
                    )
                )
            ]
        ),
        Symptom(
            description: "Do you have any respiratory symptoms?",
            options: [
                SymptomOption(
                    description: "Wheezing with anxiety",
                    remedy: HomeopathicRemedy(
                        name: "Phosphorus",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Helpful for respiratory allergies",
                        keyIndications: [
                            "Tight chest with cough",
                            "Worse in cold air",
                            "Better from cold drinks",
                            "Anxiety about health",
                            "Desire for company"
                        ],
                        warnings: [
                            "Not a replacement for rescue inhalers",
                            "Seek immediate help for breathing difficulties"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Suffocating feeling with dry cough",
                    remedy: HomeopathicRemedy(
                        name: "Sambucus Nigra",
                        potency: "30C",
                        dosage: "3-5 pellets every 3-4 hours",
                        description: "Effective for nighttime allergic symptoms",
                        keyIndications: [
                            "Suffocating feeling on waking",
                            "Dry, barking cough",
                            "Worse after midnight",
                            "Nose blocked",
                            "Better sitting up"
                        ],
                        warnings: [
                            "Emergency medical care for severe breathing problems",
                            "Not for long-term use"
                        ]
                    )
                )
            ]
        )
    ]

    static let digestive: [Symptom] = [
        Symptom(
            description: "What type of digestive issue are you experiencing?",
            options: [
                SymptomOption(
                    description: "Nausea and vomiting with anxiety",
                    remedy: HomeopathicRemedy(
                        name: "Arsenicum Album",
                        potency: "30C",
                        dosage: "3-5 pellets every 2 hours",
                        description: "Effective for gastric issues with anxiety",
                        keyIndications: [
                            "Burning pain in stomach",
                            "Nausea and vomiting",
                            "Anxiety and restlessness",
                            "Thirst for small sips",
                            "Worse 1-2 AM"
                        ],
                        warnings: [
                            "Monitor hydration levels",
                            "Seek medical attention if symptoms persist"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Indigestion from rich foods",
                    remedy: HomeopathicRemedy(
                        name: "Nux Vomica",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Best for overindulgence and indigestion",
                        keyIndications: [
                            "Heartburn and acid reflux",
                            "Bloating after meals",
                            "Irritability",
                            "Constipation",
                            "Worse from coffee/alcohol"
                        ],
                        warnings: [
                            "Avoid coffee during treatment",
                            "Not for severe stomach pain"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Diarrhea with cramping",
                    remedy: HomeopathicRemedy(
                        name: "Podophyllum",
                        potency: "30C",
                        dosage: "3-5 pellets after each loose stool",
                        description: "Specific for diarrhea with gurgling",
                        keyIndications: [
                            "Explosive diarrhea",
                            "Gurgling in abdomen",
                            "Worse in morning",
                            "Worse after eating/drinking",
                            "Exhaustion after stool"
                        ],
                        warnings: [
                            "Stay hydrated",
                            "Seek medical help if blood in stool"
                        ]
                    )
                )
            ]
        ),
        Symptom(
            description: "Are there any specific triggers or timing?",
            options: [
                SymptomOption(
                    description: "Symptoms worse from cold drinks/food",
                    remedy: HomeopathicRemedy(
                        name: "Colocynthis",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Excellent for cramping pains",
                        keyIndications: [
                            "Sharp, cramping pains",
                            "Better from pressure",
                            "Better from warmth",
                            "Worse from anger",
                            "Worse from cold food/drink"
                        ],
                        warnings: ["Not for severe abdominal pain"]
                    )
                ),
                SymptomOption(
                    description: "Motion sickness and nausea",
                    remedy: HomeopathicRemedy(
                        name: "Cocculus Indicus",
                        potency: "30C",
                        dosage: "3-5 pellets every 2-3 hours",
                        description: "Specific for motion sickness",
                        keyIndications: [
                            "Nausea from motion",
                            "Dizziness",
                            "Empty feeling in stomach",
                            "Worse from lack of sleep",
                            "Worse from sight/smell of food"
                        ],
                        warnings: ["Take before travel for prevention"]
                    )
                ),
                SymptomOption(
                    description: "Colic with irritability",
                    remedy: HomeopathicRemedy(
                        name: "Chamomilla",
                        potency: "30C",
                        dosage: "3-5 pellets every 2 hours",
                        description: "Effective for colic and irritability",
                        keyIndications: [
                            "Severe colic pains",
                            "Extreme irritability",
                            "Better from warm applications",
                            "One cheek red, one pale",
                            "Worse in evening"
                        ],
                        warnings: [
                            "Consult pediatrician for infant colic",
                            "Not for severe abdominal pain"
                        ]
                    )
                )
            ]
        ),
        Symptom(
            description: "Any chronic digestive issues?",
            options: [
                SymptomOption(
                    description: "Chronic constipation",
                    remedy: HomeopathicRemedy(
                        name: "Lycopodium",
                        potency: "30C",
                        dosage: "3-5 pellets twice daily",
                        description: "Helpful for chronic digestive issues",
                        keyIndications: [
                            "Bloating after meals",
                            "Better from warm drinks",
                            "Worse 4-8 PM",
                            "Gas and constipation",
                            "Craving for sweets"
                        ],
                        warnings: [
                            "Not for acute conditions",
                            "Consult doctor for chronic issues"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Acid reflux and heartburn",
                    remedy: HomeopathicRemedy(
                        name: "Carbo Vegetabilis",
                        potency: "30C",
                        dosage: "3-5 pellets three times daily",
                        description: "Good for bloating and gas",
                        keyIndications: [
                            "Burning in stomach",
                            "Excessive gas",
                            "Better from burping",
                            "Worse from rich foods",
                            "Desire to be fanned"
                        ],
                        warnings: ["Seek medical help for chronic heartburn"]
                    )
                )
            ]
        ),
        Symptom(
            description: "Are you experiencing nausea or vomiting?",
            options: [
                SymptomOption(
                    description: "Persistent nausea with clean tongue",
                    remedy: HomeopathicRemedy(
                        name: "Ipecacuanha",
                        potency: "30C",
                        dosage: "3-5 pellets every 2 hours",
                        description: "Specific for persistent nausea and vomiting",
                        keyIndications: [
                            "Constant nausea not relieved by vomiting",
                            "Clean tongue despite nausea",
                            "Excessive salivation",
                            "Better from fresh air",
                            "Worse from warmth and movement"
                        ],
                        warnings: [
                            "Monitor hydration levels",
                            "Seek medical attention if vomiting persists"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Violent vomiting with cold sweat",
                    remedy: HomeopathicRemedy(
                        name: "Veratrum Album",
                        potency: "30C",
                        dosage: "3-5 pellets every 2 hours",
                        description: "For severe vomiting with coldness",
                        keyIndications: [
                            "Violent vomiting and diarrhea",
                            "Cold sweat on forehead",
                            "Extreme weakness",
                            "Craving cold drinks",
                            "Better from lying still"
                        ],
                        warnings: [
                            "Emergency care for severe dehydration",
                            "Not for prolonged use"
                        ]
                    )
                )
            ]
        )
    ]

    static let firstAid: [Symptom] = [
        Symptom(
            description: "What type of injury are you treating?",
            options: [
                SymptomOption(
                    description: "Bruising or injury from falls/blows",
                    remedy: HomeopathicRemedy(
                        name: "Arnica Montana",
                        potency: "30C",
                        dosage: "3-5 pellets every 2-3 hours",
                        description: "First-line remedy for injuries and trauma",
                        keyIndications: [
                            "Bruising and soreness",
                            "Trauma from falls or blows",
                            "Muscle pain and stiffness",
                            "Fear of being touched",
                            "Feels better lying down"
                        ],
                        warnings: [
                            "Seek medical attention for severe injuries",
                            "Do not use on open wounds"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Sprains and strains",
                    remedy: HomeopathicRemedy(
                        name: "Ruta Graveolens",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Excellent for ligament and tendon injuries",
                        keyIndications: [
                            "Sprains and strains",
                            "Injured tendons/ligaments",
                            "Bruised bones",
                            "Worse from cold and damp",
                            "Better from movement"
                        ],
                        warnings: ["Consult doctor if pain persists"]
                    )
                ),
                SymptomOption(
                    description: "Cuts and minor wounds",
                    remedy: HomeopathicRemedy(
                        name: "Calendula",
                        potency: "30C",
                        dosage: "3-5 pellets every 3-4 hours",
                        description: "Promotes healing of cuts and wounds",
                        keyIndications: [
                            "Clean cuts and scrapes",
                            "Promotes healing",
                            "Prevents infection",
                            "Reduces scarring",
                            "Soothes pain"
                        ],
                        warnings: [
                            "Clean wound thoroughly",
                            "Seek medical help for deep cuts"
                        ]
                    )
                )
            ]
        ),
        Symptom(
            description: "Are there any specific symptoms with the injury?",
            options: [
                SymptomOption(
                    description: "Stinging, burning pain",
                    remedy: HomeopathicRemedy(
                        name: "Hypericum",
                        potency: "30C",
                        dosage: "3-5 pellets every 2-3 hours",
                        description: "For injuries to nerve-rich areas",
                        keyIndications: [
                            "Nerve pain",
                            "Shooting pains",
                            "Injuries to fingers/toes",
                            "Crushing injuries",
                            "Better from rest"
                        ],
                        warnings: [
                            "Seek immediate care for severe injuries",
                            "Not for open wounds"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Swelling with stinging pain",
                    remedy: HomeopathicRemedy(
                        name: "Apis Mellifica",
                        potency: "30C",
                        dosage: "3-5 pellets every 2 hours",
                        description: "Best for swelling and insect stings",
                        keyIndications: [
                            "Swelling with stinging pain",
                            "Better from cold applications",
                            "Worse from heat",
                            "Puffy, shiny skin",
                            "No thirst"
                        ],
                        warnings: [
                            "Seek immediate help for allergic reactions",
                            "Not for known bee allergies"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Muscle strain with stiffness",
                    remedy: HomeopathicRemedy(
                        name: "Rhus Toxicodendron",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Effective for strains and sprains",
                        keyIndications: [
                            "Stiffness and pain",
                            "Better from movement",
                            "Worse when starting to move",
                            "Better from warm applications",
                            "Worse in cold/damp weather"
                        ],
                        warnings: [
                            "Not for open wounds",
                            "Consult doctor if pain persists"
                        ]
                    )
                )
            ]
        ),
        Symptom(
            description: "Any emotional symptoms after injury?",
            options: [
                SymptomOption(
                    description: "Shock and fear after injury",
                    remedy: HomeopathicRemedy(
                        name: "Aconite",
                        potency: "30C",
                        dosage: "3-5 pellets every 15-30 minutes",
                        description: "For shock and emotional trauma",
                        keyIndications: [
                            "Mental shock after injury",
                            "Fear and anxiety",
                            "Panic attacks",
                            "Restlessness",
                            "Racing heart"
                        ],
                        warnings: [
                            "Seek immediate care for severe trauma",
                            "Not for physical injuries alone"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Emotional distress with trembling",
                    remedy: HomeopathicRemedy(
                        name: "Gelsemium",
                        potency: "30C",
                        dosage: "3-5 pellets every 2-3 hours",
                        description: "For anticipatory anxiety and trembling",
                        keyIndications: [
                            "Trembling from shock",
                            "Weakness after fright",
                            "Dizziness",
                            "Mental dullness",
                            "Better from fresh air"
                        ],
                        warnings: ["Seek professional help for severe trauma"]
                    )
                )
            ]
        )
    ]

    // Add this new static property to the CategoryQuestionnaire enum
    static let soreThroat: [Symptom] = [
        Symptom(
            description: "What type of sore throat are you experiencing?",
            options: [
                SymptomOption(
                    description: "Burning, raw throat with restlessness",
                    remedy: HomeopathicRemedy(
                        name: "Aconite",
                        potency: "30C",
                        dosage: "3-5 pellets every 2 hours",
                        description: "Best for sudden onset sore throat",
                        keyIndications: [
                            "Sudden onset after cold exposure",
                            "Burning, dry sensation",
                            "Anxiety and restlessness",
                            "Worse at night",
                            "High fever may be present"
                        ],
                        warnings: [
                            "Seek medical attention if fever is high",
                            "Not for chronic sore throats"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Painful throat with difficulty swallowing",
                    remedy: HomeopathicRemedy(
                        name: "Belladonna",
                        potency: "30C",
                        dosage: "3-5 pellets every 3 hours",
                        description: "For bright red, inflamed throat",
                        keyIndications: [
                            "Bright red throat",
                            "Sudden intense pain",
                            "Right side often worse",
                            "Throbbing sensation",
                            "High fever possible"
                        ],
                        warnings: [
                            "Consult doctor if severe pain persists",
                            "Monitor fever closely"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Throat pain with excessive saliva",
                    remedy: HomeopathicRemedy(
                        name: "Mercurius Solubilis",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Effective for throat infections with salivation",
                        keyIndications: [
                            "Excessive salivation",
                            "Bad breath",
                            "Worse at night",
                            "Sweating without relief",
                            "Metallic taste in mouth"
                        ],
                        warnings: [
                            "Not for long-term use",
                            "Seek medical attention if symptoms worsen"
                        ]
                    )
                )
            ]
        ),
        Symptom(
            description: "Are there any specific characteristics of your throat pain?",
            options: [
                SymptomOption(
                    description: "Sharp, splinter-like pain",
                    remedy: HomeopathicRemedy(
                        name: "Hepar Sulphuris",
                        potency: "30C",
                        dosage: "3-5 pellets every 3-4 hours",
                        description: "For sharp throat pain with sensitivity",
                        keyIndications: [
                            "Splinter-like pain",
                            "Extremely sensitive to cold air",
                            "Better from warm drinks",
                            "Irritability with pain",
                            "Tendency to pus formation"
                        ],
                        warnings: [
                            "Seek medical help if pus is present",
                            "Not for chronic conditions"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Left-sided sore throat with weakness",
                    remedy: HomeopathicRemedy(
                        name: "Lachesis",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Specific for left-sided throat pain",
                        keyIndications: [
                            "Left side worse",
                            "Worse after sleep",
                            "Cannot bear throat touch",
                            "Purple/dark red color",
                            "Empty swallowing painful"
                        ],
                        warnings: [
                            "Not for children under 12",
                            "Consult doctor if condition worsens"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Throat pain better from cold drinks",
                    remedy: HomeopathicRemedy(
                        name: "Phosphorus",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "For sore throats relieved by cold drinks",
                        keyIndications: [
                            "Better from cold drinks",
                            "Hoarseness with pain",
                            "Burning sensation",
                            "Worse from talking",
                            "Desire for cold food/drinks"
                        ],
                        warnings: [
                            "Monitor voice strain",
                            "Seek help if hoarseness persists"
                        ]
                    )
                )
            ]
        )
    ]

    // Add this new static property to the CategoryQuestionnaire enum
    static let stressAnxiety: [Symptom] = [
        Symptom(
            description: "What type of anxiety are you experiencing?",
            options: [
                SymptomOption(
                    description: "Sudden panic with fear and restlessness",
                    remedy: HomeopathicRemedy(
                        name: "Aconite",
                        potency: "30C",
                        dosage: "3-5 pellets every 30 minutes during acute anxiety",
                        description: "Excellent for sudden panic attacks and acute anxiety",
                        keyIndications: [
                            "Sudden intense fear",
                            "Racing heart",
                            "Fear of death",
                            "Restlessness and agitation",
                            "Anxiety worse at night"
                        ],
                        warnings: [
                            "Seek immediate help for severe panic attacks",
                            "Not for long-term anxiety"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Anticipatory anxiety with trembling",
                    remedy: HomeopathicRemedy(
                        name: "Gelsemium",
                        potency: "30C",
                        dosage: "3-5 pellets three times daily",
                        description: "Best for anticipatory anxiety and stage fright",
                        keyIndications: [
                            "Trembling and weakness",
                            "Diarrhea from anxiety",
                            "Mental dullness",
                            "Performance anxiety",
                            "Better alone"
                        ],
                        warnings: [
                            "Not for severe depression",
                            "Consult healthcare provider for chronic anxiety"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Anxiety with perfectionism and irritability",
                    remedy: HomeopathicRemedy(
                        name: "Arsenicum Album",
                        potency: "30C",
                        dosage: "3-5 pellets twice daily",
                        description: "For anxiety with perfectionism and restlessness",
                        keyIndications: [
                            "Perfectionism and control issues",
                            "Restlessness with exhaustion",
                            "Fear of being alone",
                            "Worse 1-2 AM",
                            "Need for order and cleanliness"
                        ],
                        warnings: [
                            "Not for severe mental health issues",
                            "Seek professional help if symptoms persist"
                        ]
                    )
                )
            ]
        ),
        Symptom(
            description: "How does stress affect your sleep and mood?",
            options: [
                SymptomOption(
                    description: "Insomnia from mental activity",
                    remedy: HomeopathicRemedy(
                        name: "Coffea Cruda",
                        potency: "30C",
                        dosage: "3-5 pellets before bedtime",
                        description: "Helpful for mental overactivity and insomnia",
                        keyIndications: [
                            "Racing thoughts at night",
                            "Oversensitive to everything",
                            "Mental hyperactivity",
                            "Sleeplessness from joy",
                            "Ideas flowing rapidly"
                        ],
                        warnings: [
                            "Avoid coffee when taking remedy",
                            "Not for chronic insomnia"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Anxiety with hormonal changes",
                    remedy: HomeopathicRemedy(
                        name: "Ignatia",
                        potency: "30C",
                        dosage: "3-5 pellets three times daily",
                        description: "For emotional sensitivity and mood swings",
                        keyIndications: [
                            "Emotional ups and downs",
                            "Sighing and yawning",
                            "Sensation of lump in throat",
                            "Better from distraction",
                            "Paradoxical symptoms"
                        ],
                        warnings: [
                            "Not for severe depression",
                            "Seek professional help for ongoing issues"
                        ]
                    )
                )
            ]
        ),
        Symptom(
            description: "Do you have any physical symptoms with your anxiety?",
            options: [
                SymptomOption(
                    description: "Heart palpitations with anxiety",
                    remedy: HomeopathicRemedy(
                        name: "Argentum Nitricum",
                        potency: "30C",
                        dosage: "3-5 pellets three times daily",
                        description: "For anxiety with physical symptoms",
                        keyIndications: [
                            "Hurried feeling",
                            "Craving for sweets",
                            "Fear of heights",
                            "Claustrophobia",
                            "Diarrhea from anticipation"
                        ],
                        warnings: [
                            "Seek medical attention for heart symptoms",
                            "Not for diagnosed heart conditions"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Nervous exhaustion with weakness",
                    remedy: HomeopathicRemedy(
                        name: "Kali Phosphoricum",
                        potency: "30C",
                        dosage: "3-5 pellets twice daily",
                        description: "For nervous exhaustion from overwork",
                        keyIndications: [
                            "Mental fatigue",
                            "Nervous exhaustion",
                            "Better from rest",
                            "Worse from mental effort",
                            "Anxiety with tiredness"
                        ],
                        warnings: [
                            "Not for acute anxiety",
                            "Consult doctor if fatigue persists"
                        ]
                    )
                )
            ]
        )
    ]

    // Add this new static property to the CategoryQuestionnaire enum
    static let flu: [Symptom] = [
        Symptom(
            description: "How did your flu symptoms begin?",
            options: [
                SymptomOption(
                    description: "Sudden onset with fever and anxiety",
                    remedy: HomeopathicRemedy(
                        name: "Aconitum Napellus",
                        potency: "30C",
                        dosage: "3-5 pellets every 2-3 hours",
                        description: "Best for sudden onset flu with high fever",
                        keyIndications: [
                            "Sudden onset after cold exposure",
                            "High fever with anxiety",
                            "Restlessness",
                            "Dry, hot skin",
                            "Symptoms worse at midnight"
                        ],
                        warnings: [
                            "Seek medical attention if fever is very high",
                            "Not for prolonged flu symptoms"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Gradual onset with extreme fatigue",
                    remedy: HomeopathicRemedy(
                        name: "Gelsemium",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "Classic flu remedy with fatigue",
                        keyIndications: [
                            "Heavy, drooping eyelids",
                            "Extreme fatigue and weakness",
                            "Chills up and down spine",
                            "Dull headache",
                            "No thirst with fever"
                        ],
                        warnings: [
                            "Monitor hydration levels",
                            "Seek medical help if symptoms worsen"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Body aches with bone pain",
                    remedy: HomeopathicRemedy(
                        name: "Eupatorium Perfoliatum",
                        potency: "30C",
                        dosage: "3-5 pellets every 3-4 hours",
                        description: "Specific for severe body aches",
                        keyIndications: [
                            "Severe bone and muscle pain",
                            "Feels as if bones are broken",
                            "Restless with pain",
                            "Thirst for cold water",
                            "Worse from movement"
                        ],
                        warnings: [
                            "Not for long-term use",
                            "Consult doctor if pain is severe"
                        ]
                    )
                )
            ]
        ),
        Symptom(
            description: "What are your main flu symptoms?",
            options: [
                SymptomOption(
                    description: "High fever with sweating and restlessness",
                    remedy: HomeopathicRemedy(
                        name: "Arsenicum Album",
                        potency: "30C",
                        dosage: "3-5 pellets every 3 hours",
                        description: "For flu with anxiety and restlessness",
                        keyIndications: [
                            "Restlessness with exhaustion",
                            "Chilly but wants fresh air",
                            "Thirsty for small sips",
                            "Worse 1-2 AM",
                            "Burning pains better from heat"
                        ],
                        warnings: [
                            "Monitor hydration",
                            "Seek medical attention if symptoms persist"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Flu with stomach upset and vomiting",
                    remedy: HomeopathicRemedy(
                        name: "Nux Vomica",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "For flu with digestive symptoms",
                        keyIndications: [
                            "Chilliness and cannot get warm",
                            "Irritability",
                            "Nausea and vomiting",
                            "Oversensitive to light and noise",
                            "Worse from cold air"
                        ],
                        warnings: [
                            "Avoid coffee during treatment",
                            "Not for severe dehydration"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Flu with chest congestion",
                    remedy: HomeopathicRemedy(
                        name: "Antimonium Tartaricum",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "For flu with respiratory symptoms",
                        keyIndications: [
                            "Rattling chest congestion",
                            "Drowsiness",
                            "Difficulty breathing",
                            "Worse in warm rooms",
                            "Better sitting up"
                        ],
                        warnings: [
                            "Seek immediate help for breathing difficulties",
                            "Not for long-term use"
                        ]
                    )
                )
            ]
        ),
        Symptom(
            description: "Do you have any specific time-related symptoms?",
            options: [
                SymptomOption(
                    description: "Symptoms worse in morning",
                    remedy: HomeopathicRemedy(
                        name: "Bryonia",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "For flu with dry symptoms",
                        keyIndications: [
                            "Worse from any movement",
                            "Intense thirst for large drinks",
                            "Dry cough with chest pain",
                            "Wants to lie perfectly still",
                            "Irritable when disturbed"
                        ],
                        warnings: [
                            "Seek help for severe chest pain",
                            "Monitor hydration levels"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Symptoms worse at night",
                    remedy: HomeopathicRemedy(
                        name: "Mercurius Solubilis",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "For flu with night sweats",
                        keyIndications: [
                            "Profuse sweating without relief",
                            "Bad breath",
                            "Excessive salivation",
                            "Trembling with weakness",
                            "Worse at night"
                        ],
                        warnings: [
                            "Not for prolonged use",
                            "Consult doctor if symptoms persist"
                        ]
                    )
                )
            ]
        )
    ]

    // Add this new static property to the CategoryQuestionnaire enum
    static let dental: [Symptom] = [
        Symptom(
            description: "What type of dental pain are you experiencing?",
            options: [
                SymptomOption(
                    description: "Sharp, shooting tooth pain worse from cold",
                    remedy: HomeopathicRemedy(
                        name: "Magnesia Phosphorica",
                        potency: "30C",
                        dosage: "3-5 pellets every 30 minutes for acute pain",
                        description: "Excellent for sharp, neuralgic tooth pain",
                        keyIndications: [
                            "Sharp, shooting pains",
                            "Better from warm applications",
                            "Worse from cold",
                            "Pain comes and goes quickly",
                            "Better from pressure"
                        ],
                        warnings: [
                            "Seek dental care for ongoing pain",
                            "Not for infected teeth"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Throbbing tooth pain with facial swelling",
                    remedy: HomeopathicRemedy(
                        name: "Belladonna",
                        potency: "30C",
                        dosage: "3-5 pellets every 2 hours",
                        description: "For acute throbbing dental pain",
                        keyIndications: [
                            "Sudden intense throbbing",
                            "Red, hot face",
                            "Sensitivity to touch",
                            "Pain worse from jarring",
                            "Right-sided symptoms"
                        ],
                        warnings: [
                            "Seek immediate dental care for swelling",
                            "Monitor fever"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Severe tooth pain with pus formation",
                    remedy: HomeopathicRemedy(
                        name: "Hepar Sulphuris",
                        potency: "30C",
                        dosage: "3-5 pellets every 3 hours",
                        description: "For dental abscess with pus",
                        keyIndications: [
                            "Extreme sensitivity to cold",
                            "Pus formation",
                            "Sharp, splinter-like pain",
                            "Irritability with pain",
                            "Better from warmth"
                        ],
                        warnings: [
                            "Urgent dental care needed",
                            "Not for long-term use"
                        ]
                    )
                )
            ]
        ),
        Symptom(
            description: "Are there any specific triggers for your dental pain?",
            options: [
                SymptomOption(
                    description: "Pain worse from hot drinks, better from cold",
                    remedy: HomeopathicRemedy(
                        name: "Coffea Cruda",
                        potency: "30C",
                        dosage: "3-5 pellets every 2 hours",
                        description: "For hypersensitive teeth",
                        keyIndications: [
                            "Intense pain from hot drinks",
                            "Relief from cold applications",
                            "Oversensitivity",
                            "Pain with nervousness",
                            "Worse at night"
                        ],
                        warnings: [
                            "Avoid coffee during treatment",
                            "See dentist for persistent sensitivity"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Pain in decayed teeth, worse at night",
                    remedy: HomeopathicRemedy(
                        name: "Mercurius Solubilis",
                        potency: "30C",
                        dosage: "3-5 pellets every 4 hours",
                        description: "For dental decay with night pain",
                        keyIndications: [
                            "Decayed teeth sensitive",
                            "Worse at night",
                            "Metallic taste",
                            "Excessive salivation",
                            "Bad breath"
                        ],
                        warnings: [
                            "Dental treatment needed",
                            "Not for long-term use"
                        ]
                    )
                )
            ]
        ),
        Symptom(
            description: "Do you have any gum-related issues?",
            options: [
                SymptomOption(
                    description: "Bleeding gums when brushing",
                    remedy: HomeopathicRemedy(
                        name: "Phosphorus",
                        potency: "30C",
                        dosage: "3-5 pellets twice daily",
                        description: "For bleeding gums",
                        keyIndications: [
                            "Easy bleeding of gums",
                            "Bright red blood",
                            "Sensitive gums",
                            "Better from cold drinks",
                            "Worse from warm drinks"
                        ],
                        warnings: [
                            "See dentist for gum disease",
                            "Not for severe bleeding"
                        ]
                    )
                ),
                SymptomOption(
                    description: "Receding gums with sensitivity",
                    remedy: HomeopathicRemedy(
                        name: "Kreosotum",
                        potency: "30C",
                        dosage: "3-5 pellets three times daily",
                        description: "For receding gums and sensitivity",
                        keyIndications: [
                            "Receding gums",
                            "Dark, spongy gums",
                            "Teeth decay quickly",
                            "Burning pain",
                            "Worse from hot food"
                        ],
                        warnings: [
                            "Regular dental check-ups needed",
                            "Not for acute infections"
                        ]
                    )
                )
            ]
        )
    ]

    // Would you like me to continue with more categories (Fever, Allergies, Digestive, First Aid)?
} 