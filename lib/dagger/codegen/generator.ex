defmodule Dagger.Codegen.Generator do
  @moduledoc false

  def generate() do
    {:ok, client} = Dagger.Client.connect()

    {:ok, %{status: 200, body: resp}} =
      Dagger.Client.query(client, Dagger.Codegen.Introspection.query())

    Dagger.Codegen.Compiler.compile(resp["data"])
  end
end

defmodule Dagger.Codegen.Compiler do
  @moduledoc false

  # Compile GraphQL introspection into Elixir code.

  alias Dagger.Codegen.Elixir.Templates.Enum, as: EnumTmpl
  alias Dagger.Codegen.Elixir.Templates.Object
  alias Dagger.Codegen.Elixir.Templates.Scalar

  def compile(
        %{
          "__schema" => %{
            "types" => types
          }
        } = _introspection
      ) do
    types
    |> Enum.filter(&only_supported_kinds/1)
    |> Enum.filter(&not_graphql_introspection_types/1)
    |> Enum.map(&render/1)
  end

  defp only_supported_kinds(%{"kind" => kind}) do
    kind in ["ENUM", "OBJECT", "SCALAR"]
  end

  defp not_graphql_introspection_types(%{"name" => name}) do
    name not in graphql_introspection_types()
  end

  defp graphql_introspection_types() do
    [
      "__Type",
      "__Directive",
      "__Field",
      "__InputValue",
      "__EnumValue",
      "__Schema",
      "__TypeKind",
      "__DirectiveLocation",
      "Int",
      "Float",
      "String",
      "ID",
      "Boolean",
      "DateTime"
    ]
  end

  defp render(%{"name" => name, "kind" => kind} = full_type) do
    q =
      case kind do
        "OBJECT" ->
          Object.render(full_type)

        "SCALAR" ->
          Scalar.render(full_type)

        "ENUM" ->
          EnumTmpl.render(full_type)
      end

    {"#{Macro.underscore(name)}.ex", q}
  end
end
