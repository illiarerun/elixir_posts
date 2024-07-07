defmodule ElixirPosts.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirPosts.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> ElixirPosts.Posts.create_post()

    post
  end
end
