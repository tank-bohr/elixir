defmodule IEx.App do
  @moduledoc false

  use Application

  def start(_type, _args) do
    with :default <- Application.get_env(:stdlib, :shell_multiline_prompt, :default) do
      Application.put_env(:stdlib, :shell_multiline_prompt, {IEx.Config, :prompt})
    end

    children = [IEx.Config, IEx.Broker, IEx.Pry]
    Supervisor.start_link(children, strategy: :one_for_one, name: IEx.Supervisor)
  end
end
