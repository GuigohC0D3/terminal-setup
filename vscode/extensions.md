# VS Code Extensions

Para reinstalar todas de uma vez:

```powershell
$extensions = @(
    "akamud.vscode-javascript-snippet-pack",
    "alexisvt.flutter-snippets",
    "anthropic.claude-code",
    "blueneogeo.flutter-view-vscode",
    "bradlc.vscode-tailwindcss",
    "burkeholland.simple-react-snippets",
    "charliermarsh.ruff",
    "dart-code.dart-code",
    "dart-code.flutter",
    "dbaeumer.vscode-eslint",
    "docker.docker",
    "dracula-theme.theme-dracula",
    "dsznajder.es7-react-js-snippets",
    "eamodio.gitlens",
    "ecmel.vscode-html-css",
    "esbenp.prettier-vscode",
    "github.vscode-pull-request-github",
    "helgardrichard.helium-icon-theme",
    "hollowtree.vue-snippets",
    "marcmarcet.copy-project-structure",
    "ms-azuretools.vscode-containers",
    "ms-azuretools.vscode-docker",
    "ms-python.debugpy",
    "ms-python.python",
    "ms-python.vscode-pylance",
    "ms-python.vscode-python-envs",
    "ms-vscode-remote.remote-containers",
    "ms-vscode.live-server",
    "ms-vscode.vscode-typescript-next",
    "msjsdiag.vscode-react-native",
    "oracle.oracle-java",
    "redhat.java",
    "ritwickdey.liveserver",
    "sdras.vue-vscode-snippets",
    "shenjiaolong.vue-helper",
    "vscjava.vscode-gradle",
    "vscjava.vscode-java-debug",
    "vscjava.vscode-java-dependency",
    "vscjava.vscode-java-pack",
    "vscjava.vscode-java-test",
    "vscjava.vscode-maven",
    "vue.volar",
    "xabikos.javascriptsnippets"
)
foreach ($ext in $extensions) { code --install-extension $ext }
```

---

## Por categoria

### Tema & Ícones
| Extensão | ID |
|---|---|
| Dracula Theme | `dracula-theme.theme-dracula` |
| Helium Icon Theme | `helgardrichard.helium-icon-theme` |

### Git & GitHub
| Extensão | ID |
|---|---|
| GitLens | `eamodio.gitlens` |
| GitHub Pull Requests | `github.vscode-pull-request-github` |

### Formatação & Linting
| Extensão | ID |
|---|---|
| Prettier | `esbenp.prettier-vscode` |
| ESLint | `dbaeumer.vscode-eslint` |
| Ruff (Python) | `charliermarsh.ruff` |
| Tailwind CSS IntelliSense | `bradlc.vscode-tailwindcss` |
| HTML CSS Support | `ecmel.vscode-html-css` |

### Python
| Extensão | ID |
|---|---|
| Python | `ms-python.python` |
| Pylance | `ms-python.vscode-pylance` |
| Debugpy | `ms-python.debugpy` |
| Python Envs | `ms-python.vscode-python-envs` |

### JavaScript / TypeScript / React
| Extensão | ID |
|---|---|
| ES7+ React Snippets | `dsznajder.es7-react-js-snippets` |
| Simple React Snippets | `burkeholland.simple-react-snippets` |
| JavaScript Snippets | `xabikos.javascriptsnippets` |
| JavaScript Snippet Pack | `akamud.vscode-javascript-snippet-pack` |
| TypeScript Next | `ms-vscode.vscode-typescript-next` |
| React Native | `msjsdiag.vscode-react-native` |

### Vue
| Extensão | ID |
|---|---|
| Volar (Vue) | `vue.volar` |
| Vue VSCode Snippets | `sdras.vue-vscode-snippets` |
| Vue Snippets | `hollowtree.vue-snippets` |
| Vue Helper | `shenjiaolong.vue-helper` |

### Flutter & Dart
| Extensão | ID |
|---|---|
| Flutter | `dart-code.flutter` |
| Dart | `dart-code.dart-code` |
| Flutter Snippets | `alexisvt.flutter-snippets` |
| Flutter View | `blueneogeo.flutter-view-vscode` |

### Java
| Extensão | ID |
|---|---|
| Java Extension Pack | `vscjava.vscode-java-pack` |
| Java Debug | `vscjava.vscode-java-debug` |
| Java Dependency Viewer | `vscjava.vscode-java-dependency` |
| Java Test Runner | `vscjava.vscode-java-test` |
| Maven | `vscjava.vscode-maven` |
| Gradle | `vscjava.vscode-gradle` |
| Red Hat Java | `redhat.java` |
| Oracle Java | `oracle.oracle-java` |

### Docker & Containers
| Extensão | ID |
|---|---|
| Docker | `ms-azuretools.vscode-docker` |
| Docker (oficial) | `docker.docker` |
| Containers | `ms-azuretools.vscode-containers` |
| Remote Containers | `ms-vscode-remote.remote-containers` |

### Servidor Local
| Extensão | ID |
|---|---|
| Live Server (Ritwick) | `ritwickdey.liveserver` |
| Live Server (MS) | `ms-vscode.live-server` |

### AI & Utilitários
| Extensão | ID |
|---|---|
| Claude Code | `anthropic.claude-code` |
| Copy Project Structure | `marcmarcet.copy-project-structure` |
