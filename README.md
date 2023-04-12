# E-commerce API documentation from Group 5

## 1. What the data will look like

### Products:

- productId: unique identifier of the product.
- productName: title of product, not neccesarily unique but should be.
- description: descriptor in sentence or sentences, of the product.
- categories: a single, or set of descriptors of the product from a set of descriptors decided between the developer and customer 
- size: a single descriptor of the product according to an established size (s, m, l, xl)
- price: numerical representation of price in two decimal precision (i.e. 12.29)

### Users:

- userId: unique identifier of user
- firstName: first name of user
- lastName: last name of user
- email: email address, must be unique
- password: password which meets requirements set by server
- role: descriptor of user's role, to establish what action they can perform in the REST API. roles are: admin, user
- banned: boolean descriptor whether user can create changes in the server related to their profile or adding orders.

### Orders:

- orderId: unique identifier of order
- productId: identifies the product purchased
- quantity: amount of products requested
- email: which user created the order
- createdAt: a UTC timestamp of when the order was saved in the database

there can be multiple entries with the same orderId, but the productId must be different. due to this, the orderId and productId combined will serve as the unique identifier of the entry (aka composite key).

## 2. What entities the API will have

The entities that the API will have are Products, Users and Orders.

## 3. What is relation between entities

There are two relationships:
- Each user can have many orders
- Each order can have many products

## 4. What kind of endpoints the API will have

This will be decided based on the needed actions. So far, the actions are:

### /products

1. GET request - get all products in the database. query strings can be appended to narrow the search, to paginate, filter (size, categories, price), and sort attribute. returns a mapping of products.
2. POST request - add a new product to the database with the above mentioned attributes. returns new item and 200 code.
   
### /products/{productId}

3. GET request- get a product according to it's unique identifier. returns one object.
4. PATCH request - updates a product with it's identifier. returns updated item and 200 http code.
5. DELETE request - remove a product according to it's identifier. returns 200 http code.

### /auth/signIn

6. POST request - creates an access token for the user to sign in, if the credentials are correctly filled. returns token and 200 code.

### /auth/register

7. POST request - create (sign up) a new user in the database. returns 200 code - user will need to sign in to get access token.

### /auth/forgotPassword

8. POST - user gets a password reset code in their email. returns 200 code to indicate success.

### /auth/resetpassword/{userId}:

9. PATCH request - resets the password of users account once the password reset token is verified - user will need to sign in after receiving successful response. returns 200 code.

### /auth/setPermission{userId}
10. PATCH request - used to ban or unban a user. the payload determines this. only admin can use this route, and is verified according to payload of decrypted access token. returns 200 code and new (changed) permissions data. 

### /users/{userId}

11. PATCH request - user can change their first name, last name or email address. returns new data and 200 code.

### /orders/

12. POST request - adds a new order to the database with the product and user attributes. returns new data and 200 code.
13. GET request - retrieves mapping of orders in the database. a user can only access this endpoint by appending an access token to the request header, which then retrieves their own orders.

### /orders/{orderId}

14. GET request gets an order according to order identifier. returns one order.

Visual respresentation:

![alt text](https://i.ibb.co/hWFbjVQ/schema-720.jpg)

## 5. Swagger output

There are exactly four endpoints being products, auth, users and orders. For each endpoint, one folder will be created in this directory with a .yaml file describing the actions in subject number 4 - "what kind of endpoints will this API have?". For simplicity sake, I created on simple example which others can follow.

Useful links for creating a simple .yaml file with swagger: 
- https://youtu.be/rkk2h6Tra9A
- https://learn21.in/blog/code-snippet-sample-example-wagger-api

For anyone not having something to do, perhaps making an ERD diagram or something worth effort can be delegated to them.

## 6. ERD Diagram for database

![diagram for database](erd.jpg)

## 7. PostgreSQL database schema

.sql file in the folder called database available for viewing

# Design a REST API - Design First (NO CODE)

Before diving into the assignment, make sure you review the slides and understand the theortical part and best practices.

## Plan with your group mates:

- What my data should look like
- What are the entities that we should have ie (Products and Users)
- What is the relation between these entities (you could read about it, and we will cover that in the next lectures)
- What kind of endpoints the API would have
- Document the endpoints using Swagger (documentation only, NO CODE)

Make sure you cover the basic routes first.
