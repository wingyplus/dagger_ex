# This file generated by `mix dagger.gen`. Please DO NOT EDIT.
defmodule Dagger.GitRef do
  @moduledoc "A git ref (tag, branch or commit)."
  use Dagger.QueryBuilder
  defstruct [:selection, :client]

  (
    @doc "The digest of the current value of this ref.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    def digest(%__MODULE__{} = git_ref) do
      selection = select(git_ref.selection, "digest")
      execute(selection, git_ref.client)
    end
  )

  (
    @doc "The filesystem tree at this ref.\n\n## Required Arguments\n\n\n\n## Optional Arguments\n\n* `ssh_known_hosts` - \n* `ssh_auth_socket` -"
    def tree(%__MODULE__{} = git_ref, args) do
      selection = select(git_ref.selection, "tree")

      (
        selection =
          if not is_nil(args[:ssh_known_hosts]) do
            arg(selection, "sshKnownHosts", args[:ssh_known_hosts])
          else
            selection
          end

        selection =
          if not is_nil(args[:ssh_auth_socket]) do
            arg(selection, "sshAuthSocket", args[:ssh_auth_socket])
          else
            selection
          end
      )

      %Dagger.Directory{selection: selection, client: git_ref.client}
    end
  )
end
