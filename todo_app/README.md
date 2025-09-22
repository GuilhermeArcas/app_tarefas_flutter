# App de Tarefas - Flutter

Um aplicativo de lista de tarefas (TO-DO List) desenvolvido em **Flutter** e **Dart**.
O objetivo é praticar conceitos de desenvolvimento mobile, organização de código e interação futura com banco de dados (Firebase).

## Funcionalidades

- Adicionar novas tarefas;
- Marcar tarefas como concluídas; 
- Excluir tarefas com o gesto de "arrastar";
- Persistência de dados local (SharedPreferences ou JSON);
- Sistema de login e cadastro (em desenvolvimento);
- Integração futura com Firebase;

## Demonstração 

![Tela de Login]()
![Lista de Tarefas]()
![Tela de Cadastro]()
![Tela de Recuperação de Senha]()

## Como rodar o projeto

1. Clone este repositório:
   ```bash
   git clone https://github.com/SEU_USUARIO/app_tarefas_flutter.git

2. Entre na pasta do projeto: 
    
    cd app_tarefas_flutter

3. Instale as dependências: 
    
    flutter pub get

4. Execute no emulador ou dispositivo físico:

    flutter run

## Tecnologias

- [Flutter](https://flutter.dev/)  
- [Dart](https://dart.dev/)  
- [Material Design](https://m3.material.io/)  
- [SharedPreferences](https://pub.dev/packages/shared_preferences) (para salvar dados localmente)

## Próximos passos

- [ ] Integrar autenticação com Firebase Auth
- [ ] Salvar tarefas no Firebase Firestore
- [ ] Criar categorias personalizadas para as tarefas
- [ ] Melhorar interface com animações 