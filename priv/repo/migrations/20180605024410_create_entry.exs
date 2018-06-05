defmodule TconchieBackend.Repo.Migrations.CreateEntry do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :title, :string
      add :content, :string
      add :author_id, :integer

      timestamps()
    end
  end
end
