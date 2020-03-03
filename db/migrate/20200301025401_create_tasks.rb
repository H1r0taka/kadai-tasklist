# これは、taskモデルのマイグレーションファイルです！
# これを実行することで、tasksテーブルがkadai-tasklist_developmentデータベースに作られます
# rails db:migrate で実行されます！

class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|# tasks というテーブルを作成する => モデル名の小文字かつ複数形
    # Taskモデルを作ったので、tasks テーブルという名前に決まる
      t.string :content
      # => contentカラムが追加される
      t.timestamps
      # => created_at, updated_atカラムが追加される
    end
  end
end