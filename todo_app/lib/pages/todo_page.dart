import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/tarefa.dart';
import '../widgets/tarefa_tile.dart';

// TELA PRINCIPAL
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _controller = TextEditingController();
  List<Tarefa> _tarefas = [];

  @override
  void initState() {
    super.initState();
    _carregarTarefas();
  }

  //FUNÇÃO PARA SALVAR AS TAREFAS
  Future<void> _salvarTarefas() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> listaJson = _tarefas.map((t) => t.toJson()).toList();
    await prefs.setStringList('tarefas', listaJson);
  }

  // FUNÇÃO PARA CARREGAR AS TAREFAS DO SHARED PREFERENCES
  Future<void> _carregarTarefas() async {
    final prefs = await SharedPreferences.getInstance();
    final listaJson = prefs.getStringList('tarefas') ?? [];
    setState(() {
      _tarefas = listaJson.map((t) => Tarefa.fromJson(t)).toList();
      _ordenarTarefas();
    });
  }

  // FUNÇÃO PARA ORDENAR TAREFAS: CONCLUÍDAS NO FINAL
  void _ordenarTarefas() {
    _tarefas.sort((a, b) {
      if (a.concluida && !b.concluida) return 1;
      if (!a.concluida && b.concluida) return -1;
      return 0;
    });
  }

  // FUNÇÃO PARA ADICIONAR TAREFAS
  void _adicionarTarefa(String titulo) {
    if (titulo.isNotEmpty) {
      setState(() {
        _tarefas.add(Tarefa(titulo: titulo));
        _ordenarTarefas();
        _salvarTarefas();
        _controller.clear();
      });
    }
  }

  // FUNÇÃO PARA REMOVER TAREFAS
  void _removerTarefa(int index) {
    setState(() {
      _tarefas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu App de Tarefas"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Digite uma tarefa...",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    _adicionarTarefa(_controller.text);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (context, index) {
                  final tarefa = _tarefas[index];
                  return TarefaTile(
                    tarefa: tarefa,
                    onChanged: (valor) {
                      setState(() {
                        tarefa.concluida = valor ?? false;
                        _ordenarTarefas();
                        _salvarTarefas();
                      });
                    },
                    onDismissed: () {
                      _removerTarefa(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
