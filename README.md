# zowe-client

> Ressources côté client pour Zowe — documentation, templates de configuration et exemples de code pour Zowe CLI, Zowe Explorer et les SDKs Zowe, avec IBM RSE API comme backend mainframe.

---

## Vue d'ensemble

Ce dépôt centralise tout ce dont un développeur a besoin pour travailler avec les **outils client Zowe** sur un environnement mainframe z/OS via les **IBM RSE API** (Remote System Explorer API).

La connectivité mainframe passe par les **IBM RSE API** — et non par z/OSMF, qui est réservé à la pile TCP/IP d'administration.

### Plateformes clientes supportées

| Poste | OS | Architecture |
|---|---|---|
| MacBook | macOS (dernière version) | ARM64 (Apple M4) |
| Workstation / VM | Ubuntu 24.04 LTS ou 26.04 LTS | x86-64 |

### Environnements mainframe

| Environnement | Hostname | Port | Protocole |
|---|---|---|---|
| Bac à sable | `sysb.prodinfo.fr.cly` | `6800` | HTTPS |
| Dev / Prod | `dev.prodfindo.fr.cly` | `6800` | HTTPS |

---

## Structure du dépôt

```
zowe-client/
│
├── docs/                        # Sources de la documentation MkDocs
│   ├── getting-started/
│   │   └── prerequisites.md     # Guide d'installation et de configuration
│   ├── stylesheets/
│   │   └── extra.css
│   └── index.md
│
├── examples/                    # Exemples de code par langage / outil
│   ├── python-sdk/              # Exemples SDK Python (privilégié)
│   ├── nodejs-sdk/              # Exemples SDK Node.js
│   ├── java-sdk/                # Exemples SDK Java (Maven)
│   └── cli/                     # Scripts Zowe CLI et automatisation
│
├── config/                      # Templates de configuration
│   ├── zowe.config.json         # Team configuration — profils RSE API
│   └── .zowe.env.json           # Variables d'environnement Zowe CLI
│
├── mkdocs.yml                   # Configuration MkDocs + thème Material
├── pyproject.toml               # Dépendances Python (uv)
├── Makefile                     # Gestion du serveur de documentation
└── README.md
```

---

## Documentation

La documentation est construite avec [MkDocs](https://www.mkdocs.org/) et le thème [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/).

### Prérequis

- Python 3.11+
- Gestionnaire de paquets [uv](https://docs.astral.sh/uv/)

### Démarrage rapide

```bash
# Installer les dépendances
make install

# Lancer la documentation en foreground
make serve

# Lancer en arrière-plan
make start

# Arrêter le serveur en arrière-plan
make stop

# Construire le site statique
make build
```

La documentation est accessible sur `http://127.0.0.1:8003`.

### Aide

```bash
make help
```

---

## Contenu

### Documentation

| Section | Description |
|---|---|
| [Prérequis](docs/getting-started/prerequisites.md) | Node.js, credential storage, installation Zowe CLI, profils RSE API, Zowe Explorer |

### Templates de configuration

| Fichier | Description |
|---|---|
| `config/zowe.config.json` | Team configuration avec profils RSE API pour le bac à sable et dev/prod |
| `config/.zowe.env.json` | Variables d'environnement Zowe CLI |

### Exemples de code

| Priorité | Répertoire | Description |
|---|---|---|
| 1 — Privilégié | `examples/python-sdk/` | SDK Python — exemples datasets, USS, jobs |
| 2 | `examples/nodejs-sdk/` | SDK Node.js — listage de datasets, soumission de jobs |
| 3 | `examples/java-sdk/` | SDK Java — projet Maven avec exemples datasets et jobs |
| — | `examples/cli/` | Scripts Zowe CLI (automatisation, pipelines) |

---

## Stack technique

| Composant | Version |
|---|---|
| Zowe CLI | v3-lts |
| Zowe Explorer (VS Code) | dernière version |
| Node.js | 22 LTS |
| Java JDK | 21 |
| MkDocs Material | 9.5+ |
| Python (outillage doc) | 3.11+ |
| uv | dernière version |

---

## Licence

Usage interne uniquement.
