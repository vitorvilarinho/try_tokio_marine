
# Projeto Tokio Marine

## Índice

1. [Introdução](#introducao)
2. [Arquitetura do Projeto](#arquitetura-do-projeto)
3. [Como Rodar](#como-rodar)
4. [Estrutura de Pastas](#estrutura-de-pastas)

---

## 1. Introdução {#introducao}
Este é um projeto desenvolvido por [Vitor Vilarinho](https://github.com/vitorvilarinho) para o processo seletivo da seguradora Tokio Marine 

## 2. Arquitetura do Projeto {#arquitetura-do-projeto}
O projeto utiliza uma arquitetura modular baseada em pacotes, seguindo boas práticas de separação de responsabilidades e escalabilidade. As principais características são:

- **Flutter Modular/Multi-Package**: Cada domínio (core, features, services, design system) é um pacote Dart/Flutter independente, facilitando a manutenção e o reuso.
- **Clean Architecture**: Separação clara entre camadas de domínio, apresentação e infraestrutura, promovendo baixo acoplamento e alta coesão.
- **Design System**: Componentização visual centralizada para garantir consistência de UI/UX.
- **Gerenciamento de Estado**: BLoC / Cubit
- **Testes Automatizados**: Estrutura dedicada para testes unitários e de integração em cada módulo.
- **Integração com Serviços**: Pacotes de serviços para autenticação, banco de dados, etc., desacoplados do app principal.

Essa abordagem permite que novas features e serviços sejam adicionados ou modificados de forma isolada, sem impactar o restante do sistema, além de facilitar a colaboração em equipe e a escalabilidade do projeto.

## 3. Como Rodar {#como-rodar}
### Executando no VS Code

1. Abra o projeto no VS Code.
2. Certifique-se de que o plugin Flutter está instalado.
3. Selecione o dispositivo desejado (emulador Android/iOS ou Chrome/Web) na barra inferior.
4. Pressione `F5` ou clique em "Run and Debug" para iniciar o app.

### Executando pelo terminal

#### Mobile (Android/iOS)
```
cd apps/tokio_marine_app
flutter pub get
flutter run
```
> Para iOS, utilize um Mac com Xcode instalado e um simulador configurado.

#### Web
```
cd apps/tokio_marine_app
flutter pub get
flutter run -d chrome
```
> O comando acima abrirá o app no navegador padrão usando o Chrome.

## 4. Estrutura de Pastas {#estrutura-de-pastas}
O projeto segue uma estrutura modularizada, separando responsabilidades em diferentes pacotes e domínios. Abaixo, um resumo das principais pastas:

- **apps/**: Contém os aplicativos principais do projeto. Exemplo: `tokio_marine_app` (aplicativo Flutter).
  - `android/` e `ios/`: Códigos nativos para Android e iOS.
  - `lib/`: Código Dart principal do app.
  - `test/`: Testes do app.
  - `web/`: Arquivos para build web.

- **core/**: Módulo com funcionalidades e utilitários centrais compartilhados entre os apps e features.
  - `lib/`: Implementação dos utilitários e serviços centrais.
  - `test/`: Testes do core.

- **design_system/**: Componentes visuais reutilizáveis, temas, ícones e assets gráficos.
  - `assets/`: Imagens e SVGs.
  - `lib/`: Widgets e temas.
  - `test/`: Testes dos componentes visuais.

- **features/**: Funcionalidades específicas do domínio, separadas por contexto (ex: autenticação, home, etc).
  - Cada feature possui sua própria pasta, código e testes.

- **services/**: Serviços de domínio, como autenticação, banco de dados, usuário, etc.
  - Cada serviço é um pacote independente, com seu próprio código e testes.

Essa organização facilita a escalabilidade, manutenção e reutilização de código entre diferentes partes do projeto.

