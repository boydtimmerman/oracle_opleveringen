# Oracle SQLcl Project

Deze repository is een voorbeeld voor het gebruik van SQLcl project als tooling voor het maken releases van Oracle database en APEX code.

## Inhoudsopgave

- [Overzicht](#overzicht)
- [Folder Structuur](#folder-structuur)
- [Vereisten](#vereisten)
- [Development Stappen](#development-stappen)
  - [1. Aanmaken feature branch](#1-aanmaken-feature-branch)
  - [2. Ontwikkelwerk op file of database](#2-ontwikkelwerk-op-file-of-database)
  - [3a. Alle schema objecten exporteren](#3a-alle-schema-objecten-exporteren)
  - [3b. Specifieke objecten exporteren](#3b-specifieke-objecten-exporteren)
  - [4. Git commit export](#4-git-commit-export)
  - [5. Project stage](#5-project-stage)
  - [6. Git commit stage en push naar remote](#6-git-commit-stage-en-push-naar-remote)
  - [7. Maak pull request (PR)](#7-maak-pull-request-pr)
- [Installatie Stappen](#installatie-stappen)
  - [1a. Installatie op omgeving](#1a-omgeving-release)
  - [1b. Productie release](#1b-productie-release)
- [Versie Informatie](#versie-informatie)

## Overzicht

Dit project bevat de sample application APEXToGo. 

## Folder Structuur

```
oracle_opleveringen/
└── .dbtools
  ├── filters/
    └── project.filters           # SQL file waarbij verschillende database objecten gefilterd kunnen worden
  ├── project.config.json         # config file voor het project
  └── project.sqlformat.xml       # config file voor de formatting van SQL
├── dist         
  └── releases/
    ├── apex/
      └── apex.changelog.xml      # install file voor APEX applicaties
    ├── next/
      └── changes/
        ├── feature_folder(s)     # alle features welke worden opgenomen in de volgende release
          └── stage.changelog.xml # install file per feature
        └── release.changelog.xml # install file voor alle next items
    └── main.changelog.xml        # main install file, hier worden alle release en next installs in bijgehouden
├── src/
  └── database/
    └── project/
      ├── apex_apps/              # APEX applicaties
        └── f104/                 # Restaurant Management App (ID: 104)
      ├── package_bodies/         # PL/SQL package bodies
      ├── package_specs/          # PL/SQL package specifications
      ├── ref_constraints/        # Referentiële integriteit constraints
      ├── tables/                 # Database tabellen
      └── triggers/               # Database triggers
└── README.md   
```

## Vereisten

- **Oracle Database** 19c of hoger
- **Oracle APEX** 24.2 of hoger
- **SQLcl** 25.2 [Download](https://www.oracle.com/database/sqldeveloper/technologies/sqlcl/download/)
  > **Let op!** De gebruikte SQLcl-versie moet gelijk zijn aan de versie die is opgegeven in project.config.json.

## Development Stappen

### 1. Aanmaken feature branch
  ```bash
  ## Via command line of GUI
  git checkout -b feature/demo_1 
  ```

### 2. Ontwikkelwerk op file of database
**'Hard' objects** 
Altijd via de database ontwikkelen 
  > Voorbeelden van 'hard' objects:
  > - Tabellen  
  > - Sequences  
  > - Constraints  
  > - Indexes  

**'Soft' objects**
Kan via file of op database worden ontwikkelt 
  > Voorbeelden van 'soft' objects:
  > - Views  
  > - Packages  
  > - Procedures  
  > - Functions  
  > - Triggers  

### 3a. Alle schema objecten exporteren
  ```sql
   sql -conn {schema}
   project export -verbose
   ```
### 3b. Specifieke objecten exporteren
  ```sql
   sql -conn {schema}
   project export -v -o sample_restaurant apex.104
   ```

### 4. Git commit export
  ```bash
  ## Via command line of GUI
  ## !git wanneer je binnen SQLcl zit anders git
  !git add --all 
  !git commit -m "commit message"
  ```

### 5. Project stage
  ```sql
  -- gebruik -bn wanneer je wil vergelijken met een andere branch dan de default branch uit project.config.json
   project stage -v -bn develop 
  ```

### 6. Git commit stage en push naar remote
  ```bash
  ## Via command line of GUI
  ## !git wanneer je binnen SQLcl zit anders git
  !git add --all
  !git commit -m "commit message"
  !git push
  ```

### 7. Maak pull request (PR)
  Maak een PR aan in de git GUI en laat deze reviewen door collega

### 8. Merge pull request
  Merge het pull request na review zodat de andere ontwikkelaars gebruik kunnen maken van de nieuwe functionaliteit

## Installatie Stappen

### 1a. Omgeving release
   ```sql
   sql -conn {schema}
   project gen-artifact -name {artifact naam}
   project deploy -file artifact/{artifact naam}.zip
   ```

### 1b. Productie release
  ```sql
  project release -version {version}
  project deploy -file release/DEMO-{version}.zip
  ```

## Versie Informatie

- **Versie**: 1.0
- **Laatste Update**: Augustus 2025
- **Compatibiliteit**: Oracle Database 19c+, APEX 24.2+

