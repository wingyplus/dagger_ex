# This file generated by `mix dagger.gen`. Please DO NOT EDIT.
defmodule Dagger.Container do
  @moduledoc "An OCI-compatible container, also known as a docker container."
  use Dagger.QueryBuilder
  defstruct [:selection, :client]

  (
    @doc "Initializes this container from a Dockerfile build.\n\n## Required Arguments\n\n* `context` - Directory context used by the Dockerfile.\n\n## Optional Arguments\n\n* `dockerfile` - Path to the Dockerfile to use.\n\nDefault: './Dockerfile'.\n* `build_args` - Additional build arguments.\n* `target` - Target build stage to build."
    def build(%__MODULE__{} = container, args) do
      selection = select(container.selection, "build")
      selection = arg(selection, "context", Keyword.fetch!(args, :context))

      (
        selection =
          if not is_nil(args[:dockerfile]) do
            arg(selection, "dockerfile", args[:dockerfile])
          else
            selection
          end

        selection =
          if not is_nil(args[:build_args]) do
            arg(selection, "buildArgs", args[:build_args])
          else
            selection
          end

        selection =
          if not is_nil(args[:target]) do
            arg(selection, "target", args[:target])
          else
            selection
          end
      )

      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves default arguments for future commands.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    def default_args(%__MODULE__{} = container) do
      selection = select(container.selection, "defaultArgs")
      execute(selection, container.client)
    end
  )

  (
    @doc "Retrieves a directory at the given path.\n\nMounts are included.\n\n## Required Arguments\n\n* `path` - The path of the directory to retrieve (e.g., \"./src\").\n\n## Optional Arguments"
    def directory(%__MODULE__{} = container, args) do
      selection = select(container.selection, "directory")
      selection = arg(selection, "path", Keyword.fetch!(args, :path))
      %Dagger.Directory{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves an endpoint that clients can use to reach this container.\n\nIf no port is specified, the first exposed port is used. If none exist an error is returned.\n\nIf a scheme is specified, a URL is returned. Otherwise, a host:port pair is returned.\n\nCurrently experimental; set _EXPERIMENTAL_DAGGER_SERVICES_DNS=0 to disable.\n\n## Required Arguments\n\n\n\n## Optional Arguments\n\n* `port` - The exposed port number for the endpoint\n* `scheme` - Return a URL with the given scheme, eg. http for http://"
    def endpoint(%__MODULE__{} = container, args) do
      selection = select(container.selection, "endpoint")

      (
        selection =
          if not is_nil(args[:port]) do
            arg(selection, "port", args[:port])
          else
            selection
          end

        selection =
          if not is_nil(args[:scheme]) do
            arg(selection, "scheme", args[:scheme])
          else
            selection
          end
      )

      execute(selection, container.client)
    end
  )

  (
    @doc "Retrieves entrypoint to be prepended to the arguments of all commands.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    def entrypoint(%__MODULE__{} = container) do
      selection = select(container.selection, "entrypoint")
      execute(selection, container.client)
    end
  )

  (
    @doc "Retrieves the value of the specified environment variable.\n\n## Required Arguments\n\n* `name` - The name of the environment variable to retrieve (e.g., \"PATH\").\n\n## Optional Arguments"
    def env_variable(%__MODULE__{} = container, args) do
      selection = select(container.selection, "envVariable")
      selection = arg(selection, "name", Keyword.fetch!(args, :name))
      execute(selection, container.client)
    end
  )

  (
    @doc "Retrieves the list of environment variables passed to commands.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    def env_variables(%__MODULE__{} = container) do
      selection = select(container.selection, "envVariables")
      execute(selection, container.client)
    end
  )

  (
    @doc "Retrieves this container after executing the specified command inside it.\n\n## Required Arguments\n\n\n\n## Optional Arguments\n\n* `args` - Command to run instead of the container's default command (e.g., [\"run\", \"main.go\"]).\n* `stdin` - Content to write to the command's standard input before closing (e.g., \"Hello world\").\n* `redirect_stdout` - Redirect the command's standard output to a file in the container (e.g., \"/tmp/stdout\").\n* `redirect_stderr` - Redirect the command's standard error to a file in the container (e.g., \"/tmp/stderr\").\n* `experimental_privileged_nesting` - Provide dagger access to the executed command.\nDo not use this option unless you trust the command being executed.\nThe command being executed WILL BE GRANTED FULL ACCESS TO YOUR HOST FILESYSTEM."
    @deprecated "Replaced by `withExec`."
    def exec(%__MODULE__{} = container, args) do
      selection = select(container.selection, "exec")

      (
        selection =
          if not is_nil(args[:args]) do
            arg(selection, "args", args[:args])
          else
            selection
          end

        selection =
          if not is_nil(args[:stdin]) do
            arg(selection, "stdin", args[:stdin])
          else
            selection
          end

        selection =
          if not is_nil(args[:redirect_stdout]) do
            arg(selection, "redirectStdout", args[:redirect_stdout])
          else
            selection
          end

        selection =
          if not is_nil(args[:redirect_stderr]) do
            arg(selection, "redirectStderr", args[:redirect_stderr])
          else
            selection
          end

        selection =
          if not is_nil(args[:experimental_privileged_nesting]) do
            arg(
              selection,
              "experimentalPrivilegedNesting",
              args[:experimental_privileged_nesting]
            )
          else
            selection
          end
      )

      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Exit code of the last executed command. Zero means success.\nErrors if no command has been executed.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    def exit_code(%__MODULE__{} = container) do
      selection = select(container.selection, "exitCode")
      execute(selection, container.client)
    end
  )

  (
    @doc "Writes the container as an OCI tarball to the destination file path on the host for the specified platform variants.\n\nReturn true on success.\nIt can also publishes platform variants.\n\n## Required Arguments\n\n* `path` - Host's destination path (e.g., \"./tarball\").\nPath can be relative to the engine's workdir or absolute.\n\n## Optional Arguments\n\n* `platform_variants` - Identifiers for other platform specific containers.\nUsed for multi-platform image."
    def export(%__MODULE__{} = container, args) do
      selection = select(container.selection, "export")
      selection = arg(selection, "path", Keyword.fetch!(args, :path))

      selection =
        if not is_nil(args[:platform_variants]) do
          arg(selection, "platformVariants", args[:platform_variants])
        else
          selection
        end

      execute(selection, container.client)
    end
  )

  (
    @doc "Retrieves the list of exposed ports.\n\nCurrently experimental; set _EXPERIMENTAL_DAGGER_SERVICES_DNS=0 to disable.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    def exposed_ports(%__MODULE__{} = container) do
      selection = select(container.selection, "exposedPorts")
      execute(selection, container.client)
    end
  )

  (
    @doc "Retrieves a file at the given path.\n\nMounts are included.\n\n## Required Arguments\n\n* `path` - The path of the file to retrieve (e.g., \"./README.md\").\n\n## Optional Arguments"
    def file(%__MODULE__{} = container, args) do
      selection = select(container.selection, "file")
      selection = arg(selection, "path", Keyword.fetch!(args, :path))
      %Dagger.File{selection: selection, client: container.client}
    end
  )

  (
    @doc "Initializes this container from a pulled base image.\n\n## Required Arguments\n\n* `address` - Image's address from its registry.\n\nFormatted as [host]/[user]/[repo]:[tag] (e.g., \"docker.io/dagger/dagger:main\").\n\n## Optional Arguments"
    def from(%__MODULE__{} = container, args) do
      selection = select(container.selection, "from")
      selection = arg(selection, "address", Keyword.fetch!(args, :address))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container's root filesystem. Mounts are not included.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    @deprecated "Replaced by `rootfs`."
    def fs(%__MODULE__{} = container) do
      selection = select(container.selection, "fs")
      %Dagger.Directory{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves a hostname which can be used by clients to reach this container.\n\nCurrently experimental; set _EXPERIMENTAL_DAGGER_SERVICES_DNS=0 to disable.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    def hostname(%__MODULE__{} = container) do
      selection = select(container.selection, "hostname")
      execute(selection, container.client)
    end
  )

  (
    @doc "A unique identifier for this container.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    def id(%__MODULE__{} = container) do
      selection = select(container.selection, "id")
      execute(selection, container.client)
    end
  )

  (
    @doc "The unique image reference which can only be retrieved immediately after the 'Container.From' call.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    def image_ref(%__MODULE__{} = container) do
      selection = select(container.selection, "imageRef")
      execute(selection, container.client)
    end
  )

  (
    @doc "Reads the container from an OCI tarball.\n\nNOTE: this involves unpacking the tarball to an OCI store on the host at\n$XDG_CACHE_DIR/dagger/oci. This directory can be removed whenever you like.\n\n## Required Arguments\n\n* `source` - File to read the container from.\n\n## Optional Arguments\n\n* `tag` - Identifies the tag to import from the archive, if the archive bundles\nmultiple tags."
    def import %__MODULE__{} = container, args do
      selection = select(container.selection, "import")
      selection = arg(selection, "source", Keyword.fetch!(args, :source))

      selection =
        if not is_nil(args[:tag]) do
          arg(selection, "tag", args[:tag])
        else
          selection
        end

      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves the value of the specified label.\n\n## Required Arguments\n\n* `name` - \n\n## Optional Arguments"
    def label(%__MODULE__{} = container, args) do
      selection = select(container.selection, "label")
      selection = arg(selection, "name", Keyword.fetch!(args, :name))
      execute(selection, container.client)
    end
  )

  (
    @doc "Retrieves the list of labels passed to container.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    def labels(%__MODULE__{} = container) do
      selection = select(container.selection, "labels")
      execute(selection, container.client)
    end
  )

  (
    @doc "Retrieves the list of paths where a directory is mounted.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    def mounts(%__MODULE__{} = container) do
      selection = select(container.selection, "mounts")
      execute(selection, container.client)
    end
  )

  (
    @doc "Creates a named sub-pipeline\n\n## Required Arguments\n\n* `name` - Pipeline name.\n\n## Optional Arguments\n\n* `description` - Pipeline description.\n* `labels` - Pipeline labels."
    def pipeline(%__MODULE__{} = container, args) do
      selection = select(container.selection, "pipeline")
      selection = arg(selection, "name", Keyword.fetch!(args, :name))

      (
        selection =
          if not is_nil(args[:description]) do
            arg(selection, "description", args[:description])
          else
            selection
          end

        selection =
          if not is_nil(args[:labels]) do
            arg(selection, "labels", args[:labels])
          else
            selection
          end
      )

      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "The platform this container executes and publishes as.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    def platform(%__MODULE__{} = container) do
      selection = select(container.selection, "platform")
      execute(selection, container.client)
    end
  )

  (
    @doc "Publishes this container as a new image to the specified address.\n\nPublish returns a fully qualified ref.\nIt can also publish platform variants.\n\n## Required Arguments\n\n* `address` - Registry's address to publish the image to.\n\nFormatted as [host]/[user]/[repo]:[tag] (e.g. \"docker.io/dagger/dagger:main\").\n\n## Optional Arguments\n\n* `platform_variants` - Identifiers for other platform specific containers.\nUsed for multi-platform image."
    def publish(%__MODULE__{} = container, args) do
      selection = select(container.selection, "publish")
      selection = arg(selection, "address", Keyword.fetch!(args, :address))

      selection =
        if not is_nil(args[:platform_variants]) do
          arg(selection, "platformVariants", args[:platform_variants])
        else
          selection
        end

      execute(selection, container.client)
    end
  )

  (
    @doc "Retrieves this container's root filesystem. Mounts are not included.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    def rootfs(%__MODULE__{} = container) do
      selection = select(container.selection, "rootfs")
      %Dagger.Directory{selection: selection, client: container.client}
    end
  )

  (
    @doc "The error stream of the last executed command.\nErrors if no command has been executed.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    def stderr(%__MODULE__{} = container) do
      selection = select(container.selection, "stderr")
      execute(selection, container.client)
    end
  )

  (
    @doc "The output stream of the last executed command.\nErrors if no command has been executed.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    def stdout(%__MODULE__{} = container) do
      selection = select(container.selection, "stdout")
      execute(selection, container.client)
    end
  )

  (
    @doc "Retrieves the user to be set for all commands.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    def user(%__MODULE__{} = container) do
      selection = select(container.selection, "user")
      execute(selection, container.client)
    end
  )

  (
    @doc "Configures default arguments for future commands.\n\n## Required Arguments\n\n\n\n## Optional Arguments\n\n* `args` - Arguments to prepend to future executions (e.g., [\"-v\", \"--no-cache\"])."
    def with_default_args(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withDefaultArgs")

      selection =
        if not is_nil(args[:args]) do
          arg(selection, "args", args[:args])
        else
          selection
        end

      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container plus a directory written at the given path.\n\n## Required Arguments\n\n* `path` - Location of the written directory (e.g., \"/tmp/directory\").\n* `directory` - Identifier of the directory to write\n\n## Optional Arguments\n\n* `exclude` - Patterns to exclude in the written directory (e.g., [\"node_modules/**\", \".gitignore\", \".git/\"]).\n* `include` - Patterns to include in the written directory (e.g., [\"*.go\", \"go.mod\", \"go.sum\"])."
    def with_directory(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withDirectory")
      selection = arg(selection, "path", Keyword.fetch!(args, :path))
      selection = arg(selection, "directory", Keyword.fetch!(args, :directory))

      (
        selection =
          if not is_nil(args[:exclude]) do
            arg(selection, "exclude", args[:exclude])
          else
            selection
          end

        selection =
          if not is_nil(args[:include]) do
            arg(selection, "include", args[:include])
          else
            selection
          end
      )

      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container but with a different command entrypoint.\n\n## Required Arguments\n\n* `args` - Entrypoint to use for future executions (e.g., [\"go\", \"run\"]).\n\n## Optional Arguments"
    def with_entrypoint(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withEntrypoint")
      selection = arg(selection, "args", Keyword.fetch!(args, :args))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container plus the given environment variable.\n\n## Required Arguments\n\n* `name` - The name of the environment variable (e.g., \"HOST\").\n* `value` - The value of the environment variable. (e.g., \"localhost\").\n\n## Optional Arguments"
    def with_env_variable(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withEnvVariable")
      selection = arg(selection, "name", Keyword.fetch!(args, :name))
      selection = arg(selection, "value", Keyword.fetch!(args, :value))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container after executing the specified command inside it.\n\n## Required Arguments\n\n* `args` - Command to run instead of the container's default command (e.g., [\"run\", \"main.go\"]).\n\n## Optional Arguments\n\n* `stdin` - Content to write to the command's standard input before closing (e.g., \"Hello world\").\n* `redirect_stdout` - Redirect the command's standard output to a file in the container (e.g., \"/tmp/stdout\").\n* `redirect_stderr` - Redirect the command's standard error to a file in the container (e.g., \"/tmp/stderr\").\n* `experimental_privileged_nesting` - Provides dagger access to the executed command.\n\nDo not use this option unless you trust the command being executed.\nThe command being executed WILL BE GRANTED FULL ACCESS TO YOUR HOST FILESYSTEM.\n* `insecure_root_capabilities` - Execute the command with all root capabilities. This is similar to running a command\nwith \"sudo\" or executing `docker run` with the `--privileged` flag. Containerization\ndoes not provide any security guarantees when using this option. It should only be used\nwhen absolutely necessary and only with trusted commands."
    def with_exec(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withExec")
      selection = arg(selection, "args", Keyword.fetch!(args, :args))

      (
        selection =
          if not is_nil(args[:stdin]) do
            arg(selection, "stdin", args[:stdin])
          else
            selection
          end

        selection =
          if not is_nil(args[:redirect_stdout]) do
            arg(selection, "redirectStdout", args[:redirect_stdout])
          else
            selection
          end

        selection =
          if not is_nil(args[:redirect_stderr]) do
            arg(selection, "redirectStderr", args[:redirect_stderr])
          else
            selection
          end

        selection =
          if not is_nil(args[:experimental_privileged_nesting]) do
            arg(
              selection,
              "experimentalPrivilegedNesting",
              args[:experimental_privileged_nesting]
            )
          else
            selection
          end

        selection =
          if not is_nil(args[:insecure_root_capabilities]) do
            arg(selection, "insecureRootCapabilities", args[:insecure_root_capabilities])
          else
            selection
          end
      )

      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Expose a network port.\n\nExposed ports serve two purposes:\n  - For health checks and introspection, when running services\n  - For setting the EXPOSE OCI field when publishing the container\n\nCurrently experimental; set _EXPERIMENTAL_DAGGER_SERVICES_DNS=0 to disable.\n\n## Required Arguments\n\n* `port` - Port number to expose\n\n## Optional Arguments\n\n* `protocol` - Transport layer network protocol\n* `description` - Optional port description"
    def with_exposed_port(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withExposedPort")
      selection = arg(selection, "port", Keyword.fetch!(args, :port))

      (
        selection =
          if not is_nil(args[:protocol]) do
            arg(selection, "protocol", args[:protocol])
          else
            selection
          end

        selection =
          if not is_nil(args[:description]) do
            arg(selection, "description", args[:description])
          else
            selection
          end
      )

      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Initializes this container from this DirectoryID.\n\n## Required Arguments\n\n* `id` - \n\n## Optional Arguments"
    @deprecated "Replaced by `withRootfs`."
    def with_fs(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withFS")
      selection = arg(selection, "id", Keyword.fetch!(args, :id))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container plus the contents of the given file copied to the given path.\n\n## Required Arguments\n\n* `path` - Location of the copied file (e.g., \"/tmp/file.txt\").\n* `source` - Identifier of the file to copy.\n\n## Optional Arguments\n\n* `permissions` - Permission given to the copied file (e.g., 0600).\n\nDefault: 0644."
    def with_file(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withFile")
      selection = arg(selection, "path", Keyword.fetch!(args, :path))
      selection = arg(selection, "source", Keyword.fetch!(args, :source))

      selection =
        if not is_nil(args[:permissions]) do
          arg(selection, "permissions", args[:permissions])
        else
          selection
        end

      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container plus the given label.\n\n## Required Arguments\n\n* `name` - The name of the label (e.g., \"org.opencontainers.artifact.created\").\n* `value` - The value of the label (e.g., \"2023-01-01T00:00:00Z\").\n\n## Optional Arguments"
    def with_label(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withLabel")
      selection = arg(selection, "name", Keyword.fetch!(args, :name))
      selection = arg(selection, "value", Keyword.fetch!(args, :value))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container plus a cache volume mounted at the given path.\n\n## Required Arguments\n\n* `path` - Location of the cache directory (e.g., \"/cache/node_modules\").\n* `cache` - Identifier of the cache volume to mount.\n\n## Optional Arguments\n\n* `source` - Identifier of the directory to use as the cache volume's root.\n* `sharing` - Sharing mode of the cache volume."
    def with_mounted_cache(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withMountedCache")
      selection = arg(selection, "path", Keyword.fetch!(args, :path))
      selection = arg(selection, "cache", Keyword.fetch!(args, :cache))

      (
        selection =
          if not is_nil(args[:source]) do
            arg(selection, "source", args[:source])
          else
            selection
          end

        selection =
          if not is_nil(args[:sharing]) do
            arg(selection, "sharing", args[:sharing])
          else
            selection
          end
      )

      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container plus a directory mounted at the given path.\n\n## Required Arguments\n\n* `path` - Location of the mounted directory (e.g., \"/mnt/directory\").\n* `source` - Identifier of the mounted directory.\n\n## Optional Arguments"
    def with_mounted_directory(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withMountedDirectory")
      selection = arg(selection, "path", Keyword.fetch!(args, :path))
      selection = arg(selection, "source", Keyword.fetch!(args, :source))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container plus a file mounted at the given path.\n\n## Required Arguments\n\n* `path` - Location of the mounted file (e.g., \"/tmp/file.txt\").\n* `source` - Identifier of the mounted file.\n\n## Optional Arguments"
    def with_mounted_file(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withMountedFile")
      selection = arg(selection, "path", Keyword.fetch!(args, :path))
      selection = arg(selection, "source", Keyword.fetch!(args, :source))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container plus a secret mounted into a file at the given path.\n\n## Required Arguments\n\n* `path` - Location of the secret file (e.g., \"/tmp/secret.txt\").\n* `source` - Identifier of the secret to mount.\n\n## Optional Arguments"
    def with_mounted_secret(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withMountedSecret")
      selection = arg(selection, "path", Keyword.fetch!(args, :path))
      selection = arg(selection, "source", Keyword.fetch!(args, :source))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container plus a temporary directory mounted at the given path.\n\n## Required Arguments\n\n* `path` - Location of the temporary directory (e.g., \"/tmp/temp_dir\").\n\n## Optional Arguments"
    def with_mounted_temp(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withMountedTemp")
      selection = arg(selection, "path", Keyword.fetch!(args, :path))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container plus a new file written at the given path.\n\n## Required Arguments\n\n* `path` - Location of the written file (e.g., \"/tmp/file.txt\").\n\n## Optional Arguments\n\n* `contents` - Content of the file to write (e.g., \"Hello world!\").\n* `permissions` - Permission given to the written file (e.g., 0600).\n\nDefault: 0644."
    def with_new_file(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withNewFile")
      selection = arg(selection, "path", Keyword.fetch!(args, :path))

      (
        selection =
          if not is_nil(args[:contents]) do
            arg(selection, "contents", args[:contents])
          else
            selection
          end

        selection =
          if not is_nil(args[:permissions]) do
            arg(selection, "permissions", args[:permissions])
          else
            selection
          end
      )

      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container with a registry authentication for a given address.\n\n## Required Arguments\n\n* `address` - Registry's address to bind the authentication to.\nFormatted as [host]/[user]/[repo]:[tag] (e.g. docker.io/dagger/dagger:main).\n* `username` - The username of the registry's account (e.g., \"Dagger\").\n* `secret` - The API key, password or token to authenticate to this registry.\n\n## Optional Arguments"
    def with_registry_auth(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withRegistryAuth")
      selection = arg(selection, "address", Keyword.fetch!(args, :address))
      selection = arg(selection, "username", Keyword.fetch!(args, :username))
      selection = arg(selection, "secret", Keyword.fetch!(args, :secret))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Initializes this container from this DirectoryID.\n\n## Required Arguments\n\n* `id` - \n\n## Optional Arguments"
    def with_rootfs(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withRootfs")
      selection = arg(selection, "id", Keyword.fetch!(args, :id))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container plus an env variable containing the given secret.\n\n## Required Arguments\n\n* `name` - The name of the secret variable (e.g., \"API_SECRET\").\n* `secret` - The identifier of the secret value.\n\n## Optional Arguments"
    def with_secret_variable(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withSecretVariable")
      selection = arg(selection, "name", Keyword.fetch!(args, :name))
      selection = arg(selection, "secret", Keyword.fetch!(args, :secret))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Establish a runtime dependency on a service. The service will be started automatically when needed and detached when it is no longer needed.\n\nThe service will be reachable from the container via the provided hostname alias.\n\nThe service dependency will also convey to any files or directories produced by the container.\n\nCurrently experimental; set _EXPERIMENTAL_DAGGER_SERVICES_DNS=0 to disable.\n\n## Required Arguments\n\n* `alias` - A name that can be used to reach the service from the container\n* `service` - Identifier of the service container\n\n## Optional Arguments"
    def with_service_binding(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withServiceBinding")
      selection = arg(selection, "alias", Keyword.fetch!(args, :alias))
      selection = arg(selection, "service", Keyword.fetch!(args, :service))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container plus a socket forwarded to the given Unix socket path.\n\n## Required Arguments\n\n* `path` - Location of the forwarded Unix socket (e.g., \"/tmp/socket\").\n* `source` - Identifier of the socket to forward.\n\n## Optional Arguments"
    def with_unix_socket(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withUnixSocket")
      selection = arg(selection, "path", Keyword.fetch!(args, :path))
      selection = arg(selection, "source", Keyword.fetch!(args, :source))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container with a different command user.\n\n## Required Arguments\n\n* `name` - The user to set (e.g., \"root\").\n\n## Optional Arguments"
    def with_user(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withUser")
      selection = arg(selection, "name", Keyword.fetch!(args, :name))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container with a different working directory.\n\n## Required Arguments\n\n* `path` - The path to set as the working directory (e.g., \"/app\").\n\n## Optional Arguments"
    def with_workdir(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withWorkdir")
      selection = arg(selection, "path", Keyword.fetch!(args, :path))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container minus the given environment variable.\n\n## Required Arguments\n\n* `name` - The name of the environment variable (e.g., \"HOST\").\n\n## Optional Arguments"
    def without_env_variable(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withoutEnvVariable")
      selection = arg(selection, "name", Keyword.fetch!(args, :name))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Unexpose a previously exposed port.\n\nCurrently experimental; set _EXPERIMENTAL_DAGGER_SERVICES_DNS=0 to disable.\n\n## Required Arguments\n\n* `port` - Port number to unexpose\n\n## Optional Arguments\n\n* `protocol` - Port protocol to unexpose"
    def without_exposed_port(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withoutExposedPort")
      selection = arg(selection, "port", Keyword.fetch!(args, :port))

      selection =
        if not is_nil(args[:protocol]) do
          arg(selection, "protocol", args[:protocol])
        else
          selection
        end

      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container minus the given environment label.\n\n## Required Arguments\n\n* `name` - The name of the label to remove (e.g., \"org.opencontainers.artifact.created\").\n\n## Optional Arguments"
    def without_label(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withoutLabel")
      selection = arg(selection, "name", Keyword.fetch!(args, :name))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container after unmounting everything at the given path.\n\n## Required Arguments\n\n* `path` - Location of the cache directory (e.g., \"/cache/node_modules\").\n\n## Optional Arguments"
    def without_mount(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withoutMount")
      selection = arg(selection, "path", Keyword.fetch!(args, :path))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container without the registry authentication of a given address.\n\n## Required Arguments\n\n* `address` - Registry's address to remove the authentication from.\nFormatted as [host]/[user]/[repo]:[tag] (e.g. docker.io/dagger/dagger:main).\n\n## Optional Arguments"
    def without_registry_auth(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withoutRegistryAuth")
      selection = arg(selection, "address", Keyword.fetch!(args, :address))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves this container with a previously added Unix socket removed.\n\n## Required Arguments\n\n* `path` - Location of the socket to remove (e.g., \"/tmp/socket\").\n\n## Optional Arguments"
    def without_unix_socket(%__MODULE__{} = container, args) do
      selection = select(container.selection, "withoutUnixSocket")
      selection = arg(selection, "path", Keyword.fetch!(args, :path))
      %Dagger.Container{selection: selection, client: container.client}
    end
  )

  (
    @doc "Retrieves the working directory for all commands.\n\n## Required Arguments\n\n\n\n## Optional Arguments"
    def workdir(%__MODULE__{} = container) do
      selection = select(container.selection, "workdir")
      execute(selection, container.client)
    end
  )
end
