defmodule RcTest do
  use ExUnit.Case

  test "doesn't crash on open, prepare, GC in quick succession" do
    Enum.each(1..10_000, fn _ ->
      {:ok, task_pid} = Task.start(fn ->
        {:ok, db} = Sqlitex.Server.start_link(":memory:")
        Sqlitex.Server.prepare(db, "PRAGMA foreign_keys = ON")
      end)
      Process.sleep(8)
      Process.exit(task_pid, :normal)
      # {:ok, [[foreign_keys: 1]]} = Sqlitex.Server.query(db, "PRAGMA foreign_keys")
    end)
  end
end
