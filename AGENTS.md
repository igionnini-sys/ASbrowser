# Istruzioni per agenti (Copilot / Claude Code)

Progetto: Secure Vault Browser. Lingua dei documenti: italiano.

## Ordine di lettura
1. SPECIFICATION.md
2. DEVELOPMENT_PLAN.md
3. PROJECT_STATUS.md
4. docs/security/threat-model.md e security-invariants.md
5. ADR pertinenti in docs/adr/
6. phases/phase-XX/SPEC.md e ACCEPTANCE.md

## Regole
- Lavora solo sulla fase corrente indicata in PROJECT_STATUS.md.
- Rispetta "Task non autorizzati" in PROJECT_STATUS.md.
- Segui la procedura e le stop conditions di DEV_RULES.md.
- Non marcare mai una fase Approved: l'approvazione umana resta Pending.
- Dopo ogni sessione aggiorna REPORT.md, PROJECT_STATUS.md e PROGRESS_LOG.md.
- Nessun segreto nel repository (docs/security/secrets-policy.md).
- Nessuna nuova dipendenza o crittografia senza ADR approvato.

## Struttura repository
- docs/adr/ - decisioni architetturali
- docs/security/ - threat model, invarianti, policy
- phases/phase-XX/ - SPEC.md e ACCEPTANCE.md per fase
