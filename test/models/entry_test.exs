defmodule TconchieBackend.EntryTest do
  use TconchieBackend.ModelCase

  alias TconchieBackend.Entry

  @valid_attrs %{author_id: 42, content: "some content", title: "some title"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Entry.changeset(%Entry{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Entry.changeset(%Entry{}, @invalid_attrs)
    refute changeset.valid?
  end
end
