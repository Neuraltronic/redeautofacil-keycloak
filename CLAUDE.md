# CLAUDE.md

Este arquivo fornece orientações ao Claude Code (claude.ai/code) para trabalhar com este repositório.

## Idioma / Language

**IMPORTANTE:** Sempre se comunique em **Português Brasileiro**. Todas as respostas, mensagens de commit e documentação devem ser em PT-BR.

## Visão Geral

Servidor Keycloak com tema personalizado para autenticação da Rede Auto Fácil. Fornece SSO (Single Sign-On) para o painel administrativo do website.

## Arquitetura

```
redeautofacil-keycloak/
├── Dockerfile          # Build do Keycloak com tema
├── railway.toml        # Configuração Railway
└── themes/
    └── redeautofacil/
        └── login/      # Tema de login personalizado
            ├── theme.properties
            ├── messages/
            │   ├── messages_pt_BR.properties
            │   └── messages_en.properties
            └── resources/
                ├── css/login.css
                └── img/logo.svg
```

## Deploy no Railway

1. **Dockerfile** constrói imagem Keycloak com tema customizado
2. **railway.toml** configura build e start
3. Banco PostgreSQL gerenciado pelo Railway

## Variáveis de Ambiente Críticas

```env
KC_DB=postgres
KC_DB_URL=postgresql://...
KC_HOSTNAME=dominio.railway.app
KC_BOOTSTRAP_ADMIN_USERNAME=admin
KC_BOOTSTRAP_ADMIN_PASSWORD=senha-segura
```

## Configuração do Realm

- **Realm:** `redeautofacil`
- **Client:** `redeautofacil-web` (OpenID Connect, confidential)
- **Roles:** `admin`, `editor`

## Integração com Next.js

O website usa NextAuth.js v5 com provider Keycloak:

```env
AUTH_KEYCLOAK_ID=redeautofacil-web
AUTH_KEYCLOAK_SECRET=client-secret
AUTH_KEYCLOAK_ISSUER=https://dominio.railway.app/realms/redeautofacil
```

## Tema Personalizado

Cores da marca:
- Vermelho principal: `#ef4444`
- Vermelho escuro: `#dc2626`
- Preto: `#171717`

## Comandos Úteis (local)

```bash
# Rodar Keycloak localmente
docker build -t redeautofacil-keycloak .
docker run -p 8080:8080 -e KC_BOOTSTRAP_ADMIN_USERNAME=admin -e KC_BOOTSTRAP_ADMIN_PASSWORD=admin redeautofacil-keycloak
```
