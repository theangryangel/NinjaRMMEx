defmodule NinjaRMM.Response do
  @moduledoc false

  def process(%HTTPoison.Response{status_code: status_code, body: body})
      when status_code >= 200 and status_code < 300 do
    {:ok, decode_body(body)}
  end

  def process(%HTTPoison.Response{status_code: status_code, body: body})
      when status_code >= 400 and status_code < 500 do
    {:error, decode_body(body)}
  end

  def process(response) do
    {:error, response}
  end

  defp decode_body(body) do
    if !is_nil(body) and String.length(body) > 0 do
      {:ok, response} = Jason.decode(body)

      response
    else
      nil
    end
  end
end
