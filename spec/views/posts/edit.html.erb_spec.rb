require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :titulo => "MyString",
      :conteudo => "MyText"
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input#post_titulo[name=?]", "post[titulo]"

      assert_select "textarea#post_conteudo[name=?]", "post[conteudo]"
    end
  end
end
