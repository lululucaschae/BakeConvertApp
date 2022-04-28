//
//  ContentView.swift
//  BakeConvertApp
//
//  Created by Lucas Chae on 4/28/22.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var weightInputSample = 0.0
    @State private var weightInputUnit = "pounds (lb)"
    @State private var weightOutputUnit = "pounds (lb)"
    
    let weightUnits = ["pounds (lb)", "ounces (oz)", "grams (g)", "kilograms (kg)"]
    let defaultMeasurements = Array(stride(from: 0.00, through: 100.0, by: 0.5))
    
    
    var convertedUnit: Double {
        if weightInputUnit == "pounds (lb)" {
            switch weightOutputUnit {
            case "pounds (lb)":
                return weightInputSample * 1.0
            case "ounces (oz)":
                return weightInputSample * 16
            case "grams (g)" :
                return weightInputSample * 453.59
            case "kilograms (kg)" :
                return weightInputSample * 0.454
            default:
                return weightInputSample
            }
        }
        else if weightInputUnit == "ounces (oz)" {
            switch weightOutputUnit {
            case "pounds (lb)":
                return weightInputSample * 0.0625
            case "ounces (oz)":
                return weightInputSample * 1
            case "grams (g)" :
                return weightInputSample * 28.3495
            case "kilograms (kg)" :
                return weightInputSample * 0.00283495
            default:
                return weightInputSample
            }
        }
        else if weightInputUnit == "grams (g)" {
            switch weightOutputUnit {
            case "pounds (lb)":
                return weightInputSample * 0.00220462
            case "ounces (oz)":
                return weightInputSample * 0.035274
            case "grams (g)" :
                return weightInputSample * 1
            case "kilograms (kg)" :
                return weightInputSample * 0.001
            default:
                return weightInputSample
            }
        }
        else {
            switch weightOutputUnit {
            case "pounds (lb)":
                return weightInputSample * 2.20462
            case "ounces (oz)":
                return weightInputSample * 35.274
            case "grams (g)" :
                return weightInputSample * 1000
            case "kilograms (kg)" :
                return weightInputSample * 1
            default:
                return weightInputSample
            }
        }
    }
    
    
    
    var body: some View {
        NavigationView {
            
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
            .navigationTitle("BakeCovertApp")

             
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
