defmodule ElixirPosts.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :body, :string

    timestamps(type: :utc_datetime)
  end

  @doc """
    Handles validation of new values for %Post{} before making changes
  """
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
    |> validate_length(:title, min: 3, max: 100, message: "'title' should be between 3 and 100 characters long")
  end
end
