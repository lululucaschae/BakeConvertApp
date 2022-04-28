//
//  ContentView.swift
//  BakeConvertApp
//
//  Created by Lucas Chae on 4/28/22.
//

import SwiftUI

struct ContentView: View {
    

    @State private var selectedPage = 1
    
    // Weight properties
    @State private var weightInputSample = 0.0
    @State private var weightInputUnit = "lb"
    @State private var weightOutputUnit = "lb"
    let weightUnits = ["lb", "oz", "g", "kg"]
    let defaultMeasurements = Array(stride(from: 0.00, through: 100.0, by: 0.5))
    
    // Volume properties
    @State private var volumeInputSample = 0.0
    @State private var volumeInputUnit = "tsp."
    @State private var volumeOutputUnit = "tsp."
    let volumeUnits = ["tsp.", "tbsp.", "fl oz", "cup", "gal", "mL", "L"]
    

    
    func WeightConversion(unitWeight: Measurement<UnitMass>, thisUnit: String) -> Double {
        switch thisUnit {
        case "lb":
            return unitWeight.converted(to: .pounds).value
        case "oz":
            return unitWeight.converted(to: .ounces).value
        case "g" :
            return unitWeight.converted(to: .grams).value
        case "kg" :
            return unitWeight.converted(to: .kilograms).value
        default:
            return 0
        }
    }
    
    func VolumeConversion(unitWeight: Measurement<UnitVolume>, thisUnit: String) -> Double {
        switch thisUnit {
        case "tsp.":
            return unitWeight.converted(to: .teaspoons).value
        case "tbsp.":
            return unitWeight.converted(to: .tablespoons).value
        case "fl oz" :
            return unitWeight.converted(to: .fluidOunces).value
        case "cup" :
            return unitWeight.converted(to: .cups).value
        case "gal" :
            return unitWeight.converted(to: .gallons).value
        case "mL" :
            return unitWeight.converted(to: .milliliters).value
        case "L" :
            return unitWeight.converted(to: .liters).value
        default:
            return 0
        }
    }
    
    
    
    
    var convertedWeight: Double {
        if weightInputUnit == "lb" {
            let inputUnitWeight = Measurement(value: weightInputSample, unit:UnitMass.pounds)
            return WeightConversion(unitWeight: inputUnitWeight, thisUnit: weightOutputUnit)
            
        }
        else if weightInputUnit == "oz" {
            let inputUnitWeight = Measurement(value: weightInputSample, unit:UnitMass.ounces)
            return WeightConversion(unitWeight: inputUnitWeight, thisUnit: weightOutputUnit)
        }
        else if weightInputUnit == "g" {
            let inputUnitWeight = Measurement(value: weightInputSample, unit:UnitMass.grams)
            return WeightConversion(unitWeight: inputUnitWeight, thisUnit: weightOutputUnit)
        }
        else if weightInputUnit == "kg" {
            let inputUnitWeight = Measurement(value: weightInputSample, unit:UnitMass.kilograms)
            return WeightConversion(unitWeight: inputUnitWeight, thisUnit: weightOutputUnit)
        }
        else {
            return weightInputSample
        }
    }
    
    var convertedVolume: Double {
        if volumeInputUnit == "tsp." {
            let inputUnitVolume = Measurement(value: volumeInputSample, unit:UnitVolume.teaspoons)
            return VolumeConversion(unitWeight: inputUnitVolume, thisUnit: volumeOutputUnit)
            
        }
        else if volumeInputUnit == "tbsp." {
            let inputUnitVolume = Measurement(value: volumeInputSample, unit:UnitVolume.tablespoons)
            return VolumeConversion(unitWeight: inputUnitVolume, thisUnit: volumeOutputUnit)
        }
        else if volumeInputUnit == "fl oz" {
            let inputUnitVolume = Measurement(value: volumeInputSample, unit:UnitVolume.fluidOunces)
            return VolumeConversion(unitWeight: inputUnitVolume, thisUnit: volumeOutputUnit)
        }
        else if volumeInputUnit == "cup" {
            let inputUnitVolume = Measurement(value: volumeInputSample, unit:UnitVolume.cups)
            return VolumeConversion(unitWeight: inputUnitVolume, thisUnit: volumeOutputUnit)
        }
        else if volumeInputUnit == "gal" {
            let inputUnitVolume = Measurement(value: volumeInputSample, unit:UnitVolume.gallons)
            return VolumeConversion(unitWeight: inputUnitVolume, thisUnit: volumeOutputUnit)
        }
        else if volumeInputUnit == "mL" {
            let inputUnitVolume = Measurement(value: volumeInputSample, unit:UnitVolume.milliliters)
            return VolumeConversion(unitWeight: inputUnitVolume, thisUnit: volumeOutputUnit)
        }
        else if volumeInputUnit == "L" {
            let inputUnitVolume = Measurement(value: volumeInputSample, unit:UnitVolume.liters)
            return VolumeConversion(unitWeight: inputUnitVolume, thisUnit: volumeOutputUnit)
        }
        else {
            return weightInputSample
        }
    }
    
    

    
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedPage) {
                // Weight Converter
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

                        Text("\(convertedWeight, specifier: "%.2f")")
                    } header: {
                        Text("\(weightInputSample, specifier: "%.2f") \(weightInputUnit) in \(weightOutputUnit) is")
                    }
                    
                }
                .tabItem {
                    Image(systemName: "scalemass.fill")
                    Text("Weight")
                }.tag(1)
                
                
                
                
                // Volume Converter
                Form {
                    Section {
                        Picker("Input Value", selection: $volumeInputSample) {
                            ForEach(defaultMeasurements, id: \.self) {unit in
                                Text(unit, format: .number)
                            }
                        }
                        .pickerStyle(.wheel)
                        Picker("Input Unit", selection: $volumeInputUnit) {
                            ForEach(volumeUnits, id: \.self) {unit in
                                Text(unit)
                            }
                        }
                        Picker("Output Unit", selection: $volumeOutputUnit) {
                            ForEach(volumeUnits, id: \.self) {unit in
                                Text(unit)
                            }
                        }
                    }
                    Section {
                        Text("\(convertedVolume, specifier: "%.2f")")
                    } header: {
                        Text("\(volumeInputSample, specifier: "%.2f") \(volumeInputUnit) in \(volumeOutputUnit) is")
                    }
                    
                }
                .tabItem {
                    Image(systemName: "square.bottomhalf.filled")
                    Text("Volume")
                }.tag(2)
                
            }
            .navigationTitle(selectedPage == 1 ? "BakeApp - Weight" : "BakeApp - Volume")

             
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
