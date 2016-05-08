# scraps.rb

class CatsController < ApplicationController
  self.render json: Cat.all

  def create
    { "cat": {"name": "Sally"}}
  end

  cat = Cat.new(name: params[:cat][:name])

  render json: cat.errors.full_messages, status: :unprocessable_entity

class Toy <ActiveRecord::Base
  TYPES = ["a", "b", "c"]
  validates :cat_id, :name, :type, presence: true
  validates :type, inclusion: TYPES

  def destroy
    toy = Toy.find(params[:id])
    toy.destroy
    render json: toy
  end

  private
  def toy_params
    self.params[:toy].permit(:name)
  end


  COLORS = %w(black white orange gray tabby calico brown)

  validates :color, inclusion: COLORS
  validates :sex, inclusion: %w(M F)

  def age
    time_ago_in_words(birth_date)
  end


flash.now[:errors] = @user.errors.full_messages
#from reddit clone



class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false

      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end
#no commas in table create

validates :password, length {minimum: 6, allow_nil: true}
