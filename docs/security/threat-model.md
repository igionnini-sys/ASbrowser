# Threat model iniziale

Stato: **Draft** - Approvazione umana: Pending
Data: 2026-11-05

## Asset

| ID | Asset | Note |
|---|---|---|
| A1 | Credenziali nel Vault | Obiettivo primario |
| A2 | Password master / PIN | Mai persistiti in chiaro |
| A3 | Chiave del Vault e chiavi di dispositivo | Mai nel renderer |
| A4 | Seed TOTP, recovery key, note protette | Come A1 |
| A5 | Blob cifrati nel Cloud Safe | Il server non può decifrare |
| A6 | Canale e firme di aggiornamento | Integrità dei binari |
| A7 | Log e crash dump | Non devono contenere segreti |

## Attori ostili

1. Ladro del dispositivo (offline, copia del profilo/disco).
2. Persona con accesso fisico a dispositivo sbloccato.
3. Pagina web ostile / renderer compromesso.
4. Estensione malevola.
5. Malware a livello utente (stesso account OS).
6. Server cloud compromesso o operatore malevolo.
7. Attaccante di rete (MITM su update e sync).

## Minacce principali (STRIDE sintetico)

| ID | Minaccia | Attore | Mitigazione prevista | Fase |
|---|---|---|---|---|
| T1 | Estrazione offline del DB credenziali | 1 | Vault cifrato AEAD, KDF approvata, chiave casuale | 03 |
| T2 | Enumerazione credenziali dal renderer | 3,4 | Vault in processo separato, IPC ristretto, autofill vincolato all'origine | 02, 04 |
| T3 | Brute force PIN | 1,2 | Rate limiting, lockout dopo 3 errori, ritorno a master password | 05 |
| T4 | Autofill su origine sbagliata (phishing) | 3 | Match esatto dell'origine, conferma utente | 04 |
| T5 | Cloud decifra il Vault | 6 | E2EE, chiavi solo client | 07 |
| T6 | Update falsificato o downgrade | 7 | Firme, anti-downgrade, staging, health check | 06 |
| T7 | Corruzione/interruzione scrittura Vault | - | Scrittura atomica, snapshot, nessun "Vault vuoto" su errore | 03 |
| T8 | Segreti nei log | tutti | Policy di logging, test negativi | tutte |
| T9 | Clipboard sniffing | 5 | Cancellazione temporizzata | 04 |
| T10 | Malware con Vault sbloccato | 5 | **Fuori scope dichiarato** (non-obiettivo) | - |

## Assunzioni e limiti

- Kernel/OS integri; malware con privilegi elevati fuori scope.
- Nessuna crittografia personalizzata: solo primitive di libreria approvata (da definire in ADR crittografico, Fase 03).
- Il threat model va rivisto a ogni fase e approvato prima della Fase 01.

## Domande aperte

- Uso di DPAPI/TPM/Windows Hello come fattore aggiuntivo per il Vault locale?
- Modello di rischio per le estensioni che interagiscono con form di login.
