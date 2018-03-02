defmodule NinjaRMM do
  @moduledoc """
  A convenience wrapper around the NinjaRMM api.
  """

  alias NinjaRMM.Request

  @doc """
  Check API availability and verify your request credentials. Returns a 204 HTTP status code for a valid request.
  """
  def ping() do
    Request.process(:get, "/v1/ping")
  end

  @doc """
  Retrieve a list of all available organizations (customers).
  """
  def list_customers() do
    Request.process(:get, "/v1/customers")
  end

  @doc """
  Retrieve a specific organization (customer).
  """
  def get_customer(id) do
    Request.process(:get, "/v1/customers/#{id}")
  end

  @doc """
  Retrieve a list of all available devices.  
  """
  def list_devices() do
    Request.process(:get, "/v1/devices")
  end

  @doc """
  Retrieve a specific devices.  
  """
  def get_device(id) do
    Request.process(:get, "/v1/devices/#{id}")
  end

  @doc """
  Retrieve list of alerts. Alert responses will contain both device and customer information.  
  """
  def list_alerts() do
    Request.process(:get, "/v1/alerts")
  end

  @doc """
  Retrieve a specific of alert. Alert responses will contain both device and customer information.  
  """
  def get_alert(id) do
    Request.process(:get, "/v1/alerts/#{id}")
  end

  @doc """
  Reset an alert. Only alerts with can_reset can be deleted. Returns a 204 HTTP status code for a successful request.
  """
  def delete_alert(id) do
    Request.process(:delete, "/v1/alerts/#{id}")
  end
end
