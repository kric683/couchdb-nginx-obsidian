# Obsidian LiveSync Backend: CouchDB + Nginx + Let’s Encrypt

This setup provides a self-hosted backend for Obsidian LiveSync using CouchDB (in Docker) with an Nginx reverse proxy for HTTPS termination, secured by Let’s Encrypt.

---

## 🔧 Architecture

- **CouchDB**: Document database storing Obsidian vault sync data.
- **Nginx**: Reverse proxy, TLS termination, ACME challenge handling.
- **Certbot**: Automates certificate issuance and renewal with Let’s Encrypt.
- **Docker Compose**: Orchestrates services, volumes, and networks.

---

## 📂 Directory Layout

