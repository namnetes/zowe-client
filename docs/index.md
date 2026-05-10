# Documentation Zowe

Bienvenue dans la documentation technique Zowe — centrée sur l'usage **client** :
Zowe CLI, Zowe Explorer pour VS Code et les SDKs Zowe.

## Par où commencer ?

- [Prérequis](getting-started/prerequisites.md) — ce qu'il faut installer et configurer avant toute chose

## Exemple Mermaid

```mermaid
graph TD
    A[Zowe CLI] -->|REST| B[z/OSMF]
    C[Zowe Explorer] -->|REST| B
    D[SDK Java/Node.js] -->|REST| B
    B --> E[z/OS Mainframe]
```
