# This file generated by `mix dagger.gen`. Please DO NOT EDIT.
defmodule Dagger.CacheSharingMode do
  @moduledoc "Sharing mode of the cache volume."
  @type t() :: :SHARED | :PRIVATE | :LOCKED
  (
    @doc "Shares the cache volume amongst many build pipelines"
    def shared() do
      :SHARED
    end
  )

  (
    @doc "Keeps a cache volume for a single build pipeline"
    def private() do
      :PRIVATE
    end
  )

  (
    @doc "Shares the cache volume amongst many build pipelines,\nbut will serialize the writes"
    def locked() do
      :LOCKED
    end
  )
end
