# Keycloak - Rede Auto Fácil

Servidor de autenticação Keycloak com tema personalizado para a Rede Auto Fácil.

## Deploy no Railway

### 1. Criar projeto no Railway

1. Acesse [railway.app](https://railway.app)
2. Clique em "New Project"
3. Selecione "Deploy from GitHub repo"
4. Conecte este repositório

### 2. Adicionar PostgreSQL

1. No projeto, clique em "+ New"
2. Selecione "Database" → "PostgreSQL"
3. Aguarde a criação do banco

### 3. Configurar variáveis de ambiente

No serviço do Keycloak, adicione:

```env
# Banco de dados (serão preenchidas automaticamente se usar referência)
KC_DB=postgres
KC_DB_URL=postgresql://${{Postgres.PGUSER}}:${{Postgres.PGPASSWORD}}@${{Postgres.PGHOST}}:${{Postgres.PGPORT}}/${{Postgres.PGDATABASE}}

# Hostname (substituir pelo seu domínio)
KC_HOSTNAME=redeautofacil-keycloak-production.up.railway.app
KC_HOSTNAME_STRICT=false
KC_HOSTNAME_STRICT_HTTPS=true
KC_PROXY_HEADERS=xforwarded

# Admin inicial
KC_BOOTSTRAP_ADMIN_USERNAME=admin
KC_BOOTSTRAP_ADMIN_PASSWORD=SenhaSeguraAqui123!

# HTTPS via proxy
KC_HTTP_ENABLED=true
KC_HEALTH_ENABLED=true
```

### 4. Gerar domínio público

1. Clique no serviço Keycloak
2. Vá em "Settings" → "Networking"
3. Clique em "Generate Domain"
4. Atualize `KC_HOSTNAME` com o domínio gerado

## Configuração pós-deploy

### Acessar Admin Console

1. Acesse `https://seu-dominio.railway.app/admin`
2. Login: `admin` / senha configurada

### Criar Realm

1. No menu lateral, clique no dropdown "master"
2. Clique em "Create Realm"
3. Nome: `redeautofacil`
4. Salvar

### Criar Client

1. No realm `redeautofacil`, vá em "Clients"
2. Clique em "Create client"
3. Configure:
   - Client ID: `redeautofacil-web`
   - Client type: OpenID Connect
   - Next
   - Client authentication: ON
   - Authorization: OFF
   - Next
   - Root URL: `https://redeautofacil.com.br`
   - Valid redirect URIs: `https://redeautofacil.com.br/*`, `http://localhost:3002/*`
   - Web origins: `https://redeautofacil.com.br`, `http://localhost:3002`
   - Save

### Obter credenciais

1. No client criado, vá na aba "Credentials"
2. Copie o "Client secret"

### Ativar tema personalizado

1. Vá em "Realm settings"
2. Aba "Themes"
3. Login theme: `redeautofacil`
4. Save

### Criar usuário de teste

1. Vá em "Users"
2. Clique em "Add user"
3. Preencha os dados
4. Na aba "Credentials", defina uma senha

## Configuração no Next.js

Adicione no `.env.local`:

```env
KEYCLOAK_ID=redeautofacil-web
KEYCLOAK_SECRET=seu-client-secret
KEYCLOAK_ISSUER=https://seu-dominio.railway.app/realms/redeautofacil
```

## Estrutura do tema

```
themes/redeautofacil/
├── login/
│   ├── theme.properties      # Configuração do tema
│   ├── messages/             # Traduções
│   │   ├── messages_pt_BR.properties
│   │   └── messages_en.properties
│   └── resources/
│       ├── css/
│       │   └── login.css     # Estilos personalizados
│       └── img/
│           └── logo.svg      # Logo da empresa
```

## Cores utilizadas

- Vermelho principal: `#ef4444`
- Vermelho escuro: `#dc2626`
- Preto: `#171717`
- Cinza: `#737373`
- Branco: `#ffffff`

## Suporte

Para dúvidas ou problemas, entre em contato com a equipe de desenvolvimento.
