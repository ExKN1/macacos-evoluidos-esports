# Macacos Evoluídos — Site de E-sports

Site de uma equipe fictícia de **VALORANT** e **League of Legends**, desenvolvido como projeto acadêmico de desenvolvimento web.

A aplicação reúne páginas institucionais, apresentação dos jogadores e um formulário de contato integrado a um banco **MySQL**. O servidor utiliza **Python e Flask**, com páginas renderizadas por templates **Jinja** e interface construída com **HTML, CSS e Bootstrap**.

> A equipe, os jogadores, os campeonatos e os resultados são fictícios. Imagens e parte das descrições foram produzidas com auxílio de inteligência artificial.

## Funcionalidades

- **Página inicial:** apresentação da equipe e carrossel de destaques.
- **Sobre:** história da organização e apresentação do elenco.
- **Contato:** formulário com e-mail, assunto e descrição.
- **Persistência:** armazenamento das mensagens no MySQL.
- **Listagem:** consulta das mensagens recebidas, da mais recente para a mais antiga.
- **Feedback:** avisos de sucesso, campos não preenchidos e falhas de acesso ao banco.
- **Interface responsiva:** uso de Flexbox e componentes do Bootstrap para adaptação a diferentes telas.

O formulário grava a mensagem no banco de dados; ele não envia e-mails.

## Tecnologias

| Tecnologia | Uso |
| --- | --- |
| Python | Lógica da aplicação |
| Flask | Rotas HTTP e renderização das páginas |
| Jinja | Templates e reaproveitamento do layout |
| MySQL | Armazenamento das mensagens |
| PyMySQL | Conexão entre Python e MySQL |
| python-dotenv | Leitura das variáveis do arquivo `.env` |
| HTML5 e CSS3 | Estrutura e estilos |
| Bootstrap 5.3.3 | Navegação, carrossel, cards, formulários e grid |

As dependências Python e suas versões estão em [requirements.txt](requirements.txt).

## Organização do projeto

| Caminho | Conteúdo |
| --- | --- |
| `app.py` | Aplicação Flask, rotas e consultas ao banco |
| `requirements.txt` | Dependências Python |
| `.env.example` | Modelo de configuração do banco |
| `templates/base.html` | Layout compartilhado, navegação e rodapé |
| `templates/index.html` | Página inicial |
| `templates/sobre.html` | Informações sobre a equipe |
| `templates/contato.html` | Formulário de contato |
| `templates/listar.html` | Listagem de mensagens |
| `static/css/style.css` | Estilos personalizados |
| `static/images/` | Logos e ilustrações SVG |

## Como executar localmente

Os comandos abaixo são para Windows, executados no terminal dentro da pasta do projeto.

### 1. Preparar os programas

Tenha **Python 3**, com suporte a `venv` e `pip`, e um servidor **MySQL** instalado e em execução. O MySQL Workbench é opcional e pode ser usado para executar o SQL.

Baixe este repositório em **Code → Download ZIP** e extraia os arquivos. Se preferir usar Git:

```bash
git clone https://github.com/ExKN1/Atvweb2.git
cd Atvweb2
```

### 2. Criar o ambiente e instalar as dependências

```powershell
python -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements.txt
```

Esses comandos usam diretamente o Python do ambiente virtual, sem precisar ativá-lo.

### 3. Criar o banco de dados

Para uma instalação nova, execute o SQL abaixo no MySQL. Ele cria uma estrutura compatível com os campos utilizados pela aplicação:

```sql
CREATE DATABASE IF NOT EXISTS atividade4
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE atividade4;

CREATE TABLE IF NOT EXISTS mensagens (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(254) NOT NULL,
    assunto VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    data_envio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
```

Se você já possui a tabela, confira sua estrutura: `CREATE TABLE IF NOT EXISTS` não altera uma tabela existente.

### 4. Configurar as variáveis de ambiente

Copie `.env.example` para um novo arquivo chamado `.env`, na mesma pasta de `app.py`, e preencha os dados:

```dotenv
DB_HOST=127.0.0.1
DB_PORT=3306
DB_USER=seu_usuario_mysql
DB_PASSWORD=sua_senha_mysql
DB_NAME=atividade4
SECRET_KEY=substitua_por_uma_chave_aleatoria
```

Use um usuário MySQL com permissão para consultar e inserir registros na tabela. Os valores acima são exemplos e devem ser substituídos pela sua configuração.

Para gerar um valor aleatório para `SECRET_KEY`:

```powershell
.\.venv\Scripts\python.exe -c "import secrets; print(secrets.token_hex(32))"
```

Copie o resultado para `SECRET_KEY` no arquivo `.env`. O Flask utiliza essa chave para assinar a sessão, incluindo os avisos exibidos ao usuário.

**Não publique o arquivo `.env` nem credenciais reais no repositório.**

### 5. Iniciar a aplicação

```powershell
.\.venv\Scripts\python.exe app.py
```

Acesse no navegador:

**http://127.0.0.1:5000**

Para encerrar o servidor, pressione **Ctrl+C** no terminal.

As páginas utilizam templates Flask/Jinja. Para executar a aplicação completa, inicie o servidor em vez de abrir os arquivos HTML diretamente.

## Rotas

| Rota | Métodos | Função |
| --- | --- | --- |
| `/` | GET | Página inicial |
| `/sobre` | GET | Apresentação da equipe |
| `/contato` | GET, POST | Exibição e envio do formulário |
| `/cadastro` | GET, POST | Acesso ao mesmo formulário, mantido para a atividade acadêmica |
| `/listar` | GET | Listagem das mensagens salvas |

## Como conferir o funcionamento

1. Inicie o MySQL e a aplicação Flask.
2. Abra a página de contato.
3. Preencha o formulário com dados fictícios e envie.
4. Confira o aviso de sucesso e o registro na listagem.
5. Recarregue a página para verificar que a mensagem continua armazenada.
6. Confira a navegação e o formulário em uma tela estreita.

Também é possível consultar os registros diretamente no MySQL:

```sql
SELECT id, email, assunto, descricao, data_envio
FROM atividade4.mensagens
ORDER BY id DESC;
```

## Escopo e limitações

- Projeto acadêmico com conteúdo fictício.
- A listagem de mensagens não possui autenticação. Utilize somente dados fictícios em demonstrações; o painel precisa de controle de acesso antes de receber mensagens reais.
- O servidor verifica se os campos estão preenchidos. Validações adicionais de e-mail, tamanho dos campos e assuntos permitidos são melhorias futuras.
- A aplicação permite cadastrar e consultar mensagens; edição e exclusão não estão implementadas.
- O Bootstrap é carregado por CDN e depende de conexão com a internet.
- O servidor iniciado por `python app.py` é voltado ao desenvolvimento. Uma publicação precisa de configuração própria de hospedagem.
- O GitHub Pages não executa o backend Python nem a integração com MySQL.

## Autor

**Enzo Ramos de Almeida**  
[GitHub — ExKN1](https://github.com/ExKN1)

