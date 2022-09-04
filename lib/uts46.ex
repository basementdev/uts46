defmodule Uts46 do
  @moduledoc """
  Documentation for `Uts46`.
  """

  use Rustler, otp_app: :uts46, crate: "uts46_native"

  @default_opts %{
    unicode: false,
    std3_rules: false,
    transitional_processing: false
  }

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
