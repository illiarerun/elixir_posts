# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ElixirPosts.Repo.insert!(%ElixirPosts.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias ElixirPosts.Repo
alias ElixirPosts.Posts.Post

if length(Repo.all(Post)) < 1 do
  Repo.insert!(%Post{
    title: "Hello world!",
    body: "First Post on Elixir Posts App!"
  })

  Repo.insert!(%Post{
    title: "Another post",
    body: "Wow, yet another post by Illia"
  })

  Repo.insert!(%Post{
    title: "Latin is back",
    body:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ornare, metus vitae blandit sodales, ex elit vehicula magna, nec maximus lacus nibh id lectus."
  })
end
