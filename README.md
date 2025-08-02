# Oracle SQLcl Project

Deze repository is een voorbeeld voor het gebruik van SQLcl project als tooling voor het maken releases van Oracle database en APEX code.

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

### Vereisten

- Oracle Database 19c of hoger
- Oracle APEX 24.2 of hoger
- SQLcl 25.2                    # de gebruikte SQLcl versie moet gelijk zijn aan de versie die staat in `project.config.json`

### Installatie Stappen

1 **Database Connectie**
   ```sql
   sql {connection-string}
   ```

2a. **Omgeving release**
   ```sql
   project gen-artifact -version {version}
   project deploy -file artifact/{PROJECTNAAM}-{version}.zip
   ```

2b. **Productie release**
  ```sql
   project release -version {version}
   project deploy -file release/{PROJECTNAAM}-{version}.zip
   ```

## Versie Informatie

- **Versie**: 1.0
- **Laatste Update**: Augustus 2025
- **Compatibiliteit**: Oracle Database 19c+, APEX 24.2+

