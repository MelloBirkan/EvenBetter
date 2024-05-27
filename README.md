# EvenBetter

[![Swift Version](https://img.shields.io/badge/Swift-5.10-pink.svg)](https://swift.org)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-5.0-brightgreen.svg)](https://developer.apple.com/xcode/swiftui/)
[![SwiftData](https://img.shields.io/badge/SwiftData-1.0-orange.svg)](https://developer.apple.com/documentation/swiftdata)
[![iOS](https://img.shields.io/badge/iOS-17%2B-blue.svg)](https://developer.apple.com/ios/)
![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)

### Atenção pessoas ocupadas que buscam melhorar o bem-estar e a produtividade!

Estamos aqui para ajudar você a alcançar um equilíbrio saudável entre vida pessoal e profissional, promovendo autoconhecimento e autoaperfeiçoamento contínuos em menos de 21 dias...

Com o evenBetter, você terá acesso a uma ferramenta única que oferece autoaperfeiçoamentos personalizados e as melhores funcionalidades integradas em um só lugar. Desafios diários baseados no seu humor, gerenciamento de tarefas eficiente e um player de meditação são apenas o começo.

Transforme sua rotina e seja **ainda melhor**

## Índice

- [Demonstração](#demonstração)
- [Instalação](#instalação)
- [Uso](#uso)
- [Funcionalidades](#funcionalidades)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Modelagem das Classes](#modelagem-das-classes)
- [Planos futuros](#planos-futuros)

## Demonstração

Aqui estão alguns screenshots e GIFs do aplicativo em ação:

<div style="display: flex;">
  <img src="assets/challenges-video1.gif" alt="video-desafios-demo" width="300">
  <img src="assets/tarefas-video1.gif" alt="video-tarefas-demo" width="300">
  <img src="assets/meditacao-video1.gif" alt="video-meditacao-demo" width="300">
  <img src="assets/dark-video1.gif" alt="video-demo" width="300">
</div>

![App Demo](assets/demo.gif)

## Instalação

Para configurar o projeto localmente, siga os passos abaixo:

1. Clone o repositório:
   ```bash
   git clone https://github.com/usuario/evenbetter.git
   cd evenbetter
   open evenbetter.xcodeproj
   Cmd + R
   ```
   ## Uso

Para utilizar o aplicativo, siga os passos abaixo:

1. Abra o aplicativo.
2. Navegue até a tela principal.
3. Siga as instruções na tela para utilizar as funcionalidades.

## Funcionalidades
  <img src="assets/video-demo.gif" alt="video-demo" width="300">
  
- [x] Gestão de Tarefas: Adicione, edite e exclua tarefas.
- [x] Desafios Diários: Complete desafios diários para um estilo de vida saudável.
- [x] Player para Meditação: Ouça faixas relaxantes de meditação.
- [x] Registro de Humor e Bem-estar: Registre seu humor e bem-estar diário.

## Tecnologias Utilizadas

### SwiftUI
[SwiftUI](https://developer.apple.com/xcode/swiftui/) é uma framework da Apple para construir interfaces de usuário declarativas. Ele permite a criação de UIs dinâmicas e responsivas de forma rápida e eficiente, utilizando uma sintaxe simples e intuitiva.
### Swift
[Swift](https://swift.org/) é uma linguagem de programação poderosa e intuitiva desenvolvida pela Apple. Ela é usada para criar aplicativos para iOS, macOS, watchOS e tvOS. Swift é conhecida por sua segurança, performance e facilidade de uso.
### Combine
[Combine](https://developer.apple.com/documentation/combine) é uma framework de programação reativa da Apple. Ela permite que os desenvolvedores manipulem e processem valores assíncronos ao longo do tempo, facilitando a gestão de eventos e dados assíncronos.
### SwiftData
[SwiftData](https://developer.apple.com/documentation/swiftdata) é uma maneira rápida, poderosa e fácil de usar para armazenar dados localmente. Ele permite a criação de objetos personalizados, definição de relacionamentos, recuperação com filtragem e classificação, e sincronização com o iCloud usando CloudKit.
### CloudKit
[CloudKit](https://developer.apple.com/documentation/cloudkit) é a framework de serviços em nuvem da Apple. Ela permite que os desenvolvedores armazenem e gerenciem dados na nuvem, facilitando a sincronização de dados entre vários dispositivos. CloudKit oferece suporte a cache offline mínimo e depende da rede e de uma conta iCloud válida para armazenar dados específicos do usuário.

## Modelagem das Classes
### Tarefas
```swift
enum TaskStatus {
  case completed, uncompleted
}

@Model
final class TaskModel {
  var title: String
  var summary: String
  var hour: Date
  var isCompleted: Bool = false
  var color: String
  }
```
### Humor
```swift
enum MoodType: String, Codable {
  case feliz = "Feliz"
  case triste = "Triste"
  case ansioso = "Ansioso"
  case motivado = "Motivado"
  case bravo = "Bravo"
  case cansado = "Cansado"
  case all
}

struct Mood: Identifiable, Equatable {
  let id = UUID()
  let type: MoodType
  var name: String {
    return self.type.rawValue
  }
  let description: String
  let image: Image
```
### Meditação
```swift
struct MeditationDO: Identifiable {
  let id = UUID()
  let title: String
  let description: String
  let duration: TimeInterval
  let track: String
  let image: Image
}
```
### AudioManager da Meditação
```swift
import Foundation
import AVKit

final class AudioManager: ObservableObject {
    var player: AVAudioPlayer?
    @Published private(set) var isPlaying: Bool = false
    @Published private(set) var isLooping: Bool = false
    
    func startPlayer(track: String, isPreview: Bool = false) {
        guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else {
            print("Resource not found: \(track)")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
            
            if isPreview {
                player?.prepareToPlay()
            } else {
                player?.play()
                isPlaying = true
            }
        } catch {
            print("Fail to initialize player", error)
        }
    }
    
    func playPause() {
        guard let player = player else {
            print("Instance of audio player not found")
            return
        }
        
        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }
    }
    
    func stop() {
        guard let player = player else { return }
        
        if player.isPlaying {
            player.stop()
            isPlaying = false
        }
    }
    
    func toggleLoop() {
        guard let player = player else { return }
        
        player.numberOfLoops = player.numberOfLoops == 0 ? -1 : 0
        isLooping = player.numberOfLoops != 0
    }
}
```
## Planos futuros
 ### Lançamento do MVP (Produto Mínimo Viável)
Estamos quase prontos para lançar nosso MVP. Atualmente, estamos na fase 0.6.1, o que significa que estamos muito próximos de uma versão 1.0, mas ainda há algumas áreas que precisam de melhorias e ajustes. Entre as principais tarefas pendentes estão:
- **Sistema de Gerar Desafios:** Melhorar a lógica e adicionar mais desafios para oferecer uma experiência mais rica aos usuários.
- **Sistema de Tarefas:** Implementar duas queries diferentes para tipos distintos de tarefas, aprimorando a funcionalidade e a usabilidade do sistema.
### Além...
- Fazer streaming de faixas de meditação
- Sistema contendo mais "variaveis" para alocar a tarefa, como tipo da atividade etc...
- Desafios de atividades físicas baseam-se no HealthKit para ter dados mais precisos
- Nova aba contendo "ensinamentos" e motivacionais
```swift
print("Feito com ❤️ por Mello e Dani")
```

[swift-image]:https://img.shields.io/badge/swift-5.10-orange.svg
[swift-url]: https://swift.org/
