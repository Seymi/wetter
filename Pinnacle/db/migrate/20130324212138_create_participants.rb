class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :participant_name
      t.integer :contestantnum
      t.integer :rotnum
      t.string :visiting_home_draw
      t.integer :event_game_number

      t.timestamps
    end
  end
end
