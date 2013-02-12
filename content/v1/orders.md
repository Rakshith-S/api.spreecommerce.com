---
title: Orders
---

# Orders API

* TOC
{:toc}

## List all orders

<%= admin_only %>

Retrieve a list of orders by making this request:

    GET /api/orders

Orders are paginated and can be iterated through by passing along a `page` parameter:

    GET /api/orders?page=2

### Parameters

page
: The page number of order to display.

per_page
: The number of orders to return per page

### Response

<%= headers 200 %>
<%= json(:order) do |h|
{ :orders => [h],
  :count => 25,
  :pages => 5,
  :current_page => 1 }
end %> 

## Order searching

To search for a particular order, make a request like this:

    GET /api/orders?q[email_cont]=bob

The searching API is provided through the Ransack gem which Spree depends on. The `email_cont` here is called a predicate, and you can learn more about them by reading about [Predicates on the Ransack wiki](https://github.com/ernie/ransack/wiki/Basic-Searching).

The search results are paginated.

### Response

<%= headers 200 %>
<%= json(:order) do |h|
 { :orders => [h],
   :count => 25,
   :pages => 5,
   :current_page => 1 }
end %> 

### Sorting results

Results can be returned in a specific order by specifying which field to sort by when making a request.

    GET /api/orders?q[s]=number%20desc

It is also possible to sort results using an associated object's field.

    GET /api/orders?q[s]=user_name%20asc

## A single order

To view the details for a single product, make a request using that order\'s number:

    GET /api/orders/R123456789

Orders through the API will only be visible to admins and the users who own them. If a user attempts to access an order that does not belong to them, they will be met with an authorization error.

### Successful Response

<%= headers 200 %>
<%= json :order_show %>

### Not Found Response

<%= not_found %>

### Authorization Failure

<%= authorization_failure %>

## Creating a new order

To create a new order through the API, make this request:

    POST /api/orders

If you wish to create an order with a line item matching to a variant whose ID is \"1\" and quantity is 5, make this request:

    POST /api/orders?order[line_items][0][variant_id]=1&order[line_items][0][quantity]=5

### Successful response

<%= headers 201 %>

### Failed response

<%= headers 422 %>
<%= json \
  :error => "Invalid resource. Please fix errors and try again.",
  :errors => {
    :name => ["can't be blank"],
    :price => ["can't be blank"]
  }
%>

## Modifying address information

Please see the [checkout guide](/v1/order/checkouts) for instructions on modifying address information.

## Selecting a delivery method

Please see the [checkout guide](/v1/order/checkouts) for instructions on selecting a delivery method.

## Emptying an Order

To empty an order\'s cart, make this request:

    PUT /api/orders/R1234567/empty

All line items will be removed from the cart and the order\'s information will
be cleared. Inventory that was previously depleted by this order will be
repleted.
