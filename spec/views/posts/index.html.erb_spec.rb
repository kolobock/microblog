require 'spec_helper'
require 'ability_helper'

describe "posts/index" do
    
  before(:each) do
    setup_ability
    # @ability.can :manage, Post
    assign(:posts, [
      stub_model(Post),
      stub_model(Post)
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
