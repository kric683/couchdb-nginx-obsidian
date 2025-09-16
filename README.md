# couchdb-nginx-obsidian
# Self-Hosted Obsidian LiveSync via CouchDB — Setup on Ubuntu + Docker + Nginx + Let’s Encrypt
# Obsidian LiveSync Setup with CouchDB & HTTPS

Simple setup summary:

---

## What’s in place

- CouchDB running inside Docker with persistent data storage.  
- Nginx reverse proxy for HTTPS termination and forwarding to CouchDB.  
- HTTP → HTTPS redirect and Let’s Encrypt certificate issuance + renewal.  
- A reload script that validates Nginx config and reloads it after cert renewals.

---

## Key Configurations

- Nginx config uses **`listen 443 ssl;`** and **`http2 on;`** to enable HTTP/2 correctly.  
- Nginx serves ACME HTTP-01 challenges from a `/.well-known/acme-challenge/` webroot directory.  
- Certificates live in the standard Let’s Encrypt `live/…` directory, mounted into nginx.  
- Renewal cron job or scheduled task runs `certbot renew`, and then triggers a script to reload nginx only if renewal was successful.  
- CouchDB data directory set with permissions so the CouchDB user inside the container has write access; avoids restart loops.

---

## How to Verify

- Run `nginx -t` to check syntax.  
- Check listening ports: HTTP (80), HTTPS (443).  
- Confirm cert files exist for fullchain + privkey.  
- Curl the HTTPS endpoint and expect a valid response.  
- Test renewal manually and ensure nginx reloads properly.

---

## Common Issues & Fixes

| Issue | Fix |
|-------|-----|
| Nginx rejects `http2` on listen line | Use `listen 443 ssl;` + `http2 on;` instead. |
| Missing cert or nginx fails to load | Mount cert directory properly and ensure permissions are correct. |
| CouchDB restarting repeatedly | Fix ownership/permissions of data directory so container user can write. |
| Renewals run but nginx doesn’t reload | Make sure reload script is executable and cron/deploy hook is set up. |

---

## Maintenance

- Keep Docker images up to date.  
- Monitor certificate expiry and renewals.  
- Backup CouchDB data regularly.  
- Review nginx logs for any errors after renewals or config changes.

---

