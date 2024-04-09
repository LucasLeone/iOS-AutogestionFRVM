import SwiftUI

struct HorariosView: View {
    @StateObject var horariosViewModel = HorariosViewModel()
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Cargando...")
            } else {
                List {
                    ForEach(0..<horariosViewModel.horarios.count, id: \.self) { index in
                        if !horariosViewModel.horarios[index].isEmpty {
                            VStack(alignment: .leading) {
                                Text(diaSemana(index))
                                    .font(.title2)
                                ForEach(horariosViewModel.horarios[index], id: \.materia) { horario in
                                    VStack(alignment: .leading) {
                                        Text(horario.materia).font(.headline)
                                        Text("Horario: \(horario.fechaInicio.prefix(16).suffix(5)) - \(horario.fechaFin.prefix(16).suffix(5))")
                                        Text("Aula: \(horario.aula)")
                                        Text("Docente: \(horario.docente)")
                                        Text("Carrera: \(horario.carrera)")
                                        Divider()
                                    }
                                }
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Horarios")
        .onAppear {
            isLoading = true
            horariosViewModel.obtenerHorarios { success in
                isLoading = false
            }
        }
    }
    
    func diaSemana(_ dia: Int) -> String {
        switch dia {
        case 1:
            return "Lunes"
        case 2:
            return "Martes"
        case 3:
            return "Miércoles"
        case 4:
            return "Jueves"
        case 5:
            return "Viernes"
        case 6:
            return "Sábado"
        case 7:
            return "Domingo"
        default:
            return "Día inválido"
        }
    }
}
