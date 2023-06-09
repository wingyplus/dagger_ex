# This file generated by `mix dagger.gen`. Please DO NOT EDIT.
defmodule Dagger.Label do
  @moduledoc "A simple key value object that represents a label."
  use Dagger.QueryBuilder
  @type t() :: %__MODULE__{}
  defstruct [:selection, :client]

  (
    @doc "The label name."
    @spec name(t()) :: String.t()
    def name(%__MODULE__{} = label) do
      selection = select(label.selection, "name")
      execute(selection, label.client)
    end
  )

  (
    @doc "The label value."
    @spec value(t()) :: String.t()
    def value(%__MODULE__{} = label) do
      selection = select(label.selection, "value")
      execute(selection, label.client)
    end
  )
end
