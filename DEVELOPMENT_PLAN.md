\# Secure Vault Browser - Piano di sviluppo



\## Regole generali



Ogni fase deve:



1\. avere una specifica locale;

2\. avere un prompt operativo;

3\. contenere acceptance criteria;

4\. produrre test;

5\. produrre un report;

6\. aggiornare PROJECT\_STATUS.md;

7\. essere revisionata prima della fase successiva.



Una fase non può essere marcata Completed se:



\- la build non passa;

\- i test obbligatori non passano;

\- esistono errori critici aperti;

\- la documentazione non è aggiornata;

\- mancano prove verificabili.



\## Fase 00 - Fondazione



Obiettivo:

creare il sistema documentale e definire la base del progetto.



Deliverable:



\- SPECIFICATION.md;

\- DEVELOPMENT\_PLAN.md;

\- PROJECT\_STATUS.md;

\- threat model iniziale;

\- ADR-0001;

\- struttura repository;

\- istruzioni Copilot;

\- policy dei segreti.



Exit criteria:



\- base browser selezionata;

\- licenza preliminarmente verificata;

\- scope MVP congelato;

\- threat model approvato;

\- nessun codice di produzione ancora richiesto.



\## Fase 01 - Build del browser



Obiettivo:

ottenere una build ripetibile della base scelta.



Deliverable:



\- checkout automatizzato;

\- build Debug;

\- build Release;

\- avvio del browser;

\- branding temporaneo;

\- documentazione della toolchain;

\- log di build;

\- script di verifica ambiente.



Exit criteria:



\- build completata da ambiente pulito;

\- revisione upstream registrata;

\- browser avviabile;

\- procedura documentata;

\- nessuna modifica di sicurezza ancora introdotta.



\## Fase 02 - Vault Service skeleton



Obiettivo:

creare un processo Vault separato senza crittografia reale.



Deliverable:



\- processo separato;

\- IPC minimo;

\- stato Locked;

\- stato Unlocked simulato;

\- timeout;

\- restart;

\- test negativi.



Exit criteria:



\- il renderer non apre direttamente il Vault;

\- IPC ristretto;

\- crash del Vault non compromette il browser;

\- test del ciclo di vita superati.



\## Fase 03 - Vault cifrato locale



Obiettivo:

implementare storage cifrato e versionato.



Deliverable:



\- formato Vault;

\- KDF approvata;

\- chiave del Vault casuale;

\- cifratura autenticata;

\- scrittura atomica;

\- snapshot cifrato;

\- migrazione iniziale;

\- recovery.



Exit criteria:



\- test di alterazione superati;

\- password errata rifiutata;

\- dati corrotti non trattati come Vault vuoto;

\- interruzione durante la scrittura recuperabile;

\- ADR crittografico approvato.



\## Fase 04 - Password manager



Obiettivo:

integrare salvataggio e autofill controllato.



\## Fase 05 - PIN e dispositivo fidato



Obiettivo:

aggiungere sblocco locale e policy dei tentativi.



\## Fase 06 - Updater e rollback



Obiettivo:

implementare aggiornamenti firmati, staging e recupero.



\## Fase 07 - Cloud Safe



Obiettivo:

aggiungere sincronizzazione end-to-end encrypted.



\## Fase 08 - Portable



Obiettivo:

creare launcher portable, slot A/B e recovery offline.



\## Fase 09 - Audit e hardening



Obiettivo:

completare fuzzing, penetration test, revisione dipendenze e audit esterno.

