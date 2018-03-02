defmodule NinjaRMM.Request do
  @moduledoc false

  alias NinjaRMM.Response

  def process(method, endpoint) do
    method_string = method |> Atom.to_string() |> String.upcase()

    ninja_api_url = Application.get_env(:ninjarmm, :url, "https://api.ninjarmm.com")

    with {:ok, now} <- get_rfc2616_date(),
         {:ok, header} <- authorization_header(now, method_string, endpoint),
         {:ok, response} <-
           apply(HTTPoison, method, [
             ninja_api_url <> endpoint,
             [Authorization: header, Date: now]
           ]),
         {:ok, response} <- Response.process(response) do
      {:ok, response}
    else
      err ->
        err
    end
  end

  defp get_rfc2616_date() do
    Timex.format(Timex.now(), "{WDshort}, {D} {Mshort} {YYYY} {h24}:{m}:{s} {Zabbr}")
  end

  defp authorization_header(date, verb, canonicalized_resource) do
    access_key = Application.get_env(:ninjarmm, :access_key_id, "")
    secret_access_key = Application.get_env(:ninjarmm, :secret_access_key_id, "")

    signature =
      :sha
      |> :crypto.hmac(
        secret_access_key,
        Base.encode64("#{verb}\n\n\n#{date}\n#{canonicalized_resource}")
      )
      |> Base.encode64()

    {:ok, "NJ #{access_key}:#{signature}"}
  end
end
