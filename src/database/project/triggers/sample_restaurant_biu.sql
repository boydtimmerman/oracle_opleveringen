create or replace editionable trigger sample_restaurant_biu before
    insert or update on sample_restaurant
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
end sample_restaurant_biu;
/

alter trigger sample_restaurant_biu enable;


-- sqlcl_snapshot {"hash":"f37fa6cd1f15741a34e0eb8a7515e73066354a1b","type":"TRIGGER","name":"SAMPLE_RESTAURANT_BIU","schemaName":"PROJECT","sxml":""}