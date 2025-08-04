-- liquibase formatted sql
-- changeset PROJECT:1754310247307 stripComments:false  logicalFilePath:featuredemo_1\project\views\vw_alea_demo.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/project/views/vw_alea_demo.sql:null:26ec6b03403724c47ccf0b38a1ff4087039e350b:create

create or replace force editionable view vw_alea_demo (
    datum
) as
    select
        sysdate as datum
    from
        dual;

