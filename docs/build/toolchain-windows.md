# Toolchain di build - Windows x64 (bozza)

Base: Chromium upstream (ADR-0001). Riferimento ufficiale: documentazione "Checking out and building Chromium for Windows" di chromium.org; i requisiti esatti vanno ricontrollati sul tag scelto.

## Requisiti indicativi
- Windows 10/11 x64, disco NTFS con >= 200 GB liberi (checkout + build), RAM >= 32 GB consigliati.
- Visual Studio (versione richiesta dal tag) con workload "Desktop development with C++", MFC/ATL, Windows SDK indicato dalla documentazione upstream.
- depot_tools nel PATH (fornisce gclient, gn, autoninja e il proprio Python).
- Git per Windows con `core.autocrlf false`, `core.filemode false`, `core.preloadindex true`.
- Antivirus: esclusione della cartella di checkout per tempi di build ragionevoli (valutazione di sicurezza a carico del team).

## Procedura (da validare in Fase 01)
1. `scripts\check-env.ps1` deve terminare con "Ambiente pronto".
2. Installare depot_tools; `gclient` in PATH.
3. `fetch --nohooks chromium` in una cartella a percorso corto (es. `C:\src`).
4. `git checkout <tag stabile>` e `gclient sync -D`; **registrare tag e commit** in REPORT.md.
5. `gn gen out\Debug` / `out\Release`; `autoninja -C out\Debug chrome`.
6. Archiviare i log di build e avviare `chrome.exe`.

## Stato
Nessun passo eseguito. Il tag stabile da usare è da scegliere con il Product Owner.
