# NinjaRMM

NinjaRMM convenience wrapper around HTTPoison. Does the hard work of signing API calls, and decoding responses using Jason.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ninjarmm` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ninjarmm, git: "https://github.com/theangryangel/NinjaRMMEx.git"}
  ]
end
```

# Ninja Key configuration

```
config :ninjarmm,
  access_key_id: "yourkey"
  secret_access_key: "yoursecrekey"
```

To configure using env variables;
```
config :ninjarmm,
  access_key_id: {:system, "NINJARMM_ACCESS_KEY_ID"}
  secret_access_key: {:system, "NINJARMM_SECRET_ACCESS_KEY"}
```
