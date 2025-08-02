create or replace editionable trigger sample_restaurant_items_biu before
    insert or update on sample_restaurant_items
    for each row
begin
    if inserting then
        :new.created := sysdate;
        :new.created_by := coalesce(
            sys_context('APEX$SESSION', 'APP_USER'),
            user
        );
    end if;

    :new.updated := sysdate;
    :new.updated_by := coalesce(
        sys_context('APEX$SESSION', 'APP_USER'),
        user
    );
end sample_restaurant_items_biu;
/

alter trigger sample_restaurant_items_biu enable;


-- sqlcl_snapshot {"hash":"0144ce014f3344c4a282ba85c441abce752c50d1","type":"TRIGGER","name":"SAMPLE_RESTAURANT_ITEMS_BIU","schemaName":"PROJECT","sxml":""}