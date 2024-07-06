defmodule ElixirPosts.Repo do
  use Ecto.Repo,
    otp_app: :elixir_posts,
    adapter: Ecto.Adapters.Postgres
end
