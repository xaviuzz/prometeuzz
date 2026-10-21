# Timeline de specs de fotoAlbum

Horas sacadas de los commits de PrometeuZZ y de los subrepos de `Sandbox/fotoAlbum`. Son horas de commit, no de trabajo: la ventana real puede ser algo mayor y las pausas no se descuentan.

## Visión general

```mermaid
timeline
    title Del 12 al 21 de octubre de 2026
    12-oct : Repo inicial : Skill commit-message
    13-oct : Reglas de estilo : Regla de TDD
    15-oct : Skills clean y new-obsidian-plugin : Spec new-obsidian-plugin
    16-oct : Doctrinas learning y contributing : Harnesses
    17-oct : Boilerplates de backend, frontend y e2e : Skill new-webapp
    18-oct : Specs choose-album y anonymous-session
    19-oct : Specs photo-tray, user-album y backend-refactor
    21-oct : Spec frontend-api-refactor : Ítem 7 de backend-refactor : Diagramas en specs : Spec slots
```

## 17 de octubre: boilerplates

```mermaid
gantt
    title 17-oct
    dateFormat YYYY-MM-DD HH:mm
    axisFormat %H:%M
    section Preparación
    Umbrella y harness fotoAlbum        :2026-10-17 11:38, 2026-10-17 12:37
    section Specs
    backend-boilerplate                 :2026-10-17 12:37, 2026-10-17 13:41
    frontend-boilerplate                :2026-10-17 14:03, 2026-10-17 15:14
    e2e-boilerplate                     :2026-10-17 15:14, 2026-10-17 15:46
    section Meta
    Skill new-webapp                    :2026-10-17 22:30, 2026-10-17 22:52
```

## 18 de octubre: primeras slices

```mermaid
gantt
    title 18-oct
    dateFormat YYYY-MM-DD HH:mm
    axisFormat %H:%M
    section Specs
    choose-album                        :2026-10-18 12:27, 2026-10-18 13:53
    Decisión de diseño en Penpot        :2026-10-18 13:53, 2026-10-18 14:26
    anonymous-session                   :2026-10-18 14:26, 2026-10-18 15:18
```

## 19 de octubre: slices y refactor

```mermaid
gantt
    title 19-oct
    dateFormat YYYY-MM-DD HH:mm
    axisFormat %H:%M
    section Specs
    photo-tray                          :2026-10-19 10:10, 2026-10-19 10:55
    user-album                          :2026-10-19 11:58, 2026-10-19 13:18
    backend-refactor                    :2026-10-19 19:27, 2026-10-19 21:24
    section Meta
    Índice de decisiones por área       :2026-10-19 11:32, 2026-10-19 11:39
```

## 21 de octubre: refactor del frontend, cierre del backend y slots

```mermaid
gantt
    title 21-oct
    dateFormat YYYY-MM-DD HH:mm
    axisFormat %H:%M
    section Specs
    frontend-api-refactor               :2026-10-21 10:19, 2026-10-21 10:35
    backend-refactor (ítem 7)           :2026-10-21 17:18, 2026-10-21 17:45
    slots                               :2026-10-21 17:57, 2026-10-21 19:17
    section Meta
    Diagramas en specs y doc de slot    :2026-10-21 09:52, 2026-10-21 10:19
```

## Resumen

| Spec | Día | Inicio | Fin | Duración aprox. |
|------|-----|--------|-----|-----------------|
| backend-boilerplate | 17-oct | 12:37 | 13:41 | 1 h |
| frontend-boilerplate | 17-oct | 14:03 | 15:14 | 1 h 10 min |
| e2e-boilerplate | 17-oct | 15:14 | 15:46 | 30 min |
| choose-album | 18-oct | 12:27 | 13:53 | 1 h 30 min |
| anonymous-session | 18-oct | 14:26 | 15:18 | 50 min |
| photo-tray | 19-oct | 10:10 | 10:55 | 45 min |
| user-album | 19-oct | 11:58 | 13:18 | 1 h 20 min |
| backend-refactor | 19-oct | 19:27 | 21:24 | 2 h |
| frontend-api-refactor | 21-oct | 10:19 | 10:35 | 16 min |
| backend-refactor (ítem 7) | 21-oct | 17:18 | 17:45 | 27 min |
| slots | 21-oct | 17:57 | 19:17 | 1 h 20 min |
