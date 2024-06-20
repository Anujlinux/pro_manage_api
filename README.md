# Pro Manage Api Documentation

This documentation provides details on the available endpoints and their usage for the Pro Manage API.

## Base URL

The base URL for all endpoints is `https://pro-manage-api-kov9.onrender.com`.

## Authentication

Certain endpoints require authentication using JSON Web Tokens (JWT). To obtain a JWT, you must first sign up or log in. The obtained JWT should be included in the `Authorization` header of subsequent requests as follows:

```
Authorization: Bearer <your_jwt_token>
```

## Endpoints

### 1. Sign Up

  **Endpoint**: `/signup`

  **Method**: `POST`

  **Description**: Creates a new user account.

  **Request Body**:

  ```json
  {
    "user": {
      "email": "user@example.com",
      "password": "password123",
      "password_confirmation": "password123",
      "name": "some_name"
    }
  }
  ```

  **Response**:

  ```json
  {
    "status": {
        "code": 200,
        "message": "Signed up successfully."
    },
    "data": {
        "id": 1,
        "email": "user@example.com",
        "name": "some_name"
    }
  }
  ```

### 2. Log In

  **Endpoint**: `/login`

  **Method**: `POST`

  **Description**: Authenticates a user and returns a JWT. After getting 200 on request, please copy the JWT token from the Authorization header.

  **Request Body**:

  ```json
  {
    "user": {
      "email": "user@example.com",
      "password": "password123"
    }
  }
  ```

  **Response**:

  ```json
  {
    "status": {
      "code": 200,
      "message": "Logged in successfully.",
      "data": {
        "user": {
          "id": 1,
          "email": "user@example.com",
          "name": "some_name"
        }
      }
    }
  }
  ```

### 3. Log Out

  **Endpoint**: `/logout`

  **Method**: `DELETE`

  **Description**: Logs out the current user and invalidates the JWT.

  **Headers**:

  ```
  Authorization: Bearer <your_jwt_token>
  ```

  **Response**:

  ```json
  {
    "message": "Logged out successfully"
  }
  ```

### 4. TodoLists

  **Endpoint**: `/todo_lists`

  **Method**: `GET`, `POST`, `PATCH`, `DELETE`

  **Description**: Manages TodoLists for the authenticated user.

  **Headers**:

  ```
  Authorization: Bearer <your_jwt_token>
  ```

  **GET Request**:

  Fetches all TodoLists for the authenticated user, including associated Todos.

  **Response**:

  ```json
  [
    {
      "id": 1,
      "title": "My Todo List",
      "status": 0,
      "priority": 1,
      "due_date": "2023-07-15",
      "shared": false,
      "assigned": ["user1@example.com", "user2@example.com"],
      "user_id": 1,
      "created_at": "2023-06-20T12:34:56.789Z",
      "updated_at": "2023-06-20T12:34:56.789Z",
      "todos": [
        {
          "id": 1,
          "title": "Buy groceries",
          "description": "Get milk, bread, and eggs from the store.",
          "completed": false,
          "completed_at": null,
          "todolist_id": 1,
          "created_at": "2023-06-20T12:34:56.789Z",
          "updated_at": "2023-06-20T12:34:56.789Z"
        },
        {
          "id": 2,
          "title": "Clean the house",
          "description": "Vacuum the living room and mop the kitchen.",
          "completed": false,
          "completed_at": null,
          "todolist_id": 1,
          "created_at": "2023-06-20T12:34:56.789Z",
          "updated_at": "2023-06-20T12:34:56.789Z"
        }
      ]
    }
  ]
  ```

  **POST Request**:

  Creates a new TodoList for the authenticated user.

  **Request Body**:

  ```json
  {
    "todo_list": {
      "title": "My Todo List",
      "status": 0,
      "priority": 1,
      "due_date": "2023-07-15",
      "shared": false,
      "assigned": ["user1@example.com", "user2@example.com"]
    },
    "todos": [
      {
        "title": "Buy groceries",
        "description": "Get milk, bread, and eggs from the store."
      },
      {
        "title": "Clean the house",
        "description": "Vacuum the living room and mop the kitchen."
      }
    ]
  }
  ```

  **Response**:

  ```json
  {
    "id": 1,
    "title": "My Todo List",
    "status": 0,
    "priority": 1,
    "due_date": "2023-07-15",
    "shared": false,
    "assigned": ["user1@example.com", "user2@example.com"],
    "user_id": 1,
    "created_at": "2023-06-20T12:34:56.789Z",
    "updated_at": "2023-06-20T12:34:56.789Z",
    "todos": [
      {
        "id": 1,
        "title": "Buy groceries",
        "description": "Get milk, bread, and eggs from the store.",
        "completed": false,
        "completed_at": null,
        "todolist_id": 1,
        "created_at": "2023-06-20T12:34:56.789Z",
        "updated_at": "2023-06-20T12:34:56.789Z"
      },
      {
        "id": 2,
        "title": "Clean the house",
        "description": "Vacuum the living room and mop the kitchen.",
        "completed": false,
        "completed_at": null,
        "todolist_id": 1,
        "created_at": "2023-06-20T12:34:56.789Z",
        "updated_at": "2023-06-20T12:34:56.789Z"
      }
    ]
  }
  ```

  **PATCH Request**:

  Updates an existing TodoList for the authenticated user.

  **Request Body**:

  ```json
  {
    "todo_list": {
      "status": 1
    }
  }
  ```

  **Response**:

  ```json
  {
    "id": 1,
    "title": "My Todo List",
    "status": 1,
    "priority": 1,
    "due_date": "2023-07-15",
    "shared": false,
    "assigned": ["user1@example.com", "user2@example.com"],
    "user_id": 1,
    "created_at": "2023-06-20T12:34:56.789Z",
    "updated_at": "2023-06-20T14:56:78.901Z",
    "todos": [
      {
        "id": 1,
        "title": "Buy groceries",
        "description": "Get milk, bread, and eggs from the store.",
        "completed": false,
        "completed_at": null,
        "todolist_id": 1,
        "created_at": "2023-06-20T12:34:56.789Z",
        "updated_at": "2023-06-20T12:34:56.789Z"
      },
      {
        "id": 2,
        "title": "Clean the house",
        "description": "Vacuum the living room and mop the kitchen.",
        "completed": false,
        "completed_at": null,
        "todolist_id": 1,
        "created_at": "2023-06-20T12:34:56.789Z",
        "updated_at": "2023-06-20T12:34:56.789Z"
      }
    ]
  }
  ```

