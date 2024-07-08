# Elixir Posts App

This is API part of an Elixir Posts app. Frontend Repository link - [posts_frontend](https://github.com/illiarerun/posts_frontend/)

### Live version (hosted on Gigalixir): [link](https://elixir-posts.gigalixirapp.com/api/posts)

## Stack:
- Elixir
- Phoenix Framework
- Mix

## Local development guide:
- Clone repository using any tool you'd like, for example, with CLI: `git clone git@github.com:illiarerun/elixir_posts.git`
- Navigate to project directory `cd posts_frontend`
  Create `.env.dev` file with postgres credentials or skip if your postgres setup is default local one:
```example
.env.dev
export PGUSER=postgres
export PGPASSWORD=postgres
export PGHOST=localhost
export PGDATABASE=posts_db
export PGPORT=5432
export DB_POOLSIZE=10
```

### Using MIX:
- Run `mix setup` to install and setup dependencies
- Make sure that you have instance of psql running on your local machine or you have an access to dedicated postgres server
- Start Phoenix endpoint with `mix run.env` or inside IEx with `iex -S mix run.env`

### Using Docker:
- Run `docker-compose build` - this will build Phoenix image
- Run `docker-compose up` - this will build dedicated Postgres image for your Phoenix Container to use. Note: (port for Phoenix :4000, and for Postgress :5432 will be exposed, make sure they are not busy)

## API
### Post Structure:
- id: number, PK - unique identifier
- title: string, required - title of Post
- body: string, required - content of Post
- inserted_at: timestamp - time of post creation
- updated_at: timestamp - time of last post update

### Response Body Structure:
- data: Post | Post[] - contains either singular Post or an array of Posts, based on request

### Request Body Structure:
- post: Post - used for passing data about post

### Available methods:
- GET `/api/posts` - returns list of all posts,
- GET `/api/posts/:id` - returns post with given id, example: `/posts/56` will return Post with id 56
- POST `/api/posts` - if provided with valid data (passed in body), will create a new Post record
- PUT | PATCH `/api/posts/:id` - if provided with valid data (passed in body), will update existing Post record with given id and data
- DELETE `/api/posts/:id` - will delete Post with given id
