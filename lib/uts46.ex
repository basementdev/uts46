defmodule Uts46 do
  @moduledoc """
  Documentation for `Uts46`.
  """

  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :uts46,
    crate: "uts46_native",
    base_url: "https://github.com/basementdev/uts46/releases/download/v#{version}",
    force_build: System.get_env("RUSTLER_PRECOMPILATION_UTS46_BUILD") in ["1", "true"],
    version: version

  @default_opts %{
    unicode: false,
    std3_rules: false,
    transitional_processing: false
  }

  @doc """

  Examples:

  iex> Uts46.encode("aBcDeFg.eth")
  "abcdefg.eth"

  iex> Uts46.encode("aBcDeFg.eth",
  ...>   unicode: true,
  ...>   std3_rules: true,
  ...>   transitional_processing: false
  ...> )
  "abcdefg.eth"

  iex> Uts46.encode("abC_DeF.eth",
  ...>   unicode: true,
  ...>   std3_rules: true,
  ...>   transitional_processing: false
  ...> )
  nil
  """
  def encode(name, opts \\ []) do
    opts = opts |> Map.new()
    opts = Map.merge(@default_opts, opts)

    case opts.unicode do
      true -> _encode_unicode(name, opts)
      false -> _encode_ascii(name, opts)
    end
  end

  # When your NIF is loaded, it will override this function.
  defp _encode_ascii(_a, _opts), do: :erlang.nif_error(:nif_not_loaded)
  defp _encode_unicode(_a, _opts), do: :erlang.nif_error(:nif_not_loaded)
end