**Endpoint**: `/todo_lists/:id`

**Method**: `DELETE`

**Description**: Deletes an existing TodoList for the authenticated user.

**Headers**:

```
Authorization: Bearer <your_jwt_token>
```

**Response**:

```
204 No Content
```

The DELETE request for deleting a TodoList should be sent to the `/todo_lists/:id` endpoint, where `:id` is the ID of the TodoList you want to delete.

For deleting a Todo, the DELETE request should be sent to the `/todo_lists/:todo_list_id/todos/:id` endpoint, where `:todo_list_id` is the ID of the TodoList the Todo belongs to, and `:id` is the ID of the Todo you want to delete.

Both DELETE requests require the JWT token in the `Authorization` header for authentication. If the deletion is successful, the server will respond with a `204 No Content` status code.



### 5. Todos

  **Endpoint**: `/todo_lists/:todo_list_id/todos`

  **Method**: `GET`, `POST`, `PATCH`, `DELETE`

  **Description**: Manages Todos for a specific TodoList.

  **Headers**:

  ```
  Authorization: Bearer <your_jwt_token>
  ```

  **GET Request**:

  Fetches all Todos for a specific TodoList.

  **Response**:

  ```json
  [
    {
      "id": 1,
      "title": "Buy groceries",
      "description": "Get milk, bread, and eggs from the store.",
      "completed": false,
      "completed_at": null,
      "todolist_id": 1,
      "created_at": "2023-06-20T12:34:56.789Z",
      "updated_at": "2023-06-20T12:34:56.789Z"
    },
    {
      "id": 2,
      "title": "Clean the house",
      "description": "Vacuum the living room and mop the kitchen.",
      "completed": false,
      "completed_at": null,
      "todolist_id": 1,
      "created_at": "2023-06-20T12:34:56.789Z",
      "updated_at": "2023-06-20T12:34:56.789Z"
    }
  ]
  ```

  **POST Request**:

  Creates a new Todo for a specific TodoList.

  **Request Body**:

  ```json
  {
    "todo": {
      "title": "Work on project",
      "description": "Complete the design for the new website."
    }
  }
  ```

  **Response**:

  ```json
  {
    "id": 3,
    "title": "Work on project",
    "description": "Complete the design for the new website.",
    "completed": false,
    "completed_at": null,
    "todolist_id": 1,
    "created_at": "2023-06-20T14:56:78.901Z",
    "updated_at": "2023-06-20T14:56:78.901Z"
  }
  ```

  **PATCH Request**:

  Updates an existing Todo for a specific TodoList.

  **Request Body**:

  ```json
  {
    "todo": {
      "completed": true
    }
  }
  ```

  **Response**:

  ```json
  {
    "id": 1,
    "title": "Buy groceries",
    "description": "Get milk, bread, and eggs from the store.",
    "completed": true,
    "completed_at": "2023-06-20T15:16:22.345Z",
    "todolist_id": 1,
    "created_at": "2023-06-20T12:34:56.789Z",
    "updated_at": "2023-06-20T15:16:22.345Z"
  }
  ```

  **DELETE Request**

  **Endpoint**: `/todo_lists/:todo_list_id/todos/:id`

  **Method**: `DELETE`

  **Description**: Deletes an existing Todo from a specific TodoList.

  **Headers**:

  ```
  Authorization: Bearer <your_jwt_token>
  ```

  **Response**:

  ```
  204 No Content
  ```


### 6. Update Password

  **Endpoint**: `/users/registrations`

  **Method**: `PATCH`

  **Description**: Updates the authenticated user's password.

  **Headers**:

  ```
  Authorization: Bearer <your_jwt_token>
  ```

  **Request Body**:

  ```json
  {
    "user": {
      "password": "newpassword",
      "password_confirmation": "newpassword",
      "current_password": "currentpassword"
    }
  }
  ```

  **Response**:

  ```json
  {
    "id": 1,
    "email": "user@example.com"
  }
  ```

### 7. Update Email

  **Endpoint**: `/users/registrations`

  **Method**: `PATCH`

  **Description**: Updates the authenticated user's email address. Requires the current password.

  **Headers**:

  ```
  Authorization: Bearer <your_jwt_token>
  ```

  **Request Body**:

  ```json
  {
    "user": {
      "email": "newemail@example.com",
      "current_password": "currentpassword"
    }
  }
  ```

  **Response**:

  ```json
  {
    "status": {
      "code": 200,
      "message": "Signed up successfully."
    },
    "data": {
      "id": 1,
      "email": "newemail@example.com",
      "name": "some_name"
    }
  }
  ```