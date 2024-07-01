//
//  ContactsScreen.swift
//  WBChatAppSUI
//
//  Created by Daria on 05.06.2024.
//

import SwiftUI

struct Drink: Identifiable {
    let id = UUID()
    let emoji: String
    let title: String
    let desc: String
    
    static let all: [Drink] = [
        Drink(emoji: "🍼", title: "Baby Bottle", desc:
            """
                A bottle of milk or formula, as or fed to a baby, with a bluish cap and rubber nipple or teat. Positioned upright or at a 45° angle, and filled to various levels, sometimes showing fill lines. Often used for newborns and childrearing.
            """),
        Drink(emoji: "🥛", title: "Glass of Milk", desc:
            """
                A tall glass of white milk, as from a cow but also other mammals, nuts, or plants. Most platforms depict a glass filled near to the brim, but some show a glass half-full—or half-empty.
            """),
        Drink(emoji: "☕", title: "Hot Beverage", desc:
            """
                A cup of a steaming-hot beverage, usually taken as coffee or tea. Sometimes shown on a saucer.
            """),
        Drink(emoji: "🫖", title: "Teapot", desc:
            """
                A classic teapot with a wide bulbous body, a spout, a handle, and a lid. Can be used to talk about tea, tea time, or warm beverages in general.
            """),
        Drink(emoji: "🍵", title: "Teacup Without Handle", desc:
            """
                A cup of green tea, as the minty-colored Japanese matcha, usually shown on a wooden mat. Matcha is traditionally served in a small bowl that resembles a cup without a handle.
            """),
        Drink(emoji: "🍶", title: "Sake", desc:
            """
                Japanese sake, an alcoholic beverage made from rice. Shown as a sake set with a carafe (tokkuri) and drinking cup (choko). Most platforms show a cream colored sake set with a blue or red stripe motif.
            """),
        Drink(emoji: "🍾", title: "Bottle with Popping Cork", desc:
            """
                A green bottle of champagne or sparkling wine with label, its cork popping to shoot out its bubbly contents. Used for a range of celebratory occasions, such as New Year's Eve, birthdays, weddings, or other life accomplishments.
            """),
        Drink(emoji: "🍷", title: "Wine Glass", desc:
            """
                Red wine served in a stemmed glass. Google previously displayed an orange-colored drink that resembled cognac.
            """),
        Drink(emoji: "🍸", title: "Cocktail Glass", desc:
            """
                A stemmed glass with a cone-shaped bowl, used for serving cocktails. Depicted as a martini garnished with an olive. Might be gin or vodka, shaken or stirred. See also Tropical Drink.
            """),
        Drink(emoji: "🍹", title: "Tropical Drink", desc:
            """
                A sunset-orange-colored tropical beverage in a stemmed glass, as a rum punch or mai tai. Served with a straw and fruit garnish.
            """),
        Drink(emoji: "🍺", title: "Beer Mug", desc:
            """
                A beer, as a golden-colored lager, in a frosty mug. Depicted with a frothy head spilling over the brim. 🍻 Clinking Beer Mugs is a variation that displays two such beer mugs.
            """),
        Drink(emoji: "🍻", title: "Clinking Beer Mugs", desc:
            """
                Two frosty mugs of beer with frothy heads being clinked together, as done at a celebratory or convivial toast (“Cheers!”).
            """),
        Drink(emoji: "🥂", title: "Clinking Glasses", desc:
            """
                Two flutes of champagne or sparkling wine being clinked together, as done at a celebratory or convivial toast (“Cheers!”).
            """),
        Drink(emoji: "🥃", title: "Tumbler Glass", desc:
            """
                A short, flat glass, as used for brown liquors like whiskey or Scotch whisky.
            """),
        Drink(emoji: "🫗", title: "Pouring Liquid", desc:
            """
                A glass pouring liquid.
            """),
        Drink(emoji: "🥤", title: "Cup with Straw", desc:
            """
                A drinking cup with a straw. Depicted on many platforms as a disposable cup with a lid and bendy straw, as used to serve soft drinks at fast-food restaurants.
            """),
        Drink(emoji: "🧋", title: "Bubble Tea", desc:
            """
                Bubble tea is a tea-based drink invented in Taiwan which typically contain tea, flavored milk, and sugar. Commonly served with tapioca pearls, also known as boba, in a plastic cup with a wide straw.
            """),
        Drink(emoji: "🧃", title: "Beverage Box", desc:
            """
                Originally proposed as Juice, this emoji can be used to talk about juice or other liquids that come in boxes with straws.
            """),
        Drink(emoji: "🧉", title: "Mate", desc:
            """
                Mate is a caffeinated beverage popular in many South American countries. Green in color (from a key ingredient: the dried leaves of yerba mate) and consumed via a metal straw.
            """)
    ]
}

struct ContactsScreen: View {
    var listVariants = [ "List", "Grid", "Grid iOS 13" ]
    @State var currentGrid = 0
    
    var body: some View {
        VStack {
            Picker("Options", selection: $currentGrid) {
                ForEach(0..<listVariants.count, id: \.self) { i in
                    Text(self.listVariants[i]).tag(i)
                }
            }.pickerStyle(.segmented)
    
            switch currentGrid {
            case 0: list
            case 1: grid
            case 2: gridiOS13
            default: EmptyView()
            }
        }
    }
    
    var list: some View {
        List(Drink.all.shuffled()) { drink in
            DrinkCell(drink: drink)
        }
    }
    
    var grid: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: .init(), count: 3)) {
                ForEach(Drink.all) { drink in
                    DrinkCell(drink: drink)
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    var gridiOS13: some View {
        
        var drink2D: [[Drink]] = .init()
        
        let columned = Drink.all.publisher.collect(3)
        
        _ = columned.collect().sink { drink2D = $0 }
            
        return ScrollView {
            VStack(spacing: 8) {
                ForEach(0 ..< drink2D.count, id: \.self) { row in
                    HStack(spacing: 8) {
                        ForEach(drink2D[row]) { drink in
                            DrinkCell(drink: drink)
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct DrinkCell: View {
    let drink: Drink
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10, 5]))
            VStack {
                Text(drink.emoji).font(.system(size: 80))
                Text(drink.title).font(.headline).padding(.horizontal, 2)
                Text(drink.desc)
                    .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 300)
    }
}

struct ContactsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContactsScreen()
    }
}
