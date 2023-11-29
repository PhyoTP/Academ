//
//  SubjectsView.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import SwiftUI

struct SubjectsView: View {
    @EnvironmentObject var settings: SubjectManager
    @ObservedObject var userData: UserData
    @EnvironmentObject var systemmanager: SystemManager
    @State private var displaySheet = false
    var body: some View {
        NavigationStack{
            
            Form{
                Section{
                    
                    if userData.selection==1&&userData.haveCredits{
                        
                        HStack{
                            Text("Target GPA")
                            Text(String(format:"%.2f",settings.compute(isTarget: true,userData:userData)))
                        }
                        HStack{
                            Text("Current GPA")
                            Text(String(format:"%.2f",settings.compute(isTarget: false,userData:userData)))
                        }
                        
                    }else if userData.selection==2{
                        HStack{
                            Text("Target MSG")
                            Text(String(format:"%.2f",settings.compute(isTarget: true,userData:userData)))
                        }
                        HStack{
                            Text("Current MSG")
                            Text(String(format:"%.2f",settings.compute(isTarget: false,userData:userData)))
                        }
                    }else if userData.selection==3{
                        HStack{
                            Text("Target AL")
                            Text(String(format:"%.0f",settings.compute(isTarget: true,userData:userData)))
                        }
                        HStack{
                            Text("Current AL")
                            Text(String(format:"%.0f",settings.compute(isTarget: false,userData:userData)))
                        }
                    }else if userData.selection==8{
                        HStack{
                            Text("Target MAG")
                            Text(String(format:"%.0f",systemmanager.MSGtoMAG(msg: settings.compute(isTarget: true,userData:userData))))
                        }
                        HStack{
                            Text("Current MAG")
                            Text(String(format:"%.0f",systemmanager.MSGtoMAG(msg:settings.compute(isTarget: false,userData:userData))))
                        }
                    }
                    
                }
                .listRowBackground(userData.themelists[userData.colorSelect].secondColor)
                Section{
                    if settings.subjects.count == 0 {
                        Text("No subjects")
                            .foregroundColor(.gray)
                    }else{
                        List($settings.subjects,editActions: .all){$subject in
                            NavigationLink{
                                SubjectDetailView(sub:$subject,userData: userData)
                            }label:{
                                Text(subject.name)
                            }
                            .listRowBackground(userData.themelists[userData.colorSelect].secondColor)
                        }
                    }
                }
                .listRowBackground(userData.themelists[userData.colorSelect].secondColor)
            }
            .background(userData.themelists[userData.colorSelect].mainColor)
            .scrollContentBackground(userData.themelists[userData.colorSelect].hideBackground ? .hidden : .visible)
            .navigationTitle("Subjects")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        displaySheet = true
                    } label: {
                        Image(systemName: "plus")
                        
                    }
                    
                }
            }
            .sheet(isPresented: $displaySheet) {
                NewSubjectView(userData: userData)
                    .presentationDetents([.fraction(0.8)])
                    .presentationDragIndicator(.visible)
                    .listRowBackground(userData.themelists[userData.colorSelect].secondColor)
            }
            .listRowBackground(userData.themelists[userData.colorSelect].secondColor)
        }
    }
}




struct SubjectsView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectsView(userData: UserData())
            .environmentObject(SubjectManager())
            .environmentObject(SystemManager())
    }
}
