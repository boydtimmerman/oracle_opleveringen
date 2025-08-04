create or replace force editionable view vw_alea_demo (
    datum
) as
    select
        sysdate as datum
    from
        dual;


-- sqlcl_snapshot {"hash":"26ec6b03403724c47ccf0b38a1ff4087039e350b","type":"VIEW","name":"VW_ALEA_DEMO","schemaName":"PROJECT","sxml":""}