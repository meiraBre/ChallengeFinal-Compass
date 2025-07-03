# 📌 Challenge Final - Estágio QA

## 🧪 Sobre o Projeto

Este repositório contém a entrega completa do Challenge Final do meu estágio como Quality Assurance. O desafio envolveu **testes manuais e automatizados (API e Front-End)**, baseando-se em regras de negócio, user stories e documentação Swagger da aplicação Cinema Challenge. O projeto foi desenvolvido utilizando a metodologia ágil, com planejamento completo, análise de risco, execução de testes e uso de ferramentas modernas de QA.

---

## 📂 Sumário

- [🧪 Sobre o Projeto](#-sobre-o-projeto)
- [📌 Objetivos](#-objetivos)
- [🛠️ Tecnologias e Ferramentas](#️-tecnologias-e-ferramentas)
- [📅 Planejamento de Testes](#-planejamento-de-testes)
- [🧠 Mapa Mental da API](#-mapa-mental-da-api)
- [📋 Casos de Teste Manuais](#-casos-de-teste-manuais)
- [🤖 Testes Automatizados (Robot Framework)](#-testes-automatizados-robot-framework)
- [🗂️ Organização e Reporte no Jira](#️-organização-e-reporte-no-jira)
- [🧪 Execução dos Testes](#-execução-dos-testes)
- [📌 Conclusão](#-conclusão)

---

## 📌 Objetivos

- [ ] Realizar testes manuais completos da aplicação (API e Front-End).
- [ ] Automatizar os cenários mais críticos utilizando o Robot Framework.
- [ ] Aplicar boas práticas de QA, com documentação clara e evidências.
- [ ] Utilizar banco de dados MongoDB para acesso à API.
- [ ] Simular ambiente real com execução via `npm run dev`.
- [ ] Gerar relatórios de execução, evidências e análise de bugs via Jira.

---

## 🛠️ Tecnologias e Ferramentas

| Tecnologia/Ferramenta | Finalidade |
|------------------------|------------|
| **Robot Framework**    | Automação de testes (API e Front-end) |
| **Postman**            | Testes manuais e análise da API |
| **MongoDB Atlas**      | Banco de dados para autenticação da API |
| **Jira**               | Gerenciamento de bugs e tarefas |
| **VS Code**            | Desenvolvimento e escrita dos testes |
| **Node.js + npm**      | Execução local da API com `npm run dev` |
| **Swagger**            | Documentação técnica da API |
| **Git/GitHub**         | Versionamento e entrega do desafio |

---

## 📅 Planejamento de Testes

> Documento completo com escopo, análise, técnicas aplicadas, cenários de testes, testes candidatos a automação, cobertura de testes.

📄 **Planejamento**: [`/docs/plano-de-testes.pdf`](#)

📌 **Inclui**:
- Estratégia de Testes (heurísticas, análises)
- Matriz de Risco
- Critérios de Entrada/Saída (cenários de testes)
- Critérios de Prioridade (cenários de teste)

---

## 🧠 Mapa Mental da API

> Mapeamento completo dos endpoints de autenticação, sessões, reservas, usuários, filmes...

🧭 **Mapa Mental**: [`/docs/mapa-mental-api.pdf`](#)

---

## 📋 Casos de Teste Manuais

> Casos criados com base na documentação Swagger e user stories.

📌 **Atributos**:
- ID do Caso
- Cenário
- Método
- Pré-requisitos
- Passos
- Resultado Esperado
- Resultado Obtido
- Prioridade

---

## 🤖 Testes Automatizados (Robot Framework)

Estrutura de automação organizada por suíte (API e Front-End):

```bash
📁 Estrutura do Projeto
├── .github/
│   └── workflows/
│       └── ci-tests.yml               # Pipeline de CI para execução dos testes
├── .venv/                             # Ambiente virtual Python
│   ├── Include/
│   ├── Lib/
│   ├── Scripts/
│   └── pyvenv.cfg
├── .vscode/                           # Configurações do VS Code
├── api-tests/
│   ├── resources/
│   │   ├── keywords/
│   │   │   ├── auth_keywords.resource
│   │   │   ├── common_keywords.resource
│   │   │   ├── movie_keywords.resource
│   │   │   ├── reservation_keywords.resource
│   │   │   ├── session_keywords.resource
│   │   │   ├── teardowns_keywords.resource
│   │   │   ├── theater_keywords.resource
│   │   │   └── users_admin_keywords.resource
│   │   └── variables/
│   │       └── env_variables.robot
│   ├── results/                       # Relatórios gerados após execução
│   ├── tests/                         # Casos de teste automatizados (API)
│   │   ├── auth_tests.robot
│   │   ├── movie_tests.robot
│   │   ├── reservation_tests.robot
│   │   ├── session_tests.robot
│   │   ├── theater_tests.robot
│   │   └── users_admin_tests.robot
│   ├── robot_tests_suite.robot        # Arquivo mestre que chama as suítes
│   ├── .gitignore
│   └── requirements.txt               # Dependências do projeto
├── frontend-tests/
│   ├── resources/
│   ├── results/
│   ├── tests/
│   └── tests_suite_front.robot        # Suite principal de testes do Front-End
├── docs/                              # Documentação e materiais de apoio
│   ├── API_postman_REFINAMENTO.pdf
│   ├── Cinema App API - Mapa Mental.pdf
│   └── REST API basics.postman_collection.json
└── preparation/                       # Pasta para anotações, rascunhos e preparação

```

🗂️ Organização e Reporte no Jira
Todos os bugs, falhas e melhorias foram reportados e rastreados via Jira.

📌 Inclui:

Título
Descrição do BUG
Passo a passo de reprodução
Resultado esperado
Resultado Obtido
Evidência (print/log)
Prioridade
Ambiente de execução
Status e responsável

🔗 [Jira - Projeto AS (Sprint Board)](https://bremeirah.atlassian.net/jira/software/projects/AS/boards/67/backlog?selectedIssue=AS-8&atlOrigin=eyJpIjoiYmYyN2M2Mzg5ZTVkNDlkMDk4ZjlhZjNlMDM5NWVlZTIiLCJwIjoiaiJ9)

## 🧪 Execução dos Testes
- API Local
cd cinema-challenge-back 
npm install
npm run dev
- MongoDB
Foi utilizado MongoDB Atlas para armazenar os dados da aplicação, permitindo testes reais com autenticação e manipulação de sessões/reservas.

## 📌 Conclusão
O Challenge Final de Estágio QA foi essencial para consolidar meus conhecimentos em:

Testes manuais com foco em regras de negócio
Automatização prática com Robot Framework
Análise crítica e rastreabilidade de bugs
Documentação e entrega profissional
Integração com banco de dados e ambientes de execução realistas

Agradeço pela oportunidade de crescimento técnico e profissional neste desafio.

## ✒️ Autor

**Brenda Meira**  
Estagiária de Qualidade de Software  

🔗 [LinkedIn](https://www.linkedin.com/in/meirabrenda540/)  
📧 bremeirah@gmail.com  
📁 [Repositório do Estágio - Compass UOL](https://github.com/meiraBre/Compass-uol)
