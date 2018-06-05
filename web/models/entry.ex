defmodule TconchieBackend.Entry do
  use TconchieBackend.Web, :model

  schema "entries" do
    field :title, :string
    field :content, :string
    field :author_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :content, :author_id])
    |> validate_required([:title, :content, :author_id])
  end
end
