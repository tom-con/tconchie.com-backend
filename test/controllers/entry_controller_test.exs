defmodule TconchieBackend.EntryControllerTest do
  use TconchieBackend.ConnCase

  alias TconchieBackend.Entry
  @valid_attrs %{author_id: 42, content: "some content", title: "some title"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, entry_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    entry = Repo.insert! %Entry{}
    conn = get conn, entry_path(conn, :show, entry)
    assert json_response(conn, 200)["data"] == %{"id" => entry.id,
      "title" => entry.title,
      "content" => entry.content,
      "author_id" => entry.author_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, entry_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, entry_path(conn, :create), entry: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Entry, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, entry_path(conn, :create), entry: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    entry = Repo.insert! %Entry{}
    conn = put conn, entry_path(conn, :update, entry), entry: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Entry, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    entry = Repo.insert! %Entry{}
    conn = put conn, entry_path(conn, :update, entry), entry: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    entry = Repo.insert! %Entry{}
    conn = delete conn, entry_path(conn, :delete, entry)
    assert response(conn, 204)
    refute Repo.get(Entry, entry.id)
  end
end
