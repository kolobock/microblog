require 'spec_helper'

describe Post do
  context 'should validate' do
    it 'name presence' do
      expect {
        Post.create!(message: 'test message')
      }.to raise_error(/#{Post.human_attribute_name(:name)} can't be blank/)
    end
    it 'name lenght' do
      expect {
        Post.create!(message: 'test message', name: 'n')
      }.to raise_error(/#{Post.human_attribute_name(:name)} is too short \(minimum is 3 characters\)/)
    end
      
    it 'message presence' do
      expect {
        Post.create!(name: 'test name')
      }.to raise_error(/#{Post.human_attribute_name(:message)} can't be blank/)
    end    
    it 'message length' do
      expect {
        Post.create!(name: 'test name', message: 'test')
      }.to raise_error(/#{Post.human_attribute_name(:message)} is too short \(minimum is 5 characters\)/)
    end
  end
  
  it 'should create new post' do
    expect { Post.create!(name: 'test name', message: 'test message') }.to change(Post, :count).by(1)
  end
end
