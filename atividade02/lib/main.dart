import 'package:atividade02/tela2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Cadastro()));
}

class Cadastro extends StatefulWidget {
  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  FocusNode idadeFocus = FocusNode();
  FocusNode emailFocus = FocusNode();

  bool marcado = false;
  String? genero;

  void mostrarErro(String mensagem) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensagem)));
  }

  @override
  void dispose() {
    nomeController.dispose();
    idadeController.dispose();
    emailController.dispose();
    idadeFocus.dispose();
    emailFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(title: Text("Cadastro de Usuário")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Preencha os campos abaixo",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),

              TextField(
                controller: nomeController,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) {
                  FocusScope.of(context).requestFocus(idadeFocus);
                },
                decoration: InputDecoration(
                  labelText: "Nome",
                  hintText: "Digite seu nome",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(height: 10),

              TextField(
                controller: idadeController,
                focusNode: idadeFocus,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) {
                  FocusScope.of(context).requestFocus(emailFocus);
                },
                decoration: InputDecoration(
                  labelText: "Idade",
                  hintText: "Digite sua idade",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(height: 10),

              TextField(
                controller: emailController,
                focusNode: emailFocus,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Digite seu email",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(height: 10),

              DropdownButtonFormField<String>(
                value: genero,
                hint: Text("Escolha o seu gênero"),
                decoration: InputDecoration(
                  labelText: "Sexo",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    value: "Masculino",
                    child: Text("Masculino"),
                  ),
                  DropdownMenuItem(value: "Feminino", child: Text("Feminino")),
                  DropdownMenuItem(value: "Outro", child: Text("Outro")),
                ],
                onChanged: (valor) {
                  setState(() {
                    genero = valor;
                  });
                },
              ),

              SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.all(15),
                ),
                onPressed: () {
                  String nome = nomeController.text.trim();
                  String idadeTexto = idadeController.text.trim();
                  String email = emailController.text.trim();

                  if (nome.isEmpty) {
                    mostrarErro("Digite o nome");
                    return;
                  }

                  if (idadeTexto.isEmpty) {
                    mostrarErro("Digite a idade");
                    return;
                  }

                  int? idadeConvertida = int.tryParse(idadeTexto);
                  if (idadeConvertida == null) {
                    mostrarErro("Idade deve ser um número");
                    return;
                  }

                  if (idadeConvertida < 18) {
                    mostrarErro("Você deve ter pelo menos 18 anos");
                    return;
                  }

                  if (email.isEmpty ||
                      !email.contains("@") ||
                      !email.contains(".")) {
                    mostrarErro("Digite um email válido");
                    return;
                  }

                  if (genero == null) {
                    mostrarErro("Selecione o gênero");
                    return;
                  }

                  if (!marcado) {
                    mostrarErro("Você deve aceitar os termos");
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Tela2(
                        nome: nome,
                        idade: idadeConvertida,
                        email: email,
                        genero: genero,
                        marcado: marcado,
                      ),
                    ),
                  );
                },
                child: Text("Cadastrar", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
