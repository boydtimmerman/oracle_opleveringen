create or replace package body sample_restaurant_manage_orders as

    procedure add_item (
        p_item_id  in number,
        p_quantity in number,
        p_utensils in varchar2,
        p_note     in varchar2
    ) is
    begin
        if not apex_collection.collection_exists(p_collection_name => c_items) then
            apex_collection.create_collection(p_collection_name => c_items);
        end if;

        apex_collection.add_member(
            p_collection_name => c_items,
            p_n001            => p_item_id,
            p_n002            => p_quantity,
            p_c001            => p_utensils,
            p_c002            => p_note
        );

    end add_item;

    procedure remove_item (
        p_item_id in number
    ) is
        l_id number;
    begin
        if apex_collection.collection_exists(p_collection_name => c_items) then
            select
                seq_id
            into l_id
            from
                apex_collections a
            where
                    collection_name = c_items
                and a.n001 = p_item_id;

            apex_collection.delete_member(
                p_collection_name => c_items,
                p_seq             => l_id
            );
        end if;
    end remove_item;

    function get_quantity return number is
        l_items number := 0;
    begin
        if apex_collection.collection_exists(p_collection_name => c_items) then
            select
                sum(n002)
            into l_items
            from
                apex_collections a
            where
                collection_name = c_items;

        end if;

        return l_items;
    end get_quantity;

    function get_utensils (
        p_item_id in number
    ) return varchar2 is
        l_utensils varchar2(2);
    begin
        if apex_collection.collection_exists(p_collection_name => c_items) then
            select
                a.c001
            into l_utensils
            from
                apex_collections a
            where
                    collection_name = c_items
                and a.n001 = p_item_id;

        end if;

        return l_utensils;
    end get_utensils;

    function get_note (
        p_item_id in number
    ) return varchar2 is
        l_note varchar2(4000);
    begin
        if apex_collection.collection_exists(p_collection_name => c_items) then
            select
                a.c002
            into l_note
            from
                apex_collections a
            where
                    collection_name = c_items
                and a.n001 = p_item_id;

        end if;

        return l_note;
    end get_note;

    function item_quantity (
        p_item_id in number
    ) return number is
        l_quantity number;
    begin
        if apex_collection.collection_exists(p_collection_name => c_items) then
            select
                a.n002
            into l_quantity
            from
                apex_collections a
            where
                    collection_name = c_items
                and a.n001 = p_item_id;

            return l_quantity;
        else
            return 0;
        end if;
    exception
        when others then
            return 0;
    end item_quantity;

    procedure clear_cart is
    begin
        if apex_collection.collection_exists(p_collection_name => c_items) then
            apex_collection.truncate_collection(p_collection_name => c_items);
        end if;
    end clear_cart;

    procedure create_order (
        p_order_id   out sample_restaurant_orders.order_id%type,
        p_session_id in number
    ) is
    begin
        insert into sample_restaurant_orders (
            order_datetime,
            order_status,
            session_id
        ) values ( sysdate,
                   'IN PROGRESS',
                   p_session_id ) returning order_id into p_order_id;

        if apex_collection.collection_exists(p_collection_name => c_items) then
            insert into sample_restaurant_order_items (
                order_id,
                line_item_id,
                item_id,
                unit_price,
                quantity,
                utensils,
                note
            )
                select
                    p_order_id,
                    seq_id,
                    p.id,
                    p.price,
                    n002,
                    c001,
                    c002
                from
                    apex_collections        a,
                    sample_restaurant_items p
                where
                        collection_name = c_items
                    and p.id = a.n001;

        end if;

        apex_collection.delete_collection(p_collection_name => c_items);
    end create_order;

end sample_restaurant_manage_orders;
/


-- sqlcl_snapshot {"hash":"5109b3b0e564fefc84b6312e89329ae8a1ba0f12","type":"PACKAGE_BODY","name":"SAMPLE_RESTAURANT_MANAGE_ORDERS","schemaName":"PROJECT","sxml":""}