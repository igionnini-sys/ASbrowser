\# Secure Vault Browser - Specifiche di prodotto



\## 1. Stato del documento



Versione: 0.1

Stato: Draft

Ultimo aggiornamento: YYYY-MM-DD

Approvato da: Product Owner



\## 2. Visione



Secure Vault Browser è un browser desktop security-first basato su Chromium

o su un fork Chromium approvato.



Il prodotto tratta password, credenziali e dati di autenticazione come

materiale appartenente a una cassaforte separata dal normale profilo browser.



\## 3. Problema



I browser tradizionali conservano password, cookie, sessioni e altri dati

sensibili in componenti strettamente collegati al profilo locale.



Il progetto vuole ridurre:



\- furto offline dei dati;

\- copia del profilo;

\- estrazione dei database standard;

\- accesso occasionale non autorizzato;

\- uso del browser da parte di una persona che trova il dispositivo sbloccato;

\- compromissione dello storage cloud.



\## 4. Obiettivi



\- Browser desktop compatibile con il Web moderno.

\- Supporto alle estensioni Chromium secondo una policy restrittiva.

\- Secure Vault separato.

\- Password manager interno privilegiato.

\- Sblocco con password master.

\- PIN per dispositivi autorizzati.

\- Secondo fattore per registrazione e recupero.

\- Cloud Safe con cifratura end-to-end.

\- Aggiornamenti firmati.

\- Rollback sicuro.

\- Possibile versione portable.



\## 5. Non-obiettivi



Il prodotto non promette:



\- immunità da malware;

\- protezione completa con kernel compromesso;

\- protezione completa mentre il Vault è sbloccato;

\- anonimato equivalente a Tor;

\- proxy pubblici sconosciuti come opzione predefinita;

\- assenza assoluta di artefatti nella modalità portable.



\## 6. Piattaforme



\### MVP



\- Windows x64.



\### Future



\- Linux x64.

\- macOS.

\- Android da valutare separatamente.



\## 7. Base browser



La scelta deve essere definita in ADR-0001.



Candidati:



\- Brave Core;

\- Chromium;

\- ungoogled-chromium;

\- Cromite.



La base scelta deve permettere:



\- aggiornamenti frequenti;

\- patch ridotte;

\- sandbox Chromium;

\- compatibilità con estensioni;

\- updater personalizzato;

\- processo Vault separato.



\## 8. Modello dei processi



\- Browser Process.

\- Renderer Process.

\- GPU Process.

\- Network Service.

\- Secure Vault Service.

\- Updater.

\- Recovery Service.

\- Cloud Sync Client.



Il Renderer non deve accedere direttamente al database del Vault.



\## 9. Secure Vault



Il Vault deve memorizzare:



\- credenziali;

\- note protette;

\- impostazioni sensibili;

\- eventuali seed TOTP dei siti;

\- metadati strettamente necessari.



Il Vault non deve memorizzare in chiaro:



\- password master;

\- PIN;

\- chiavi private;

\- credenziali;

\- recovery key;

\- seed TOTP.



\## 10. Autenticazione



\### Nuovo dispositivo



\- Identificatore account.

\- Password master.

\- Secondo fattore.

\- Registrazione della chiave del dispositivo.

\- Creazione opzionale del PIN.



\### Dispositivo fidato



\- PIN, password master o autenticazione di sistema.

\- Timeout configurabile.

\- Nuovo sblocco all'avvio o dopo la scadenza.



\### Errori PIN



Dopo tre errori PIN:



\- disabilitare temporaneamente lo sblocco tramite PIN;

\- richiedere password master;

\- richiedere secondo fattore quando il cloud è disponibile;

\- applicare rate limiting.



\### Errori password master



Dopo tre errori nella procedura di recupero:



\- revocare lo stato locale di dispositivo fidato;

\- eliminare i token locali di fiducia;

\- richiedere una nuova autorizzazione completa;

\- non cancellare automaticamente il Vault.



\## 11. Password manager



\- Salvataggio credenziali.

\- Aggiornamento credenziali.

\- Generatore di password.

\- Ricerca.

\- Autofill vincolato all'origine.

\- Riautenticazione per mostrare o copiare una password.

\- Importazione controllata.

\- Esportazione protetta.

\- Audit locale delle password.

\- Clipboard con cancellazione temporizzata.



\## 12. Cloud Safe



Il server deve memorizzare esclusivamente blob cifrati e metadati minimizzati.



Il server non deve possedere chiavi sufficienti per decifrare il Vault.



Il cloud deve supportare:



\- versionamento;

\- sincronizzazione;

\- rilevamento conflitti;

\- gestione dispositivi;

\- revoca;

\- backup cifrato;

\- recovery.



\## 13. Aggiornamenti



Gli aggiornamenti devono essere:



\- firmati;

\- verificati;

\- installati in staging;

\- attivati atomicamente;

\- sottoposti a health check;

\- protetti contro downgrade;

\- compatibili con il formato Vault.



\## 14. Rollback



Separare sempre:



\- rollback dei binari;

\- rollback delle configurazioni;

\- rollback dei componenti;

\- ripristino del profilo;

\- recovery del Vault.



Non eseguire automaticamente il downgrade del Vault.



\## 15. Versione portable



La modalità portable deve:



\- mantenere browser e Vault sul supporto scelto;

\- verificare gli aggiornamenti;

\- usare slot A/B;

\- minimizzare gli artefatti locali;

\- non promettere assenza assoluta di tracce;

\- supportare recovery offline.



\## 16. Requisiti di sicurezza



\- Fail closed.

\- Least privilege.

\- Deny by default.

\- Nessun segreto nei log.

\- Nessuna crittografia personalizzata.

\- Nessuna chiave nel renderer.

\- IPC ristretto.

\- Migrazioni transazionali.

\- Aggiornamenti firmati.

\- Protezione anti-downgrade.

\- Test negativi obbligatori.



\## 17. Criteri finali di accettazione



Il prodotto non è considerato pronto finché:



\- la build è riproducibile;

\- il Vault è separato;

\- il renderer non può enumerare le credenziali;

\- il Vault resiste alla copia offline secondo il threat model;

\- le migrazioni sono recuperabili;

\- il rollback è testato;

\- l'updater verifica le firme;

\- il cloud non può decifrare il Vault;

\- non sono presenti segreti nei log;

\- è stata eseguita una revisione indipendente.

