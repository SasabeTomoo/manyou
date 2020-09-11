require 'rails_helper'
RSpec.describe Task, type: :model do
  it "is valid with a name, content" do
    task = Task.new(
      name: 'DIC',
      content: 'Hello')
      expect(task).to be_valid
  end
  it "is invalid without a name" do
    task = Task.new(
      name: '',
      content: 'Hello')
      expect(task).to be_invalid
  end
  it "is invalid without a content" do
    task = Task.new(
      name: 'DIC',
      content: '')
      expect(task).to be_invalid
  end
end