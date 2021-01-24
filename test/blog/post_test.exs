defmodule Blog.PostTest do
  use Blog.DataCase
  alias Blog.{Posts, Posts.Post}

  @valid_post %{
    title: "Phoenix Framework",
    description: "Lorem"
  }

  @valid_post_update %{
    title: "Phoenix Framework2",
    description: "Lorem2"
  }

  def post_fixture(_attrs \\ %{}) do
    {:ok, post} = Posts.create_post(@valid_post)
    post
  end

  test "list_posts/0 return all posts" do
    post = post_fixture()
    assert Posts.list_posts() == [post]
  end

  test "get_posts/1 return all posts" do
    post = post_fixture()
    assert Posts.get_post!(post.id) == post
  end

  test "create_post/1 with valid data" do
    assert = {:ok, %Post{} = post} = Posts.create_post(@valid_post)
    assert post.title == "Phoenix Framework"
    assert post.description == "Lorem"
  end

  test "update_post/2 with valid data" do
    post = post_fixture()
    assert = {:ok, %Post{} = post} = Posts.update_post(post, @valid_post_update)
    assert post.title == "Phoenix Framework2"
  end

  test "delete_post/1" do
    post = post_fixture()
    assert {:ok, %Post{} = post} = Posts.delete_post(post.id)
    assert_raise Ecto.NoResultsError, fn -> Posts.get_post!(post.id) end
  end
end
