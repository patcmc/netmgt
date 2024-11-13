# frozen_string_literal: true

class CreateUserContacts < ActiveRecord::Migration[7.2]
  def change
    create_table(:user_contacts) do |t|
      t.references(:user, null: false, foreign_key: true)
      t.string(:name)
      t.string(:email)
      t.string(:phone)
      t.text(:address)
      t.text(:tags)
      t.timestamps
    end
  end
end
