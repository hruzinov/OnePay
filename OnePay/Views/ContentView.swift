//
//  Created by Evhen Gruzinov on 11.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CardScreenView()
                .tabItem { Label("Card", systemImage: "creditcard") }
        }
    }
}

#Preview {
    ContentView()
}
