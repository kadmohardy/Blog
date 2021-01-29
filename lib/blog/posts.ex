defmodule Blog.Posts do
  @moduledoc false
  import Ecto.Query, warn: false

  alias Blog.{Posts.Post, Repo}

  def list_posts(user_id \\ nil) do
    if user_id do
      query = from p in Post, where: p.user_id == ^user_id
      Repo.all(query)
    else
      Repo.all(Post)
    end
  end

  def get_post!(id), do: Repo.get!(Post, id)

  def get_post_with_comments!(id), do: Repo.get!(Post, id) |> Repo.preload(comments: [:user])

  def create_post(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:posts)
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def update_post(post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  def delete_post(id) do
    get_post!(id)
    |> Repo.delete()
  end
end
