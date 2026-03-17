# Aplicativo Android – Navegação Indoor

Aplicativo nativo Android desenvolvido em **Kotlin** com **Jetpack Compose**.

## Pré-requisitos

- Android Studio Hedgehog ou superior
- Dispositivo físico Android com sensores IMU (acelerômetro, giroscópio, magnetômetro)
- Bluetooth habilitado para varredura de beacons BLE

## Configuração

Em `app/PDRMadgwick/app/src/main/java/com/example/pdrmadgwick/LocareApi.kt`,
atualize a constante `BASE_URL` para o endereço do backend:

```kotlin
const val BASE_URL = "http://SEU_SERVIDOR:8000/"
```

## Execução

1. Abra a pasta `app/PDRMadgwick/` no Android Studio
2. Sincronize o projeto com Gradle
3. Execute em um dispositivo físico (emulador não suporta sensores IMU reais)

## Arquitetura

```
PDRMadgwick/
└── app/src/main/java/com/example/pdrmadgwick/
    ├── MainActivity.kt           # Ponto de entrada
    ├── NavigationScreen.kt       # Interface Jetpack Compose
    ├── NavigationViewModel.kt    # Estado e lógica MVVM
    ├── PDRLogic.kt               # Filtro de Madgwick + PDR
    ├── RouteCalculator.kt        # Cálculo e exibição de rotas
    └── LocareApi.kt              # Cliente HTTP (Retrofit)
```
