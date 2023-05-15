//
//  ContentView.swift
//  Storage User Defaults
//
//  Created by CHEBIHI FAYCAL on 15/5/2023.
//

import SwiftUI

struct ContentView: View {
    @State var name_txt: String = ""
    @State var email_txt: String = ""
    @State var departement_txt: String = ""
    @State var name_forground_color_red : Double  = 1.0
    @State var name_forground_color_green : Double = 0.0
    @State var name_forground_color_blue : Double = 0.0
    
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("\(name_txt) \(email_txt)").foregroundColor(
                        Color(red: name_forground_color_red, green: name_forground_color_green, blue: name_forground_color_blue)
                    ).onAppear{
                       
                        name_forground_color_red = UserDefaults.standard.double(forKey: "text_color_red") // default = 0
                        name_forground_color_green = UserDefaults.standard.double(forKey: "text_color_green")
                        name_forground_color_blue = UserDefaults.standard.double(forKey: "text_color_blue")
                    }
                    
                    TextField("Your Name" , text: $name_txt)
                        .onAppear{
                            name_txt = UserDefaults.standard.string(forKey: "name") == nil ? "" : UserDefaults.standard.string(forKey: "name")!
                         }
                    TextField("Your Email" , text: $email_txt)
                        .onAppear{
                            email_txt = UserDefaults.standard.string(forKey: "email") == nil ? "" : UserDefaults.standard.string(forKey: "email")!
                        }
                    TextField("Your Departement" , text: $departement_txt)
                        .onAppear{
                            departement_txt = UserDefaults.standard.string(forKey: "departement") == nil ? "" : UserDefaults.standard.string(forKey: "departement")!
                        }
                    Button("Save"){
                        UserDefaults.standard.set(name_txt, forKey: "name")
                        UserDefaults.standard.set(email_txt, forKey: "email")
                        UserDefaults.standard.set(departement_txt, forKey: "departement")
                        UserDefaults.standard.set(name_forground_color_red, forKey: "text_color_red")
                        UserDefaults.standard.set(name_forground_color_green, forKey: "text_color_green")
                        UserDefaults.standard.set(name_forground_color_blue, forKey: "text_color_blue")
                    }.padding(.top)
                }
                .padding()
                Spacer()
            }.padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
