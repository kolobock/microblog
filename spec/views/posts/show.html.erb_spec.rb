require 'spec_helper'
require 'ability_helper'

describe "posts/show" do
  before(:each) do
    setup_ability
    # @ability.can :manage, Post
    @post = assign(:post, stub_model(Post))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
