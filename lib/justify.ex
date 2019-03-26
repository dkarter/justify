defmodule Justify do
  @doc """
  Validates the given field has a value of `true`.

  ## Options

  * `:message` - error message, defaults to "must be accepted"
  """
  @spec validate_acceptance(Justify.Dataset.t(), atom, Keyword.t()) :: Justify.Dataset.t()
  defdelegate validate_acceptance(dataset, field, opts \\ []),
    to: Justify.Validators.Acceptance,
    as: :call

  @doc """
  Adds an error to the dataset.

  An optional keyword list can be used to provide additional contextual
  information about the error.
  """
  @spec add_error(Justify.Dataset.t(), atom, String.t(), Keyword.t()) :: Justify.Dataset.t()
  def add_error(dataset, field, message, keys \\ []) do
    errors =
      dataset
      |> Map.get(:errors)
      |> Enum.concat([{ field, { message, keys } }])

    %{ dataset | errors: errors, valid?: false }
  end
end
