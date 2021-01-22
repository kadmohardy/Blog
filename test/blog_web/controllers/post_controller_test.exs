defmodule BlogWeb.PostControllerTest do
  use BlogWeb.ConnCase

  @valid_post %{
    title: "Phoenix Framework",
    description: "Lorem"
  }

  @valid_post_update %{
    title: "Phoenix Framework2",
    description: "Lorem2"
  }

  def fixture(:post) do
    {:ok, post} = Blog.Posts.create_post(@valid_post)
    post
  end

  test "listar todos os posts", %{conn: conn} do
    Blog.Posts.create_post(@valid_post)
    conn = get(conn, Routes.post_path(conn, :index))
    assert html_response(conn, 200) =~ "Phoenix Framework"
  end

  test "obtem um post por id", %{conn: conn} do
    {:ok, post} = Blog.Posts.create_post(@valid_post)
    conn = get(conn, Routes.post_path(conn, :show, post))
    assert html_response(conn, 200) =~ "Phoenix Framework"
  end

  test "obter formulario de criacao de post", %{conn: conn} do
    conn = get(conn, Routes.post_path(conn, :new))
    assert html_response(conn, 200) =~ "Criar Post"
  end

  test "criar post", %{conn: conn} do
    conn = post(conn, Routes.post_path(conn, :create), post: @valid_post)

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == Routes.post_path(conn, :show, id)

    conn = get(conn, Routes.post_path(conn, :show, id))
    assert html_response(conn, 200) =~ "Phoenix Framework"
  end

  test "criar post com dados invalidos", %{conn: conn} do
    conn = post(conn, Routes.post_path(conn, :create), post: %{})
    assert html_response(conn, 200) =~ "fields are required"
  end

  describe "testes que precisam de post criado" do
    setup [:criar_post]

    test "obter formulario de alteracao de post", %{conn: conn, post: post} do
      conn = get(conn, Routes.post_path(conn, :edit, post))
      assert html_response(conn, 200) =~ "Editar Post"
    end

    test "alterar post",  %{conn: conn, post: post} do
      conn = put(conn, Routes.post_path(conn, :update, post), post: @valid_post_update)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.post_path(conn, :show, id)

      conn = get(conn, Routes.post_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Phoenix Framework2"
    end

    test "alterar post com dados invalidos",  %{conn: conn, post: post} do
      conn = put(conn, Routes.post_path(conn, :update, post), post: %{title: nil, description: nil})
      assert html_response(conn, 200) =~ "fields are required"
    end

    test "delete post",  %{conn: conn, post: post} do
      conn = delete(conn, Routes.post_path(conn, :delete, post))
      assert redirected_to(conn) == Routes.post_path(conn, :index)

      assert_error_sent 404, fn -> get(conn, Routes.post_path(conn, :show, post)) end
    end
  end

  defp criar_post(_) do
    %{post: fixture(:post)}
  end

end