class CreateLanguageCurriculums < ActiveRecord::Migration
  def change
    create_table :language_curriculums do |t|
      t.references :language, index: true, foreign_key: true
      t.references :curriculum, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
