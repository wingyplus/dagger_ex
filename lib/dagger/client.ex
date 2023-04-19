defmodule Dagger.Client do
  @moduledoc """
  The Dagger client.
  """

  alias Dagger.EngineConn

  defstruct [:req, :conn]

  def connect() do
    with {:ok, conn} <- EngineConn.get() do
      host = EngineConn.host(conn)

      {:ok,
       %__MODULE__{
         req: Req.new(base_url: "http://#{host}") |> AbsintheClient.attach(),
         conn: conn
       }}
    end
  end

  def query(%__MODULE__{} = client, query) when is_binary(query) do
    Req.post(client.req,
      url: "/query",
      graphql: query,
      auth: {token(client), ""}
    )
  end

  defp token(%__MODULE__{conn: conn}) do
    EngineConn.token(conn)
  end
end