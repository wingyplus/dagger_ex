defmodule Dagger.Codegen.Visitor do
  @moduledoc false

  def run(schema, visit_scalar, visit_input_object, visit_object, visit_enum) do
    [
      %{
        kind: "SCALAR",
        handler: visit_scalar,
        ignore: [
          "String",
          "Float",
          "Int",
          "Boolean",
          "DateTime",
          "ID"
        ]
      },
      %{
        kind: "INPUT_OBJECT",
        handler: visit_input_object,
        ignore: []
      },
      %{
        kind: "OBJECT",
        handler: visit_object,
        ignore: []
      },
      %{
        kind: "ENUM",
        handler: visit_enum,
        ignore: []
      }
    ]
    |> Enum.map(&visit(&1.kind, &1.handler, &1.ignore, schema))
  end

  def visit(kind, visit_fun, ignore, schema) do
    schema["types"]
    |> Enum.filter(&(&1["kind"] == kind))
    |> Enum.filter(&(&1["name"] not in ignore))
    |> Enum.map(visit_fun)
  end
end
