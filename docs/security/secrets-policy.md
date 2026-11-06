# Policy dei segreti

Stato: **Draft** - Approvazione umana: Pending

- Nessun segreto (chiavi, token, password, certificati di firma) nel repository, nei prompt o nei log.
- Chiavi di firma di produzione: fuori dal repository e dalla CI standard; custodia da definire in Fase 06.
- File `.env`, `*.pfx`, `*.key`, `*.pem` privati sono esclusi via `.gitignore`.
- Dati di test: solo valori sintetici, marcati come tali.
- Scansione dei segreti (pre-commit e CI) da introdurre appena esiste il repository git.
- Un segreto committato per errore va considerato compromesso e ruotato.
