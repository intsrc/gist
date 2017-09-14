class AddLanguageToSnippets < ActiveRecord::Migration[5.1]
  def change
    add_column :snippets, :language, :string
  end
end
