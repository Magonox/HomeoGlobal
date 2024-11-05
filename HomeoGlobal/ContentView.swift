//
//  ContentView.swift
//  HomeoGlobal
//
//  Created by Shawn Böhm on 05.11.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
                .tag(2)
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(3)
        }
    }
}

// Placeholder Views
struct HomeView: View {
    var body: some View {
        NavigationView {
            CategoryGridView()
                .navigationTitle("Homeopathy Guide")
        }
    }
}

struct CategoryGridView: View {
    let categories = [
        Category(name: "Common Cold", icon: "nose.fill"),
        Category(name: "Cough", icon: "lungs.fill"),
        Category(name: "Allergies", icon: "allergens"),
        Category(name: "Fever", icon: "thermometer"),
        Category(name: "Digestive", icon: "pill.fill"),
        Category(name: "First Aid", icon: "cross.case.fill")
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 20) {
                ForEach(categories) { category in
                    CategoryCard(category: category)
                }
            }
            .padding()
        }
    }
}

struct CategoryCard: View {
    let category: Category
    @State private var isPressed = false
    
    var body: some View {
        NavigationLink(destination: CategoryDetailView(category: category)) {
            VStack {
                Image(systemName: category.icon)
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .clipShape(Circle())
                
                Text(category.name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 2)
        }
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    withAnimation(.spring(response: 0.2, dampingFraction: 0.5)) {
                        isPressed = true
                    }
                    let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
                    impactGenerator.impactOccurred()
                }
                .onEnded { _ in
                    withAnimation(.spring(response: 0.2, dampingFraction: 0.5)) {
                        isPressed = false
                    }
                }
        )
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .opacity(isPressed ? 0.8 : 1.0)
    }
}

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
}

struct CategoryDetailView: View {
    let category: Category
    @State private var currentSymptom: Symptom?
    @State private var selectedRemedy: HomeopathicRemedy?
    @State private var showRemedyDetail = false
    
    var symptoms: [Symptom] {
        switch category.name {
        case "Common Cold":
            return CategoryQuestionnaire.commonCold
        case "Cough":
            return CategoryQuestionnaire.cough
        // Add other cases...
        default:
            return []
        }
    }
    
    var body: some View {
        VStack {
            if let remedy = selectedRemedy {
                RemedyDetailView(remedy: remedy)
            } else if let symptom = currentSymptom {
                QuestionView(symptom: symptom, onOptionSelected: handleOptionSelected)
            } else {
                startQuestionnaire
            }
        }
        .navigationTitle(category.name)
    }
    
    private var startQuestionnaire: some View {
        VStack(spacing: 20) {
            Text("Let's find the right remedy for you")
                .font(.headline)
            
            Button("Start Symptom Check") {
                currentSymptom = symptoms.first
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
    private func handleOptionSelected(_ option: SymptomOption) {
        if let remedy = option.remedy {
            selectedRemedy = remedy
        } else if let nextSymptom = option.nextSymptom {
            currentSymptom = nextSymptom
        }
    }
}

struct QuestionView: View {
    let symptom: Symptom
    let onOptionSelected: (SymptomOption) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text(symptom.description)
                .font(.headline)
                .padding()
            
            ForEach(symptom.options) { option in
                Button(action: { onOptionSelected(option) }) {
                    Text(option.description)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }
}

struct RemedyDetailView: View {
    let remedy: HomeopathicRemedy
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(remedy.name)
                    .font(.title)
                    .bold()
                
                VStack(alignment: .leading) {
                    Text("Potency: \(remedy.potency)")
                    Text("Dosage: \(remedy.dosage)")
                }
                
                Text(remedy.description)
                    .padding(.vertical)
                
                Text("Key Indications:")
                    .font(.headline)
                ForEach(remedy.keyIndications, id: \.self) { indication in
                    Text("• \(indication)")
                }
                
                Text("Warnings:")
                    .font(.headline)
                    .padding(.top)
                ForEach(remedy.warnings, id: \.self) { warning in
                    Text("⚠️ \(warning)")
                        .foregroundColor(.red)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
