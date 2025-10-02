# Projeto de Testes Automatizados - ServeRest API

Este repositório contém o **plano de testes**, o **relatório de issues encontradas** e os **testes automatizados em Robot Framework** para a aplicação [ServeRest](https://serverest.dev/), desenvolvidos como parte do Challenge do estágio.

---

## 📌 Estrutura do Repositório


---

## 🎯 Objetivo

Garantir que a **API ServeRest** cumpra as regras de negócio definidas, validando:

- Fluxos principais (cadastro, login, produtos, carrinhos)  
- Cenários alternativos (erros de autenticação, duplicidades, limites de senha)  
- Mensagens de erro esperadas  
- Bugs encontrados durante os testes exploratórios  

---

## 🛠️ Tecnologias Utilizadas

- **Postman** → execução de testes exploratórios e coleta de evidências  
- **QAlity / Jira** → documentação e rastreabilidade dos casos de teste  
- **Robot Framework** + **RequestsLibrary** → automação dos cenários críticos  
- **Node.js + ServeRest** → execução local da API para testes  
- **GitHub** → versionamento do código e documentação  

---

## 🤖 Testes Automatizados

Os seguintes cenários foram selecionados como **candidatos à automação** e implementados no Robot Framework:

### 🔐 Login
- Login válido (gera token)  
- Login inválido (senha incorreta)  

### 👤 Usuários
- Cadastro de usuário válido  
- Cadastro de usuário duplicado  

### 📦 Produtos
- Cadastro de produto válido  
- Cadastro de produto sem autenticação  
- Exclusão de produto válido  

### 🛒 Carrinhos
- Criação de carrinho válido  
- Conclusão de compra  

---

## ▶️ Como Executar os Testes

### 1. Clonar o Repositório
```bash
git clone https://github.com/Emanuel-Felipe/Challenge-02---PB.git
cd tests-automatizados-serverest
```
### Instalar o Robot Framework e dependências
```
pip install robotframework
pip install robotframework-requests
pip install robotframework-jsonlibrary
```
### 3. Instalar Node.js (para rodar a ServeRest)

A API ServeRest roda em Node.js. Certifique-se de ter o Node.js instalado (versão 16 ou superior).
Verifique se está instalado com:
```
node -v
npm -v
```
### 4. Subir a API ServeRest localmente
Com o Node.js instalado, use o comando abaixo para rodar a API:
```
npx serverest
```
### 5. Rodar os testes automatizados
Executar todos os testes:
```
robot tests/
```
Rodar um arquivo específico:
```
robot tests/login.robot
```
---
### 📊 Evidências e Resultados

Após a execução, serão gerados automaticamente os arquivos:

report.html → Relatório detalhado

log.html → Log de execução

output.xml → Saída em XML

(Esses arquivos estão ignorados no .gitignore, para não poluir o repositório.)
---

## 👨‍💻 Autor

Projeto desenvolvido por Emanuel Felipe Avelino Silva, como parte do Challenge de Testes Automatizados (ServeRest).
