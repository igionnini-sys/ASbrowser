# ADR-0001 - Scelta della base browser

Stato: **Accepted** (decisione: Chromium upstream)
Data: 2026-11-05
Approvazione umana: Approved dal Product Owner il 2026-11-05 (verifica licenze ancora aperta, vedi checklist)

## Contesto

SPECIFICATION.md §7 richiede una base Chromium (o fork approvato) che permetta:
aggiornamenti frequenti, patch ridotte, sandbox Chromium intatta, compatibilità
con le estensioni, updater personalizzato e processo Vault separato.

## Candidati

| Candidato | Pro | Contro / rischi |
|---|---|---|
| Chromium upstream | Nessun layer intermedio, sandbox e sicurezza di riferimento, patch set sotto il nostro controllo, licenza permissiva | Include servizi Google da disabilitare; build pesante; manutenzione rebase a carico nostro |
| Brave Core | Fork attivo, aggiornamenti rapidi, infrastruttura di build/CI matura | Grande superficie di codice non nostro (rewards, wallet, ads, sync proprio) in conflitto con "patch ridotte" e con il Cloud Safe; licenza MPL-2.0 da valutare |
| ungoogled-chromium | Rimuove dipendenze Google, patch set documentato, segue upstream | Progetto di patch, non prodotto: tempi di allineamento a Chromium variabili; dipendenza da maintainer esterni; Windows via build community |
| Cromite | Hardening privacy | Orientamento principale Android; licenza e supporto Windows da verificare; maintainer ridotto |

## Decisione proposta (da confermare)

**Chromium upstream**, a tag stabile, con un patch set minimo e versionato
(`patches/`), eventualmente prendendo come riferimento (non come base) le patch di
ungoogled-chromium per la rimozione dei servizi Google.

Motivazione: il Vault Service, l'updater e il Recovery Service sono componenti
nostri; più codice terzo nel Browser Process aumenta la superficie da auditare
(criterio finale: revisione indipendente). Un fork con feature proprie come Brave
Core confligge con Cloud Safe e password manager interno.

## Conseguenze

- Costo di rebase a ogni release stabile Chromium: va pianificato e misurato in Fase 01.
- Requisiti di build Windows (Visual Studio, Windows SDK, ~100+ GB disco, depot_tools) da documentare in Fase 01.
- Politica di patch: ogni patch motivata, piccola, con test.

## Da verificare prima dell'approvazione

- [ ] Licenze effettive (Chromium, dipendenze incluse, eventuale codice di riferimento ungoogled): verifica legale.
- [ ] Ritmo di rilascio e finestra di backport di sicurezza che il team può sostenere.
- [ ] Capacità hardware/CI per build complete e riproducibili.
- [ ] Policy estensioni (Manifest V3, Web Store) compatibile con "policy restrittiva".

## Alternative scartate

Da completare dopo la revisione umana. La decisione resta **del Product Owner**.
