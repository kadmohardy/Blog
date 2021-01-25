defmodule BlogWeb.CommentsChannel do
  use BlogWeb, :channel

  def join(name, _payload, socket), do: {:ok, %{nome: "#{name}, Deu certo!!"}, socket}

end
