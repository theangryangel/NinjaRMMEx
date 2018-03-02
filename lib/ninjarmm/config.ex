defmodule NinjaRMM.Config do
  @moduledoc false

  def get(key, default) do
    retreive(Application.get_env(:ninjarmm, key, default))
  end

  defp retreive({:system, key}) do
    System.get_env(key)
  end

  defp retreive(value), do: value

end
