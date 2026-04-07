import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  final String nome;
  final int? idade;
  final String email;
  final String? genero;
  final bool marcado;

  Tela2({
    required this.nome,
    required this.idade,
    required this.email,
    required this.genero,
    required this.marcado,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(title: Text("Confirmação")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dados informados",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text("Nome: $nome", style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Text("Idade: $idade", style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Text("E-mail: $email", style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Text(
                  "Sexo: ${genero ?? 'Não informado'}",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  "Termos aceitos: ${marcado ? "Sim" : "Não"}",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Voltar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Editar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
