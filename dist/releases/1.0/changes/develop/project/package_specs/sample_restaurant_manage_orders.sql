-- liquibase formatted sql
-- changeset PROJECT:1754135331683 stripComments:false  logicalFilePath:develop\project\package_specs\sample_restaurant_manage_orders.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/project/package_specs/sample_restaurant_manage_orders.sql:null:021186af7763dd3871a3cfe7d3052a0a4bdf2a82:create

create or replace package sample_restaurant_manage_orders as
  --------------------------------------------------------------
  -- constant name for collection
    c_items constant varchar2(30) := 'ITEMS';
  --------------------------------------------------------------
  -- create procedure for add a item temporarily
    procedure add_item (
        p_item_id  in number,
        p_quantity in number,
        p_utensils in varchar2,
        p_note     in varchar2
    );
  --------------------------------------------------------------
  -- create procedure for remove a item temporarily
    procedure remove_item (
        p_item_id in number
    );
  --------------------------------------------------------------
  -- create function to get the number of items in the shopping cart
    function get_quantity return number;
  --------------------------------------------------------------
  -- create procedure for validate if a item exists in the shopping cart
    function get_utensils (
        p_item_id in number
    ) return varchar2;
  --------------------------------------------------------------
  -- create procedure for validate if a item exists in the shopping cart
    function get_note (
        p_item_id in number
    ) return varchar2;
  --------------------------------------------------------------
  -- create procedure for validate the item quantity in the shopping cart
    function item_quantity (
        p_item_id in number
    ) return number;
  --------------------------------------------------------------
  -- create procedure for clear the cart
    procedure clear_cart;
  --------------------------------------------------------------
  -- create procedure to insert orders
    procedure create_order (
        p_order_id   out sample_restaurant_orders.order_id%type,
        p_session_id in number
    );

end sample_restaurant_manage_orders;
/

