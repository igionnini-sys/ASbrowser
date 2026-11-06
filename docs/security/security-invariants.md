# Security invariants

Stato: **Draft** - Approvazione umana: Pending

Valgono per ogni fase. Una violazione è uno stop condition.

1. Fail closed: in caso di errore il Vault resta bloccato; dati corrotti non sono mai trattati come Vault vuoto.
2. Deny by default, least privilege su IPC, processi e file.
3. Nessuna chiave, password master, PIN, seed TOTP o credenziale nel renderer.
4. Il renderer non può enumerare le credenziali; accede solo a operazioni mediate e vincolate all'origine.
5. Nessun segreto nei log, nei crash dump, nelle telemetrie o nei messaggi d'errore.
6. Nessuna crittografia personalizzata; solo primitive di libreria approvata via ADR.
7. Migrazioni del Vault transazionali e recuperabili; nessun downgrade automatico del Vault.
8. Aggiornamenti firmati, verificati, con protezione anti-downgrade.
9. La sandbox Chromium non viene indebolita.
10. Ogni funzionalità di sicurezza ha test negativi.
11. Nessun fallback insicuro; nessun test disabilitato per far passare una build.
