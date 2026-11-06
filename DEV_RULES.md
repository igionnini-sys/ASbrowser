\# Prompt fase XX



\## Ruolo



Agisci come senior software engineer specializzato in Chromium e sicurezza.



\## Fonti obbligatorie



Prima di operare, leggi:



\- SPECIFICATION.md

\- DEVELOPMENT\_PLAN.md

\- PROJECT\_STATUS.md

\- AGENTS.md

\- docs/security/threat-model.md

\- docs/security/security-invariants.md

\- tutti gli ADR pertinenti

\- phases/phase-XX/SPEC.md

\- phases/phase-XX/ACCEPTANCE.md



\## Obiettivo



Descrivere qui un solo obiettivo verificabile.



\## Scope consentito



\- Elenco dei componenti modificabili.

\- Elenco dei file modificabili.

\- Elenco delle funzionalità ammesse.



\## Fuori scope



\- Funzionalità non appartenenti alla fase.

\- Refactoring non richiesti.

\- Nuove dipendenze non approvate.

\- Cambiamenti crittografici non previsti.

\- Cambiamenti alle fasi future.



\## Procedura obbligatoria



Prima di modificare file:



1\. riassumi la comprensione del task;

2\. segnala conflitti tra documenti;

3\. elenca le assunzioni;

4\. elenca i rischi;

5\. indica i file che intendi modificare;

6\. proponi un piano;

7\. indica i test;

8\. fermati se manca una decisione necessaria.



Durante l'implementazione:



1\. lavora per incrementi piccoli;

2\. non ampliare lo scope;

3\. non nascondere errori;

4\. non disabilitare test;

5\. non aggiungere fallback insicuri;

6\. mantieni aggiornati i commenti pertinenti.



Dopo l'implementazione:



1\. esegui i test richiesti;

2\. registra i comandi;

3\. registra i risultati;

4\. aggiorna REPORT.md;

5\. aggiorna PROJECT\_STATUS.md;

6\. aggiungi una nuova voce a PROGRESS\_LOG.md;

7\. non marcare la fase Approved;

8\. imposta l'approvazione umana su Pending.



\## Output richiesto



\- Codice della fase.

\- Test.

\- REPORT.md aggiornato.

\- PROJECT\_STATUS.md aggiornato.

\- Nuova voce in PROGRESS\_LOG.md.

\- Elenco dei rischi residui.



\## Stop conditions



Fermati senza improvvisare se:



\- le specifiche sono contraddittorie;

\- serve una nuova dipendenza;

\- serve modificare la crittografia;

\- serve indebolire la sandbox;

\- serve esporre segreti al renderer;

\- una migrazione può perdere dati;

\- i test rivelano corruzione;

\- non è possibile verificare il risultato.

