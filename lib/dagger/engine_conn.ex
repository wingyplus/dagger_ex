defmodule Dagger.EngineConn do
  @moduledoc false

  defstruct [:port, :token, :session_pid]

  @dagger_cli_version "0.5.0"
  @dagger_bin_prefix "dagger-"

  @doc false
  def get(opts) do
    case from_session_env(opts) do
      {:ok, conn} ->
        {:ok, conn}

      _otherwise ->
        case from_local_cli(opts) do
          {:ok, conn} -> {:ok, conn}
          _otherwise -> from_remote_cli(opts)
        end
    end
  end

  @doc false
  def from_session_env(_opts) do
    with {:ok, port} <- System.fetch_env("DAGGER_SESSION_PORT"),
         {:ok, token} <- System.fetch_env("DAGGER_SESSION_TOKEN") do
      {:ok,
       %__MODULE__{
         port: port,
         token: token
       }}
    end
  end

  @doc false
  def from_local_cli(opts) do
    with {:ok, bin} <- System.fetch_env("_EXPERIMENTAL_DAGGER_CLI_BIN"),
         bin_path when is_binary(bin_path) <- System.find_executable(bin) do
      start_cli_session(bin_path, opts)
    else
      nil -> {:error, :no_executable}
      otherwise -> otherwise
    end
  end

  # https://www.erlang.org/docs/22/man/filename.html

  @doc false
  def from_remote_cli(opts) do
    cache_dir = :filename.basedir(:user_cache, "dagger")
    File.mkdir_p!(cache_dir)
    File.chmod!(cache_dir, 0o700)
    bin_name = dagger_bin_name(:os.type())
    cache_bin_path = Path.join([cache_dir, bin_name])

    bin_path =
      case File.stat(cache_bin_path) do
        {:error, :enoent} ->
          # TODO: download and return bin_path.
          raise "TODO"

        {:ok, _} ->
          cache_bin_path
      end

    start_cli_session(bin_path, opts)
  end

  defp dagger_bin_name({:unix, _}) do
    @dagger_bin_prefix <> @dagger_cli_version
  end

  defp dagger_bin_name({:win32, :nt}) do
    @dagger_bin_prefix <> @dagger_cli_version <> ".exe"
  end

  defp start_cli_session(bin_path, opts) do
    connect_timeout = opts[:connect_timeout]
    # TODO: setup logger base on `opts`.
    session_pid =
      spawn_link(Dagger.Session, :start, [bin_path, self(), &Dagger.StdoutLogger.log/1])

    receive do
      {^session_pid, %{"port" => port, "session_token" => token}} ->
        {:ok, %__MODULE__{port: port, token: token, session_pid: session_pid}}
    after
      connect_timeout -> {:error, :session_timeout}
    end
  end

  # Constructing host connection.
  @doc false
  def host(%__MODULE__{port: port}), do: "127.0.0.1:#{port}"

  # Get the token.
  @doc false
  def token(%__MODULE__{token: token}), do: token

  # Disconnecting from Dagger session.
  @doc false
  def disconnect(%__MODULE__{session_pid: nil}) do
    :ok
  end

  def disconnect(%__MODULE__{session_pid: pid}) do
    Dagger.Session.stop(pid)
  end
end
