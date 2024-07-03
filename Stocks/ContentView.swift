//
//  ContentView.swift
//  Stocks
//
//  Created by Damilare on 01/07/2024.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    HStack{
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                        Text("Damilare A.")
                            .font(.headline)
                        
                        Spacer()
                        
                        ZStack{
                            Circle()
                                .stroke(Color.gray.opacity(0.2))
                                .frame(width: 32, height: 32)
                            Image(systemName: "gearshape")
                                .foregroundColor(.black)
                            
                        }
                            ZStack{
                            Circle()
                                .stroke(Color.gray.opacity(0.2))
                                .frame(width: 32, height: 32)
                            Image(systemName: "bell")
                                .foregroundColor(.black)
                        }
                    }
                    Spacer()
                    
                    Text("Portfolio Balance")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("£14,835.04")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("-0.23% (GPB 1.03) • 1 Month")
                        .font(.subheadline)
                        .foregroundColor(.negative)
                }
                
                
            }
            
            .padding(16)
            Spacer()

            HStack {
                Button(action: {}) {
                    Text("Withdraw")
                        .frame(maxWidth: 168, maxHeight: 16)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: {}) {
                    Text("Deposit")
                        .frame(maxWidth: 168, maxHeight: 16)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)

            HStack {
                Text("Watchlist")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.black)
            }
            .padding(.top)
            .padding(.leading)

            WatchlistItem(symbol: "AAPL", name: "Apple, Inc", price: "£130.33", change: "-1.83%", isPositive: false)
            WatchlistItem(symbol: "DIS", name: "The Walt Disney Company", price: "£111.10", change: "-0.87%", isPositive: false)
            WatchlistItem(symbol: "NKE", name: "NIKE, Inc", price: "£92.26", change: "-1.91%", isPositive: false)
            WatchlistItem(symbol: "SBUX", name: "Starbucks Corporation", price: "£88.49", change: "1.91%", isPositive: true)
            WatchlistItem(symbol: "HOOD", name: "Robinhood Markets, Inc.", price: "£16.49", change: "-4.90%", isPositive: false)

                        Text("Finance News")
                            .font(.title2)
                            .padding(.top)
                            .padding(.leading)

                        Text("How to Find Strong Consumer Discretionary Stocks Slated for Positive Earnings Surprises")
                            .font(.subheadline)
                            .padding(.leading)
                            .padding(.bottom)
                        
                        Spacer()
                    }
    }
}

struct WatchlistItem: View {
    let symbol: String
    let name: String
    let price: String
    let change: String
    var isPositive: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(symbol)
                    .font(.headline)
                Text(name)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(price)
                    .font(.headline)
                Text(change)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color(isPositive ? .positive : .negative))
                    .cornerRadius(5)
            }
        }
       
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}


extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = scanner.string.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


