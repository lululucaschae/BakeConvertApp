//
//  ContentView.swift
//  BakeConvertApp
//
//  Created by Lucas Chae on 4/28/22.
//

import SwiftUI

struct ContentView: View {
    

    @State private var selectedPage = 1
    @State private var weightInputSample = 0.0
    @State private var weightInputUnit = "pounds (lb)"
    @State private var weightOutputUnit = "pounds (lb)"
    
    let weightUnits = ["pounds (lb)", "ounces (oz)", "grams (g)", "kilograms (kg)"]
    let defaultMeasurements = Array(stride(from: 0.00, through: 100.0, by: 0.5))
    
    func WeightConversion(unitWeight: Measurement<UnitMass>, thisUnit: String) -> Double {
        switch thisUnit {
        case "pounds (lb)":
            return unitWeight.converted(to: .pounds).value
        case "ounces (oz)":
            return unitWeight.converted(to: .ounces).value
        case "grams (g)" :
            return unitWeight.converted(to: .grams).value
        case "kilograms (kg)" :
            return unitWeight.converted(to: .kilograms).value
        default:
            return 0
        }
    }
    
    var convertedUnit: Double {
        if weightInputUnit == "pounds (lb)" {
            let unitWeight = Measurement(value: weightInputSample, unit:UnitMass.pounds)
            
            switch weightOutputUnit {
            case "pounds (lb)":
                return unitWeight.converted(to: .pounds).value
            case "ounces (oz)":
                return unitWeight.converted(to: .ounces).value
            case "grams (g)" :
                return unitWeight.converted(to: .grams).value
            case "kilograms (kg)" :
                return unitWeight.converted(to: .kilograms).value
            default:
                return weightInputSample
            }
        }
        else if weightInputUnit == "ounces (oz)" {
            let unitWeight = Measurement(value: weightInputSample, unit:UnitMass.ounces)
            switch weightOutputUnit {
            case "pounds (lb)":
                return unitWeight.converted(to: .pounds).value
            case "ounces (oz)":
                return unitWeight.converted(to: .ounces).value
            case "grams (g)" :
                return unitWeight.converted(to: .grams).value
            case "kilograms (kg)" :
                return unitWeight.converted(to: .kilograms).value
            default:
                return weightInputSample
            }
        }
        else if weightInputUnit == "grams (g)" {
            let unitWeight = Measurement(value: weightInputSample, unit:UnitMass.grams)
            switch weightOutputUnit {
            case "pounds (lb)":
                return unitWeight.converted(to: .pounds).value
            case "ounces (oz)":
                return unitWeight.converted(to: .ounces).value
            case "grams (g)" :
                return unitWeight.converted(to: .grams).value
            case "kilograms (kg)" :
                return unitWeight.converted(to: .kilograms).value
            default:
                return weightInputSample
            }
        }
        else {
            let unitWeight = Measurement(value: weightInputSample, unit:UnitMass.grams)
            switch weightOutputUnit {
            case "pounds (lb)":
                return unitWeight.converted(to: .pounds).value
            case "ounces (oz)":
                return unitWeight.converted(to: .ounces).value
            case "grams (g)" :
                return unitWeight.converted(to: .grams).value
            case "kilograms (kg)" :
                return unitWeight.converted(to: .kilograms).value
            default:
                return weightInputSample
            }
        }
    }
    

    
    
    var body: some View {
        NavigationView {
            
            TabView(selection: $selectedPage) {
                Form {
                    Section {
                        Picker("Input Value", selection: $weightInputSample) {
                            ForEach(defaultMeasurements, id: \.self) {unit in
                                Text(unit, format: .number)
                            }
                        }
                        .pickerStyle(.wheel)
                        Picker("Input Unit", selection: $weightInputUnit) {
                            ForEach(weightUnits, id: \.self) {unit in
                                Text(unit)
                            }
                        }
                        
                        Picker("Output Unit", selection: $weightOutputUnit) {
                            ForEach(weightUnits, id: \.self) {unit in
                                Text(unit)
                            }
                        }
                    }
                    Section {
                        Text("\(convertedUnit, specifier: "%.2f")")
                    } header: {
                        Text("\(weightInputSample, specifier: "%.2f") \(weightInputUnit) in \(weightOutputUnit) is")
                    }
                    
                }
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Weight")
                }.tag(1)
                Form {
                    Section {
                        Picker("Input Value", selection: $weightInputSample) {
                            ForEach(defaultMeasurements, id: \.self) {unit in
                                Text(unit, format: .number)
                            }
                        }
                        .pickerStyle(.wheel)
                        Picker("Input Unit", selection: $weightInputUnit) {
                            ForEach(weightUnits, id: \.self) {unit in
                                Text(unit)
                            }
                        }
                        Picker("Output Unit", selection: $weightOutputUnit) {
                            ForEach(weightUnits, id: \.self) {unit in
                                Text(unit)
                            }
                        }
                    }
                    Section {
                        Text("\(convertedUnit, specifier: "%.2f")")
                    } header: {
                        Text("Input weight of \(weightInputSample, specifier: "%.2f") in \(weightOutputUnit) is")
                    }
                    
                }
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Volume")
                }.tag(2)
                
            }
            .navigationTitle(selectedPage == 1 ? "Weight" : "Volume")

             
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
