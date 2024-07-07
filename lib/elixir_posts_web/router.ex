defmodule ElixirPostsWeb.Router do
  use ElixirPostsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElixirPostsWeb do
    pipe_through :api
    resources "/posts", PostController
  end
end
