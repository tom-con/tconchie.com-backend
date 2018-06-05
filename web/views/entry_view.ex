defmodule TconchieBackend.EntryView do
  use TconchieBackend.Web, :view

  def render("index.json", %{entries: entries}) do
    %{data: render_many(entries, TconchieBackend.EntryView, "entry.json")}
  end

  def render("show.json", %{entry: entry}) do
    %{data: render_one(entry, TconchieBackend.EntryView, "entry.json")}
  end

  def render("entry.json", %{entry: entry}) do
    %{id: entry.id,
      title: entry.title,
      content: entry.content,
      author_id: entry.author_id}
  end
end
