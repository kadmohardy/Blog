defmodule BlogWeb.AuthController do
  use BlogWeb, :controller
  plug Ueberauth

  def request(conn, _params) do
    render(conn, "index.html")
  end

  def callback(conn, _params) do
    render(conn, "index.html")
  end
end
