# 🐾 PetShop Manager

**PetShop Manager** é um sistema web de gerenciamento desenvolvido para pet shops controlarem de forma eficiente clientes, cães e serviços. O sistema permite que administradores cadastrem clientes e pets, gerenciem serviços, agendem atendimentos, apliquem descontos e gerem relatórios detalhados de serviços executados — tudo através de um ambiente seguro controlado por sessões.

<img width="1722" height="909" alt="Captura de tela 2026-01-20 143256" src="https://github.com/user-attachments/assets/c223e322-b943-4481-9660-e638836bcc3e" />

## Sobre

Este projeto foi desenvolvido como parte de um trabalho acadêmico com o objetivo de demonstrar a implementação de uma aplicação web utilizando a arquitetura **MVC (Model-View-Controller)** com **Jakarta EE**.

O foco principal é a utilização de **Servlets e JSP** para construção de interfaces dinâmicas, integração com banco de dados relacional através de JDBC, gerenciamento de sessões HTTP, validação de dados e organização do código seguindo padrões de design como Action Pattern e DAO (Data Access Object).

## Funcionalidades

- **Gerenciamento de Clientes**: Cadastro, edição e visualização de informações de clientes
- **Gerenciamento de Cães**: Registro de pets vinculados aos clientes
- **Catálogo de Serviços**: Cadastro e edição de serviços oferecidos pelo pet shop
- **Agendamento de Atendimentos**: Sistema de agendamento com controle de status (Pendente, Confirmado, Executado, Cancelado)
- **Aplicação de Descontos**: Funcionalidade para aplicar descontos personalizados em atendimentos
- **Relatórios de Serviços**: Geração de relatórios detalhados de serviços executados
- **Controle de Acesso**: Sistema de autenticação por sessão para administradores

## Tecnologias Usadas

O projeto utiliza as seguintes tecnologias e bibliotecas:

- **Java 22**: Linguagem base
- **Jakarta EE**: Plataforma para desenvolvimento web
- **Servlets**: Processamento de requisições HTTP no servidor
- **JSP (JavaServer Pages)**: Renderização de páginas dinâmicas
- **JSTL**: Biblioteca de tags para JSP
- **PostgreSQL**: SGBDR
- **Apache Tomcat 10.1**: Servidor de aplicação
- **Maven**: Gerenciamento de dependências e build

## Arquitetura do Projeto

```
PetShop-Manager/
├── src/main/java/br/tsi/petshop/
│   ├── controller/
│   │   ├── ControllerServlet.java     # Servlet principal
│   │   └── action/                    # Actions
│   │       ├── AddClientAction.java
│   │       ├── AddDogAction.java
│   │       └── ...
│   ├── dao/                            # Data Access Objects
│   │   ├── ClientDAO.java
│   │   ├── DogDAO.java
│   │   ├── ServiceDAO.java
│   │   └── AppointmentDAO.java
│   ├── model/                          # Entidades
│   │   ├── Client.java
│   │   ├── Dog.java
│   │   ├── Service.java
│   │   ├── Appointment.java
│   │   └── Admin.java
│   └── util/                           # Utilitários
│       ├── ConnectionFactory.java      # Conexão com banco de dados
│       └── Validator.java              # Validações
└── src/main/webapp/
    ├── WEB-INF/
    │   └── web.xml                     # Configuração do servlet
    └── ...                             # Páginas JSP e recursos
```

## Setup

### Requisitos

- PostgreSQL instalado e em execução
- Java 22 ou superior
- Apache Tomcat 10.1+ ou outro servidor compatível com Jakarta EE

### Configuração do Banco de Dados

#### Usando o Backup SQL (Recomendado)

Para facilitar a configuração, um script SQL completo está disponível em `database/backup.sql`.

**Passos:**

1. Crie um banco de dados vazio no PostgreSQL:
   ```sql
   CREATE DATABASE petshop;
   ```

2. Execute o script de backup:
   ```bash
   psql -U postgres -d petshop -f database/backup.sql
   ```

   Ou importe via ferramenta gráfica (pgAdmin e etc.).

3. Configure as credenciais do banco de dados em `src/main/java/br/tsi/petshop/util/ConnectionFactory.java`:
   - URL de conexão
   - Usuário
   - Senha

### Como Executar

Há duas formas de executar este projeto:

#### Opção 1: Via Maven + Servidor de Aplicação (Recomendado para Produção)

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/seu-usuario/petshop-manager.git
   cd petshop-manager
   ```

2. **Configure o banco de dados** conforme descrito acima

3. **Compile o projeto**:
   ```bash
   mvn clean install
   ```

4. **Implante o arquivo WAR** gerado em `target/petshop-manager.war` no seu servidor de aplicação:
   - Apache Tomcat 10.1+
   - WildFly
   - GlassFish

5. **Acesse a aplicação** através do navegador:
   ```
   http://localhost:8080/petshop-manager
   ```

#### Opção 2: Via Eclipse EE + Tomcat 10 (Desenvolvimento)

Esta foi a configuração utilizada durante o desenvolvimento do projeto:

**Pré-requisitos:**
- Eclipse IDE for Enterprise Java and Web Developers
- Apache Tomcat 10.1+ instalado
- PostgreSQL rodando localmente

**Passos:**

1. **Importar o projeto**:
   - File → Import → Existing Maven Projects
   - Selecione a pasta do projeto
   - Aguarde o Eclipse baixar as dependências Maven

2. **Configurar o Tomcat no Eclipse**:
   - Window → Preferences → Server → Runtime Environments
   - Add → Apache Tomcat v10.1
   - Aponte para o diretório de instalação do Tomcat
   - Apply and Close

3. **Adicionar projeto ao servidor**:
   - Aba "Servers" (inferior) → Botão direito no Tomcat → Add and Remove
   - Mova o projeto de "Available" para "Configured"
   - Finish

4. **Executar**:
   - Botão direito no projeto → Run As → Run on Server
   - Selecione o Tomcat 10.1 configurado
   - Finish
   - O navegador abrirá automaticamente em `http://localhost:8080/PetshopManager`

## Credenciais de Acesso

Após executar o script SQL de backup, você poderá acessar com as seguintes credenciais de administrador:

- **Usuário**: `admin`
- **Senha**: `admin`

## Observações

- **Sessões**: O sistema utiliza sessões HTTP para controle de acesso
- **Validações**: Validações são feitas tanto no front-end quanto no back-end
- **Banco de Dados**: A conexão é gerenciada através do padrão Factory
- **Status de Atendimento**: Os atendimentos passam pelos estados: Pendente → Confirmado → Executado ou Cancelado
