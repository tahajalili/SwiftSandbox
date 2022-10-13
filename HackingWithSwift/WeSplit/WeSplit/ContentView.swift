//
//  ContentView.swift
//  WeSplit
//
//  Created by Taha Jalili on 30.09.22.
//

import SwiftUI

struct ContentView: View {
	@State private var checkAmount = 0.0
	@State private var numberOfPeople = 2
	@State private var tipPercentage = 20
	@FocusState private var amountIsFocused: Bool
	
	let tipPercentages = [10, 15, 20, 25, 0]
	
	//For Total cost + tip
	var grandTotal: Double{
		let tipSelection = Double(tipPercentage)
		let tipValue = checkAmount / 100 * tipSelection
		let grandTotal = checkAmount + tipValue
		
		return grandTotal
	}

	
	//For individual share
	var totalPerPerson: Double{
		let peopleCount = Double(numberOfPeople + 2)
		let amountPerPerson = grandTotal / peopleCount
	
		return amountPerPerson
	}
	
	
	
	var body: some View {
		NavigationView {
			Form{
				Section{
					TextField("Amount: ", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
						.keyboardType(.decimalPad)
						.focused($amountIsFocused)
					
					Picker("Number of people", selection: $numberOfPeople){
						ForEach(2..<100){
							Text("\($0) people")
						}
					}
				}
				
				Section{
					Picker("Tip Percentage", selection: $tipPercentage){
						ForEach(tipPercentages, id:\.self){
							Text($0, format: .percent)
						}
					}.pickerStyle(.segmented)
										
				}header: {
					Text("How much tip do you want to leave?")
				}
				
				
				//Grand Total
				Section{
					Text(grandTotal, format:.currency(code: Locale.current.currencyCode ?? "USD"))
				}header: {
					Text("Total Cost + Tip")
				}
				
				
				//Showing each person's share
				Section{
					Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
				}header: {
					Text("Amount Per Person")
				}
			}
			.toolbar(){
						ToolbarItemGroup(placement: .keyboard){
							Spacer()
							
							Button("Done"){
								amountIsFocused = false
							}
						}
					}
			.navigationTitle("WeSplit")
			
			
		}
	}
		
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
